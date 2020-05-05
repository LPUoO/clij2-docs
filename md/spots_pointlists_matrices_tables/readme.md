

# Working with spots, pointlists, matrixes and tables

Authors: Robert Haase, Daniela Vorkel, April 2020

[Source](https://github.com/clij/clij2-docs/tree/master/src/main/macro/spots_pointlists_matrices_tables.ijm)


This macro demonstrates how to operate on
spot images, pointlists, distance matrices and
touch matrices in the GPU.

```

## Initialize GPU

```java
// init GPU
run("CLIJ2 Macro Extensions", "cl_device=[GeForce RTX 2060 SUPER]");
Ext.CLIJ2_clear();

run("Close All");

```

## Define a small array representing a spot detection result and push it to the GPU

```java
array = newArray(
	0, 0, 0, 0, 0,
	0, 0, 1, 0, 1,
	0, 1, 0, 0, 0,
	0, 0, 0, 1, 0,
	1, 0, 0, 0, 0);

width = 5;
height = 5;
depth = 1;

Ext.CLIJ2_pushArray(spots_image, array, width, height, depth);
Ext.CLIJ2_pull(spots_image);
zoom(100);

```
<a href="image_1588707709020.png"><img src="image_1588707709020.png" width="250" alt="CLIJ2_pushArray_result119-1"/></a>

## Convert the spot image into a point list

```java
Ext.CLIJ2_spotsToPointList(spots_image, pointlist);
Ext.CLIJ2_pull(pointlist);
zoom(100);
```
<a href="image_1588707709188.png"><img src="image_1588707709188.png" width="250" alt="CLIJ2_spotsToPointList_result120-1"/></a>

## Determine the distance between all spots and write the result as distance matrix. 

```java
Ext.CLIJ2_generateDistanceMatrix(pointlist, pointlist, distance_matrix);
Ext.CLIJ2_pull(distance_matrix);
zoom(100);

```
<a href="image_1588707709297.png"><img src="image_1588707709297.png" width="250" alt="CLIJ2_generateDistanceMatrix_result121-1"/></a>

## Label all spots

```java
Ext.CLIJ2_labelSpots(spots_image, labelled_spots);
Ext.CLIJ2_pull(labelled_spots);
zoom(100);
run("glasbey_on_dark");

```
<a href="image_1588707709431.png"><img src="image_1588707709431.png" width="250" alt="CLIJ2_labelSpots_result122-1"/></a>

## Blow labels up, until they touch (similar to Voronoi diagram)

```java
Ext.CLIJ2_labelVoronoiOctagon(labelled_spots, label_voronoi);
Ext.CLIJ2_pull(label_voronoi);
zoom(100);

```
<a href="image_1588707709563.png"><img src="image_1588707709563.png" width="250" alt="CLIJ2_labelVoronoiOctagon_result123-1"/></a>

## Analyze touching labels and save it as a touch matrix

```java
Ext.CLIJ2_generateTouchMatrix(label_voronoi, touch_matrix);
Ext.CLIJ2_pull(touch_matrix);
zoom(100);

```
<a href="image_1588707709723.png"><img src="image_1588707709723.png" width="250" alt="CLIJ2_generateTouchMatrix_result124-1"/></a>

## Count neighbors for every touching node

```java
Ext.CLIJ2_countTouchingNeighbors(touch_matrix, count_vector);
Ext.CLIJ2_pull(count_vector);
zoom(100);

```
<a href="image_1588707709844.png"><img src="image_1588707709844.png" width="250" alt="CLIJ2_countTouchingNeighbors_result125-1"/></a>

## Get pixel statistics from the labelled image

```java
run("Clear Results");
Ext.CLIJ2_statisticsOfLabelledPixels(spots_image, label_voronoi);

```
<table>
<tr><th>IDENTIFIER</th><th>BOUNDING_BOX_X</th><th>BOUNDING_BOX_Y</th><th>BOUNDING_BOX_Z</th><th>BOUNDING_BOX_END_X</th><th>BOUNDING_BOX_END_Y</th><th>BOUNDING_BOX_END_Z</th><th>BOUNDING_BOX_WIDTH</th><th>BOUNDING_BOX_HEIGHT</th><th>BOUNDING_BOX_DEPTH</th><th>MINIMUM_INTENSITY</th><th>MAXIMUM_INTENSITY</th><th>MEAN_INTENSITY</th><th>SUM_INTENSITY</th><th>STANDARD_DEVIATION_INTENSITY</th><th>PIXEL_COUNT</th><th>SUM_INTENSITY_TIMES_X</th><th>SUM_INTENSITY_TIMES_Y</th><th>SUM_INTENSITY_TIMES_Z</th><th>MASS_CENTER_X</th><th>MASS_CENTER_Y</th><th>MASS_CENTER_Z</th><th>SUM_X</th><th>SUM_Y</th><th>SUM_Z</th><th>CENTROID_X</th><th>CENTROID_Y</th><th>CENTROID_Z</th><th>SUM_DISTANCE_TO_MASS_CENTER</th><th>MEAN_DISTANCE_TO_MASS_CENTER</th><th>MAX_DISTANCE_TO_MASS_CENTER</th><th>MAX_MEAN_DISTANCE_TO_MASS_CENTER_RATIO</th><th>SUM_DISTANCE_TO_CENTROID</th><th>MEAN_DISTANCE_TO_CENTROID</th><th>MAX_DISTANCE_TO_CENTROID</th><th>MAX_MEAN_DISTANCE_TO_CENTROID_RATIO</th></tr>
<tr><td>1</td><td>1</td><td>0</td><td>0</td><td>2</td><td>1</td><td>0</td><td>2</td><td>2</td><td>1</td><td>0</td><td>1</td><td>0.333</td><td>1</td><td>0.471</td><td>3</td><td>2</td><td>1</td><td>0</td><td>2</td><td>1</td><td>0</td><td>5</td><td>1</td><td>0</td><td>1.667</td><td>0.333</td><td>0</td><td>2.414</td><td>0.805</td><td>1.414</td><td>1.757</td><td>1.962</td><td>0.654</td><td>0.745</td><td>1.140</td></tr>
<tr><td>2</td><td>3</td><td>0</td><td>0</td><td>4</td><td>1</td><td>0</td><td>2</td><td>2</td><td>1</td><td>0</td><td>1</td><td>0.250</td><td>1</td><td>0.433</td><td>4</td><td>4</td><td>1</td><td>0</td><td>4</td><td>1</td><td>0</td><td>14</td><td>2</td><td>0</td><td>3.500</td><td>0.500</td><td>0</td><td>3.414</td><td>0.854</td><td>1.414</td><td>1.657</td><td>2.828</td><td>0.707</td><td>0.707</td><td>1.000</td></tr>
<tr><td>3</td><td>0</td><td>0</td><td>0</td><td>1</td><td>2</td><td>0</td><td>2</td><td>3</td><td>1</td><td>0</td><td>1</td><td>0.200</td><td>1</td><td>0.400</td><td>5</td><td>1</td><td>2</td><td>0</td><td>1</td><td>2</td><td>0</td><td>2</td><td>6</td><td>0</td><td>0.400</td><td>1.200</td><td>0</td><td>5.650</td><td>1.130</td><td>2.236</td><td>1.979</td><td>4.239</td><td>0.848</td><td>1.265</td><td>1.492</td></tr>
<tr><td>4</td><td>2</td><td>2</td><td>0</td><td>4</td><td>4</td><td>0</td><td>3</td><td>3</td><td>1</td><td>0</td><td>1</td><td>0.111</td><td>1</td><td>0.314</td><td>9</td><td>3</td><td>3</td><td>0</td><td>3</td><td>3</td><td>0</td><td>27</td><td>27</td><td>0</td><td>3.000</td><td>3.000</td><td>0</td><td>9.657</td><td>1.073</td><td>1.414</td><td>1.318</td><td>9.657</td><td>1.073</td><td>1.414</td><td>1.318</td></tr>
<tr><td>5</td><td>0</td><td>3</td><td>0</td><td>1</td><td>4</td><td>0</td><td>2</td><td>2</td><td>1</td><td>0</td><td>1</td><td>0.250</td><td>1</td><td>0.433</td><td>4</td><td>0</td><td>4</td><td>0</td><td>0</td><td>4</td><td>0</td><td>2</td><td>14</td><td>0</td><td>0.500</td><td>3.500</td><td>0</td><td>3.414</td><td>0.854</td><td>1.414</td><td>1.657</td><td>2.828</td><td>0.707</td><td>0.707</td><td>1.000</td></tr>
</table>


## Push the results table as an image to the GPU

```java
Ext.CLIJ2_pushResultsTable(table_image);
Ext.CLIJ2_pull(table_image);
zoom(100);

```
<a href="image_1588707710067.png"><img src="image_1588707710067.png" width="250" alt="CLIJ2_pushResultsTable_result126-1"/></a>

## Push a single column of the results table to the GPU

```java
Ext.CLIJ2_pushResultsTableColumn(mean_intensity_vector, "MEAN_INTENSITY");
Ext.CLIJ2_pull(mean_intensity_vector);
zoom(100);

```
<a href="image_1588707710259.png"><img src="image_1588707710259.png" width="250" alt="CLIJ2_pushResultsTableColumn_result127-1"/></a>

## Multiply the pointlist with a scalar to get points virtually more distant

```java
zoom_factor = 100;
Ext.CLIJ2_multiplyImageAndScalar(pointlist, pointlist_multiplied, zoom_factor);
Ext.CLIJ2_pull(pointlist_multiplied);
zoom(100);

```
<a href="image_1588707710381.png"><img src="image_1588707710381.png" width="250" alt="CLIJ2_multiplyImageAndScalar_result128-1"/></a>

## Draw a mesh of touching neighbors and corresponding spots

```java
Ext.CLIJ2_create2D(mesh, width * zoom_factor, height * zoom_factor, 32);
Ext.CLIJ2_touchMatrixToMesh(pointlist_multiplied, touch_matrix, mesh);
Ext.CLIJ2_pull(mesh);

```
<a href="image_1588707710448.png"><img src="image_1588707710448.png" width="250" alt="CLIJ2_create2D_result129"/></a>

## Draw a mesh showing shorter edges than from given value

```java
Ext.CLIJ2_create2D(mesh2, width * zoom_factor, height * zoom_factor, 32);
Ext.CLIJ2_distanceMatrixToMesh(pointlist_multiplied, distance_matrix, mesh2, 2.5);
Ext.CLIJ2_pull(mesh2);

```
<a href="image_1588707710517.png"><img src="image_1588707710517.png" width="250" alt="CLIJ2_create2D_result130"/></a>

At the end of the macro, clean up:

```java
Ext.CLIJ2_clear();

```

This is just a useful function to get a nice visualization in the notebook:

```java
function zoom(factor) {
	getDimensions(width, height, channels, slices, frames);
	before = getTitle();	
	run("Scale...", "x=" + factor + " y=" + factor + " width=" + (width * factor) + " height=" + (height* factor) + " interpolation=None average create");
	selectWindow(before);
	close();
}
```



```
```
