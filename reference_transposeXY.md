## transposeXY
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Transpose X and Y axes of an image.

### transposeXY often followes after
* <a href="reference_crop2D">crop2D</a> (2)


### transposeXY is often followed by
* <a href="reference_touchMatrixToMesh">touchMatrixToMesh</a> (2)


### Usage in ImageJ macro
```
Ext.CLIJ2_transposeXY(Image input, ByRef Image destination);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer input = clij2.push(inputImagePlus);
destination = clij.create(input);
```

```
// Execute operation on GPU
clij2.transposeXY(clij, input, destination);
```

```
//show result
destinationImagePlus = clij2.pull(destination);
destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(input);
clij2.release(destination);
```




### Example scripts
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/interactive_webcam_acquisition_analysis.ijm"><img src="images/language_macro.png" height="20"/></a> [interactive_webcam_acquisition_analysis.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/interactive_webcam_acquisition_analysis.ijm)  


[Back to CLIJ documentation](https://clij.github.io/)

[Imprint](https://clij.github.io/imprint)
