## meanOfPixelsAboveThreshold
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Determines the mean intensity in a threshleded image. 

But only in pixels which are above a given threshold.

### Usage in ImageJ macro
```
Ext.CLIJ2_meanOfPixelsAboveThreshold(Image source, Number threshold);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer source = clij2.push(sourceImagePlus);
float threshold = 1.0;
```

```
// Execute operation on GPU
double resultMeanOfPixelsAboveThreshold = clij2.meanOfPixelsAboveThreshold(clij, source, threshold);
```

```
//show result
System.out.println(resultMeanOfPixelsAboveThreshold);

// cleanup memory on GPU
clij2.release(source);
```


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
