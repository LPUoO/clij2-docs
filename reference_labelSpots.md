## labelSpots
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Transforms a binary image with single pixles set to 1 to a labelled spots image. 

Transforms a spots image as resulting from maximum/minimum detection in an image of the same size where every spot has a number 1, 2, ... n.

### labelSpots often follows after
* <a href="reference_mask">mask</a> (2)


### labelSpots is often followed by
* <a href="reference_labelVoronoiOctagon">labelVoronoiOctagon</a> (2)
* <a href="reference_labelledSpotsToPointList">labelledSpotsToPointList</a> (2)


### Usage in ImageJ macro
```
Ext.CLIJ2_labelSpots(Image input_spots, ByRef Image labelled_spots_destination);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer input_spots = clij2.push(input_spotsImagePlus);
labelled_spots_destination = clij.create(input_spots);
```

```
// Execute operation on GPU
clij2.labelSpots(clij, input_spots, labelled_spots_destination);
```

```
//show result
labelled_spots_destinationImagePlus = clij2.pull(labelled_spots_destination);
labelled_spots_destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(input_spots);
clij2.release(labelled_spots_destination);
```




### Example notebooks
<a href="https://clij.github.io/clij2-docs/md/spots_pointlists_matrices_tables"><img src="images/language_macro.png" height="20"/></a> [spots_pointlists_matrices_tables](https://clij.github.io/clij2-docs/md/spots_pointlists_matrices_tables)  
<a href="https://clij.github.io/clij2-docs/md/tribolium_morphometry"><img src="images/language_macro.png" height="20"/></a> [tribolium_morphometry](https://clij.github.io/clij2-docs/md/tribolium_morphometry)  




### Example scripts
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/spots_pointlists_matrices_tables.ijm"><img src="images/language_macro.png" height="20"/></a> [spots_pointlists_matrices_tables.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/spots_pointlists_matrices_tables.ijm)  
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/tribolium_morphometry.ijm"><img src="images/language_macro.png" height="20"/></a> [tribolium_morphometry.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/tribolium_morphometry.ijm)  


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
