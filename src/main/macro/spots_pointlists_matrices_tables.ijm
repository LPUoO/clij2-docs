/* 
# CLIJ2 tutorial: Working with spots, pointlists, matrixes and tables

This macro demonstrates working with
spot images, pointlists, distance matrixes and
touch matrices on the GPU.

Author: Robert Haase
        April 2020

*/
// init GPU
run("CLIJ2 Macro Extensions", "cl_device=[GeForce RTX 2060 SUPER]");
Ext.CLIJ2_clear();

run("Close All");

/*
## Define a small array represending a spot-detection result and push it to the GPU
*/
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

/*
## Convert the spots image to a point list
*/
Ext.CLIJ2_spotsToPointList(spots_image, pointlist);
Ext.CLIJ2_pull(pointlist);
zoom(100);
/*
## Determine the distance from every spot to every spot and write it in a distance matrix. 
*/
Ext.CLIJ2_generateDistanceMatrix(pointlist, pointlist, distance_matrix);
Ext.CLIJ2_pull(distance_matrix);
zoom(100);

/*
## Label all spots
*/
Ext.CLIJ2_labelSpots(spots_image, labelled_spots);
Ext.CLIJ2_pull(labelled_spots);
zoom(100);
run("glasbey_on_dark");

/*
## Blow up the labels until they touch; similar to a Voronoi diagrom
*/
Ext.CLIJ2_labelVoronoiOctagon(labelled_spots, label_voronoi);
Ext.CLIJ2_pull(label_voronoi);
zoom(100);

/*
## Analyse which label touches which other labels and save it in a touch matrix
*/
Ext.CLIJ2_generateTouchMatrix(label_voronoi, touch_matrix);
Ext.CLIJ2_pull(touch_matrix);
zoom(100);

/*
## Count neighbors for every node
*/
Ext.CLIJ2_countTouchingNeighbors(touch_matrix, count_vector);
Ext.CLIJ2_pull(count_vector);
zoom(100);

/*
## Do pixel statistics on the labelled image
*/
run("Clear Results");
Ext.CLIJ2_statisticsOfLabelledPixels(spots_image, label_voronoi);

/*
## Push results table as image to the GPU
*/
Ext.CLIJ2_pushResultsTable(table_image);
Ext.CLIJ2_pull(table_image);
zoom(100);

/*
## Push a single column of the results table to the GPU
*/
Ext.CLIJ2_pushResultsTableColumn(mean_intensity_vector, "MEAN_INTENSITY");
Ext.CLIJ2_pull(mean_intensity_vector);
zoom(100);

/*
## Multiply the pointlist with a scalar makes the points virtually more distant
*/
zoom_factor = 100;
Ext.CLIJ2_multiplyImageAndScalar(pointlist, pointlist_multiplied, zoom_factor);
Ext.CLIJ2_pull(pointlist_multiplied);
zoom(100);

/*
## Draw a mesh of touching neighbors and corresponding spots
*/ 
Ext.CLIJ2_create2D(mesh, width * zoom_factor, height * zoom_factor, 32);
Ext.CLIJ2_touchMatrixToMesh(pointlist_multiplied, touch_matrix, mesh);
Ext.CLIJ2_pull(mesh);

/*
## Draw a showing all edges shorter than a given value
*/
Ext.CLIJ2_create2D(mesh2, width * zoom_factor, height * zoom_factor, 32);
Ext.CLIJ2_distanceMatrixToMesh(pointlist_multiplied, distance_matrix, mesh2, 2.5);
Ext.CLIJ2_pull(mesh2);

/*
Clean up by the end
*/
Ext.CLIJ2_clear();

/*
This is just a utility function to make the visualisation in the notebook nice.
*/
function zoom(factor) {
	getDimensions(width, height, channels, slices, frames);
	before = getTitle();	
	run("Scale...", "x=" + factor + " y=" + factor + " width=" + (width * factor) + " height=" + (height* factor) + " interpolation=None average create");
	selectWindow(before);
	close();
}
