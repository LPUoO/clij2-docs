## meanOfTouchingNeighbors
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_empty_logo.png"/>

Takes a touch matrix and a vector of values to determine the mean value among touching neighbors for every object. 

TODO: This only works for values between 0 and 255 for now.

### meanOfTouchingNeighbors is often followed by
* <a href="reference_replaceIntensities">replaceIntensities</a> (2)


### Usage in ImageJ macro
```
Ext.CLIJ2_meanOfTouchingNeighbors(Image values, Image touch_matrix, ByRef Image mean_values_destination);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer values = clij2.push(valuesImagePlus);
ClearCLBuffer touch_matrix = clij2.push(touch_matrixImagePlus);
mean_values_destination = clij.create(values);
```

```
// Execute operation on GPU
clij2.meanOfTouchingNeighbors(clij, values, touch_matrix, mean_values_destination);
```

```
//show result
mean_values_destinationImagePlus = clij2.pull(mean_values_destination);
mean_values_destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(values);
clij2.release(touch_matrix);
clij2.release(mean_values_destination);
```




### Example notebooks
<a href="https://github.com/clij/clij2-docs/md/mean_of_touching_neighbors"><img src="images/language_macro.png" height="20"/></a> [mean_of_touching_neighbors](https://github.com/clij/clij2-docs/md/mean_of_touching_neighbors)  




### Example scripts
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/mean_of_touching_neighbors.ijm"><img src="images/language_macro.png" height="20"/></a> [mean_of_touching_neighbors.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/mean_of_touching_neighbors.ijm)  


[Back to CLIJ documentation](https://clij.github.io/)

[Imprint](https://clij.github.io/imprint)
