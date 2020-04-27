## standardDeviationOfMaskedPixels
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Determines the standard deviation of all pixels in an image which have non-zero value in a corresponding mask image. 

The value will be stored in a new row of ImageJs
Results table in the column 'Masked_standard_deviation'.

### Usage in ImageJ macro
```
Ext.CLIJ2_standardDeviationOfMaskedPixels(Image source, Image mask);
```


### Usage in Matlab
```
// init CLIJ and GPU
clij2 = init_clatlab();

% get input parameters
source = clij2.pushMat(source);
mask = clij2.pushMat(mask);
```

```
% Execute operation on GPU
double resultStandardDeviationOfMaskedPixels = clij2.standardDeviationOfMaskedPixels(clij, source, mask);
```

```
% show result
System.out.println(resultStandardDeviationOfMaskedPixels);

% cleanup memory on GPU
clij2.release(source);
clij2.release(mask);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer source = clij2.push(sourceImagePlus);
ClearCLBuffer mask = clij2.push(maskImagePlus);
```

```
// Execute operation on GPU
double resultStandardDeviationOfMaskedPixels = clij2.standardDeviationOfMaskedPixels(clij, source, mask);
```

```
//show result
System.out.println(resultStandardDeviationOfMaskedPixels);

// cleanup memory on GPU
clij2.release(source);
clij2.release(mask);
```


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
