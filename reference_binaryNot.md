## binaryNot
<img src="images/mini_clij1_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Computes a binary image (containing pixel values 0 and 1) from an image X by negating its pixel values
x using the binary NOT operator !
All pixel values except 0 in the input image are interpreted as 1.

<pre>f(x) = !x</pre>

### binaryNot often follows after
* <a href="reference_thresholdHuang">thresholdHuang</a> (2)


### binaryNot is often followed by
* <a href="reference_connectedComponentsLabelingBox">connectedComponentsLabelingBox</a> (3)


### Usage in ImageJ macro
```
Ext.CLIJ2_binaryNot(Image source, Image destination);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer source = clij2.push(sourceImagePlus);
destination = clij.create(source);
```

```
// Execute operation on GPU
clij2.binaryNot(clij, source, destination);
```

```
//show result
destinationImagePlus = clij2.pull(destination);
destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(source);
clij2.release(destination);
```




### Example notebooks
<a href="https://github.com/clij/clij2-docs/md/mean_of_touching_neighbors"><img src="images/language_macro.png" height="20"/></a> [mean_of_touching_neighbors](https://github.com/clij/clij2-docs/md/mean_of_touching_neighbors)  




### Example scripts
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/interactive_webcam_acquisition_stripe_analysis.ijm"><img src="images/language_macro.png" height="20"/></a> [interactive_webcam_acquisition_stripe_analysis.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/interactive_webcam_acquisition_stripe_analysis.ijm)  
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/mean_of_touching_neighbors.ijm"><img src="images/language_macro.png" height="20"/></a> [mean_of_touching_neighbors.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/mean_of_touching_neighbors.ijm)  


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
