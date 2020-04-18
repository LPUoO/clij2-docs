## maximum3DSliceBySliceSphere
<img src="images/mini_empty_logo.png"/><img src="images/mini_empty_logo.png"/><img src="images/mini_empty_logo.png"/>

Computes the local maximum of a pixels ellipsoidal 2D neighborhood in an image stack slice by slice. 

The ellipses size is specified by its half-width and half-height (radius).

This filter is applied slice by slice in 2D.

### Usage in ImageJ macro
```
Ext.CLIJ2_maximum3DSliceBySliceSphere(Image source, ByRef Image destination, Number radiusX, Number radiusY);
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
clij2.maximum3DSliceBySliceSphere(clij, source, destination, radiusX, radiusY);
```

```
//show result
destinationImagePlus = clij2.pull(destination);
destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(source);
clij2.release(destination);
```


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
