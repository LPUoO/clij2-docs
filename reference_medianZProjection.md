## medianZProjection
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Determines the median projection of an image stack along Z.

### Usage in ImageJ macro
```
Ext.CLIJ2_medianZProjection(Image source, ByRef Image destination);
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
clij2.medianZProjection(clij, source, destination);
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
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/medianZProjectionComparion.ijm"><img src="images/language_macro.png" height="20"/></a> [medianZProjectionComparion.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/medianZProjectionComparion.ijm)  
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/projections.ijm"><img src="images/language_macro.png" height="20"/></a> [projections.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/projections.ijm)  


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
