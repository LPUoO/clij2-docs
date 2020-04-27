## writeValuesToPositions
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Takes an image with three/four rows (2D: height = 3; 3D: height = 4): x, y [, z] and v and target image. 

The value v will be written at position x/y[/z] in the target image.

### Usage in ImageJ macro
```
Ext.CLIJ2_writeValuesToPositions(Image positionsAndValues, ByRef Image destination);
```


### Usage in Matlab
```
// init CLIJ and GPU
clij2 = init_clatlab();

% get input parameters
positionsAndValues = clij2.pushMat(positionsAndValues);
destination = clij2.create(positionsAndValues);
```

```
% Execute operation on GPU
clij2.writeValuesToPositions(clij, positionsAndValues, destination);
```

```
% show result
destination = clij2.pullMat(destination)

% cleanup memory on GPU
clij2.release(positionsAndValues);
clij2.release(destination);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer positionsAndValues = clij2.push(positionsAndValuesImagePlus);
destination = clij2.create(positionsAndValues);
```

```
// Execute operation on GPU
clij2.writeValuesToPositions(clij, positionsAndValues, destination);
```

```
//show result
destinationImagePlus = clij2.pull(destination);
destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(positionsAndValues);
clij2.release(destination);
```


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
