## median2DBox
<img src="images/mini_clij1_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Computes the local median of a pixels rectangular neighborhood. The rectangle is specified by 
its half-width and half-height (radius).

For technical reasons, the area of the rectangle must have less than 1000 pixels.

### median2DBox is often followed by
* <a href="reference_thresholdHuang">thresholdHuang</a> (2)


### Usage in ImageJ macro
```
Ext.CLIJ2_median2DBox(Image source, Image destination, Number radiusX, Number radiusY);
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
int radiusX = 10;
int radiusY = 20;
```

```
// Execute operation on GPU
clij2.median2DBox(clij, source, destination, radiusX, radiusY);
```

```
//show result
destinationImagePlus = clij2.pull(destination);
destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(source);
clij2.release(destination);
```




### Example scripts
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/interactive_webcam_acquisition_stripe_analysis.ijm"><img src="images/language_macro.png" height="20"/></a> [interactive_webcam_acquisition_stripe_analysis.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/interactive_webcam_acquisition_stripe_analysis.ijm)  


[Back to CLIJ documentation](https://clij.github.io/)

[Imprint](https://clij.github.io/imprint)
