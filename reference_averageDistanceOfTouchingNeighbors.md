## averageDistanceOfTouchingNeighbors
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Takes a touch matrix and a distance matrix to determine the average distance of touching neighbors 
 for every object.

### averageDistanceOfTouchingNeighbors often follows after
* <a href="reference_generateDistanceMatrix">generateDistanceMatrix</a> (2)


### averageDistanceOfTouchingNeighbors is often followed by
* <a href="reference_maximumOfTouchingNeighbors">maximumOfTouchingNeighbors</a> (2)


### Usage in ImageJ macro
```
Ext.CLIJ2_averageDistanceOfTouchingNeighbors(Image distance_matrix, Image touch_matrix, ByRef Image average_distancelist_destination);
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
average_distancelist_destination = clij.create(distance_matrix);
```

```
// Execute operation on GPU
clij2.averageDistanceOfTouchingNeighbors(clij, distance_matrix, touch_matrix, average_distancelist_destination);
```

```
//show result
average_distancelist_destinationImagePlus = clij2.pull(average_distancelist_destination);
average_distancelist_destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(distance_matrix);
clij2.release(touch_matrix);
clij2.release(average_distancelist_destination);
```




### Example notebooks
<a href="https://clij.github.io/clij2-docs/md/tribolium_morphometry"><img src="images/language_macro.png" height="20"/></a> [tribolium_morphometry](https://clij.github.io/clij2-docs/md/tribolium_morphometry)  




### Example scripts
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/tribolium_morphometry.ijm"><img src="images/language_macro.png" height="20"/></a> [tribolium_morphometry.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/tribolium_morphometry.ijm)  


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
