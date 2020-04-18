## countTouchingNeighbors
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Takes a touch matrix as input and delivers a vector with number of touching neighbors per label as a vector.

### Usage in ImageJ macro
```
Ext.CLIJ2_countTouchingNeighbors(Image touch_matrix, ByRef Image touching_neighbors_count_destination);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer touch_matrix = clij2.push(touch_matrixImagePlus);
touching_neighbors_count_destination = clij.create(touch_matrix);
```

```
// Execute operation on GPU
clij2.countTouchingNeighbors(clij, touch_matrix, touching_neighbors_count_destination);
```

```
//show result
touching_neighbors_count_destinationImagePlus = clij2.pull(touching_neighbors_count_destination);
touching_neighbors_count_destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(touch_matrix);
clij2.release(touching_neighbors_count_destination);
```


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
