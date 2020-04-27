## meanOfAllPixels
<img src="images/mini_clij1_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Determines the mean average of all pixels in a given image. It will be stored in a new row of ImageJs
Results table in the column 'Mean'.

### Usage in ImageJ macro
```
Ext.CLIJ2_meanOfAllPixels(Image source);
```


### Usage in Matlab
```
// init CLIJ and GPU
clij2 = init_clatlab();

% get input parameters
source = clij2.pushMat(source);
```

```
% Execute operation on GPU
double resultMeanOfAllPixels = clij2.meanOfAllPixels(clij, source);
```

```
% show result
System.out.println(resultMeanOfAllPixels);

% cleanup memory on GPU
clij2.release(source);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer source = clij2.push(sourceImagePlus);
```

```
// Execute operation on GPU
double resultMeanOfAllPixels = clij2.meanOfAllPixels(clij, source);
```

```
//show result
System.out.println(resultMeanOfAllPixels);

// cleanup memory on GPU
clij2.release(source);
```


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
