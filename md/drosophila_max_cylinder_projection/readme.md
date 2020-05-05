

# Drosophila embryo cell counting
Authors: Robert Haase, Daniela Vorkel, April 2020

[Source](https://github.com/clij/clij2-docs/tree/master/src/main/macro/drosophila_max_cylinder_projection.ijm)

In this example workflow, we estimate a nuclei count in a dataset of *Drosophila melanogaster*, 
using spot detection on a cylindrical maximum intensity projection.

The workflow got originally published in the [CLIJ paper](https://doi.org/10.1038/s41592-019-0650-1).
Now, this is an adapted version using CLIJ2.

The workflow mainly processes 3D image stacks. For visualisation purpose, this
notebook shows maximum projections.

Initialize GPU:

<pre class="highlight">

run("CLIJ2 Macro Extensions", "cl_device=");
Ext.CLIJ2_clear();

</pre>

## The dataset
We process a dataset of a *Drosophila melanogaster* embryo, expressing histone-RFP 
([Flybase 23651](http://flybase.org/reports/FBst0023651)). 
It was acquired from two opposing perspectives, using a custom multi-view light sheet microscope. 
Afterwards ans "on the fly", the data was fused and downsampled by a factor of two, 
resulting in a voxel size of 0.52x0.52x2 microns. The images were taken from a time-lapse
recording, while three embryos were mounted in an FEP tube at once and got subsequently acquired.
The full dataset is available 
[online](https://bds.mpi-cbg.de/CLIJ_benchmarking_data/000300.raw.tif).

Load data and push it to GPU memory:

<pre class="highlight">
// clean up first
run("Close All");

// load a specific time point
timepoint = 300;
folder = "C:/Users/Rober/Downloads/";
strNumber = "000000" + timepoint;
filename = substring(strNumber, lengthOf(strNumber) - 6) + ".raw.tif";
print(folder + filename);
open(folder + filename);
input = getTitle();

// measure start time of the whole workflow
startTime = getTime();

// push the image to GPU memory
Ext.CLIJ2_push(input);
Ext.CLIJ2_reportMemory();

// close the window showing the dataset
close();

</pre>
<pre>
> C:/Users/Rober/Downloads/000300.raw.tif
> GPU contains 1 images.
> - 000300.raw.tif[net.haesleinhuepf.clij.clearcl.ClearCLPeerPointer@62fc8631] 121.0 Mb
> = 121.0 Mb
>  
</pre>

## Bit-Depth conversion
We convert the dataset into a 32-bit float, in order to deliver smooth results while
performing subsequent processing steps. 

<pre class="highlight">
Ext.CLIJ2_convertFloat(input, input_float);
Ext.CLIJ2_reportMemory();
show(input_float, "Input image");

</pre>
<pre>
> GPU contains 2 images.
> - 000300.raw.tif[net.haesleinhuepf.clij.clearcl.ClearCLPeerPointer@62fc8631] 121.0 Mb
> - CLIJ2_convertFloat_result15[net.haesleinhuepf.clij.clearcl.ClearCLPeerPointer@1e7fdd0b] 242.0 Mb
> = 363.0 Mb
>  
</pre>
<a href="image_1588706706845.png"><img src="image_1588706706845.png" width="224" alt="CLIJ2_maximumZProjection_result16"/></a>

## Noise and background removal
We use the difference-of-Gaussian (DoG) technique to remove noise and background 
intensity. As the voxel size is different in X/Y compared to Z, we only perform 
the Gaussian blur in X/Y-plane. We achieve this by setting both sigmas to "0" 
in Z-plane:

<pre class="highlight">
sigma1 = 2;
sigma2 = 6;
Ext.<a href="https://clij.github.io/clij2-docs/reference_differenceOfGaussian3D">CLIJ2_differenceOfGaussian3D</a>(input_float, background_subtracted, sigma1, sigma1, 0, sigma2, sigma2, 0);
show(background_subtracted, "Background subtracted");
</pre>
<a href="image_1588706707390.png"><img src="image_1588706707390.png" width="224" alt="CLIJ2_maximumZProjection_result18"/></a>

We remove all negative and zero pixel intensities to detect maxima intensity above zero, only. 

<pre class="highlight">
Ext.<a href="https://clij.github.io/clij2-docs/reference_maximumImageAndScalar">CLIJ2_maximumImageAndScalar</a>(background_subtracted, positive_stack, 1.0);
show(positive_stack, "Positive stack");
</pre>
<a href="image_1588706708119.png"><img src="image_1588706708119.png" width="224" alt="CLIJ2_maximumZProjection_result20"/></a>

## Resampling
All following transformations become mathematically easier to perform, when we change 
the dataset to consist only of isotropic voxels. Therefore, we initially resample the 
voxel dimensions as following:

<pre class="highlight">
resampleX = 1.0 / 0.52;
resampleY = 1.0 / 0.52;
resampleZ = 1.0 / 2.0;
linearInterpolation = true;

Ext.<a href="https://clij.github.io/clij2-docs/reference_resample">CLIJ2_resample</a>(positive_stack, resampled, resampleX, resampleY, resampleZ, linearInterpolation);
show(resampled, "Resampled")
</pre>
<a href="image_1588706708599.png"><img src="image_1588706708599.png" width="224" alt="CLIJ2_maximumZProjection_result22"/></a>

## Spatial transformations
Goal of this workflow is to perform a maximum projection from the center of the embryo to the surface. 
Therefore we interpret the embryo as a cylinder with its axis along the anterior-posterior direction.
The maximum projection, from the center to the hull, consists of a radial and a maximum projection.
In order to apply the radial projection, which assigns to the X/Y-plane, we need to rotate the embryo first.

### Reslicing X/Y-planes along anterior-posterior direction

<pre class="highlight">
Ext.<a href="https://clij.github.io/clij2-docs/reference_resliceTop">CLIJ2_resliceTop</a>(resampled, reslicedFromTop);
show(reslicedFromTop, "Resliced from top");

</pre>
<a href="image_1588706708785.png"><img src="image_1588706708785.png" width="224" alt="CLIJ2_maximumZProjection_result24"/></a>

### Radial reslicing

<pre class="highlight">
number_of_angles = 360;
angle_step = 1;
startAngleDegrees = 0;
Ext.<a href="https://clij.github.io/clij2-docs/reference_getDimensions">CLIJ2_getDimensions</a>(reslicedFromTop, width, height, depth);
// we reslice off-center, because the embryo is not centered within the dataset
centerX = width / 2 - 50; 
centerY = height / 2;
scaleFactorX = 1.0;
scaleFactorY = 1.0;
Ext.<a href="https://clij.github.io/clij2-docs/reference_resliceRadial">CLIJ2_resliceRadial</a>(reslicedFromTop, radialResliced, number_of_angles, angle_step, startAngleDegrees, centerX, centerY, scaleFactorX, scaleFactorY);
show(radialResliced, "Radial projection");

</pre>
<a href="image_1588706708936.png"><img src="image_1588706708936.png" width="224" alt="CLIJ2_maximumZProjection_result26"/></a>

### Reslicing from inside to outside

<pre class="highlight">
Ext.<a href="https://clij.github.io/clij2-docs/reference_resliceLeft">CLIJ2_resliceLeft</a>(radialResliced, reslicedFromLeft);
show(reslicedFromLeft, "Resliced from inside to outside");

</pre>
<a href="image_1588706709076.png"><img src="image_1588706709076.png" width="224" alt="CLIJ2_maximumZProjection_result28"/></a>

## Maximum projection

<pre class="highlight">

Ext.<a href="https://clij.github.io/clij2-docs/reference_maximumZProjection">CLIJ2_maximumZProjection</a>(reslicedFromLeft, maxProjected);

</pre>

## Spot detection
Before counting spots, we need to retrieve
the image back from GPU memory to CPU memory.

<pre class="highlight">

// pull result image back from GPU
Ext.CLIJ_pull(maxProjected);

</pre>
<a href="image_1588706709173.png"><img src="image_1588706709173.png" width="224" alt="CLIJ2_maximumZProjection_result29"/></a>

For spot detection we use the ImageJs `Find Maxima` method.

<pre class="highlight">
noiseThreshold = 5;
run("Find Maxima...", "noise=" + noiseThreshold + " output=[Point Selection]");

// count spots
run("Clear Results");
run("Measure");
print("Number of spots found:" + nResults());
run("Clear Results");

run("Flatten");

</pre>
<pre>
> Number of spots found:2454
</pre>
<a href="image_1588706711003.png"><img src="image_1588706711003.png" width="224" alt="CLIJ2_maximumZProjection_result29-1"/></a>


# Performance evaluation
Finally a time measurement. Note that performing this workflow as a ImageJ macro markdown 
is slower, because intermediate results are saved to disc.

<pre class="highlight">
print("The whole workflow took " + (getTime() - startTime) + " msec");

</pre>
<pre>
> The whole workflow took 4733 msec
</pre>

Let's also see how much memory this workflow used. By the end, cleaning up remains important.

<pre class="highlight">
Ext.CLIJ2_reportMemory();

// finally, clean up
Ext.CLIJ2_clear();

</pre>
<pre>
> GPU contains 9 images.
> - CLIJ2_differenceOfGaussian3D_result17[net.haesleinhuepf.clij.clearcl.ClearCLPeerPointer@6961b130] 242.0 Mb
> - CLIJ2_resliceRadial_result25[net.haesleinhuepf.clij.clearcl.ClearCLPeerPointer@d2aeef3] 130.8 Mb
> - CLIJ2_resliceLeft_result27[net.haesleinhuepf.clij.clearcl.ClearCLPeerPointer@1dd95f90] 130.8 Mb
> - 000300.raw.tif[net.haesleinhuepf.clij.clearcl.ClearCLPeerPointer@62fc8631] 121.0 Mb
> - CLIJ2_convertFloat_result15[net.haesleinhuepf.clij.clearcl.ClearCLPeerPointer@1e7fdd0b] 242.0 Mb
> - CLIJ2_resample_result21[net.haesleinhuepf.clij.clearcl.ClearCLPeerPointer@3304ba4e] 130.6 Mb
> - CLIJ2_resliceTop_result23[net.haesleinhuepf.clij.clearcl.ClearCLPeerPointer@5708752f] 130.6 Mb
> - CLIJ2_maximumZProjection_result29[net.haesleinhuepf.clij.clearcl.ClearCLPeerPointer@d0f544b] 748.1 kb
> - CLIJ2_maximumImageAndScalar_result19[net.haesleinhuepf.clij.clearcl.ClearCLPeerPointer@5a7dafa5] 242.0 Mb
> = 1.3 Gb
>  
</pre>

The following methods are convenient for a proper visualisation in a notebook:

<pre class="highlight">
function show(input, text) {
	Ext.<a href="https://clij.github.io/clij2-docs/reference_maximumZProjection">CLIJ2_maximumZProjection</a>(input, max_projection);
	Ext.CLIJ2_pull(max_projection);
	setColor(100000);
	drawString(text, 20, 20);
	Ext.CLIJ2_release(max_projection);
}
</pre>




