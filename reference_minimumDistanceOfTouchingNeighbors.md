## minimumDistanceOfTouchingNeighbors
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Takes a touch matrix and a distance matrix to determine the shortest distance of touching neighbors for every object.

### Usage in ImageJ macro
```
Ext.CLIJ2_minimumDistanceOfTouchingNeighbors(Image distance_matrix, Image touch_matrix, ByRef Image minimum_distancelist_destination);
```


### Usage in Matlab
```
// init CLIJ and GPU
clij2 = init_clatlab();

% get input parameters
distance_matrix = clij2.pushMat(distance_matrix);
touch_matrix = clij2.pushMat(touch_matrix);
minimum_distancelist_destination = clij2.create(distance_matrix);
```

```
% Execute operation on GPU
clij2.minimumDistanceOfTouchingNeighbors(clij, distance_matrix, touch_matrix, minimum_distancelist_destination);
```

```
% show result
minimum_distancelist_destination = clij2.pullMat(minimum_distancelist_destination)

% cleanup memory on GPU
clij2.release(distance_matrix);
clij2.release(touch_matrix);
clij2.release(minimum_distancelist_destination);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer distance_matrix = clij2.push(distance_matrixImagePlus);
ClearCLBuffer touch_matrix = clij2.push(touch_matrixImagePlus);
minimum_distancelist_destination = clij2.create(distance_matrix);
```

```
// Execute operation on GPU
clij2.minimumDistanceOfTouchingNeighbors(clij, distance_matrix, touch_matrix, minimum_distancelist_destination);
```

```
//show result
minimum_distancelist_destinationImagePlus = clij2.pull(minimum_distancelist_destination);
minimum_distancelist_destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(distance_matrix);
clij2.release(touch_matrix);
clij2.release(minimum_distancelist_destination);
```


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
