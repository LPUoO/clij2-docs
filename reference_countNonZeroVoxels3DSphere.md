## countNonZeroVoxels3DSphere
<img src="images/mini_clij1_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Counts non-zero voxels in a sphere around every voxel.Put the number in the result image.

### Usage in ImageJ macro
```
Ext.CLIJ2_countNonZeroVoxels3DSphere(Image source, Image destination, Number radiusX, Number radiusY, Number radiusZ);
```


### Usage in Matlab
```
// init CLIJ and GPU
clij2 = init_clatlab();

% get input parameters
source = clij2.pushMat(source);
destination = clij2.create(source);
radiusX = 10;
radiusY = 20;
radiusZ = 30;
```

```
% Execute operation on GPU
clij2.countNonZeroVoxels3DSphere(clij, source, destination, radiusX, radiusY, radiusZ);
```

```
% show result
destination = clij2.pullMat(destination)

% cleanup memory on GPU
clij2.release(source);
clij2.release(destination);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer source = clij2.push(sourceImagePlus);
destination = clij2.create(source);
int radiusX = 10;
int radiusY = 20;
int radiusZ = 30;
```

```
// Execute operation on GPU
clij2.countNonZeroVoxels3DSphere(clij, source, destination, radiusX, radiusY, radiusZ);
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
