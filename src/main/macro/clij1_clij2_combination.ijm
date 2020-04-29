/* 
# Combining CLIJ and CLIJ2 
Author: Robert Haase
        February 2020

[Source](https://github.com/clij/clij2-docs/tree/master/src/main/macro/clij1_clij2_combination.ijm)

This macro shows how to combine CLIJ and CLIJ2

Initially, we define two input images we would like to combine by adding.
*/ 
// clean up first 
run("Close All"); 
 
// Get test data 
run("Blobs (25K)"); 
run("8-bit");
rename("original");
getDimensions(width, height, channels, slices, frames)
original = getTitle();

newImage("background", "16-bit ramp", width, height, slices);
 background = getTitle();
/* 
## Initialize GPU and push image data to GPU memory
When combining CLIJ and CLIJ2, it is important to initialize CLIJ2 like in the following example. 
CLIJ2 takes care of initializing CLIJ in the background:
*/ 
run("CLIJ2 Macro Extensions", "cl_device="); 
Ext.CLIJ2_clear(); 
/*
## Pushing images to GPU memory
Afterwards, all methods from CLIJ and CLIJ2 are available, for example for pushing images to the GPU:
*/
// push images to GPU using CLIJ2
Ext.CLIJ2_push(original);
// push images to GPU using CLIJ
Ext.CLIJ_push(background);

// cleanup imagej 
run("Close All"); 

/* 
... and for creating an output image with 32 bits using CLIJ:
*/
originalWithBackground = "originalWithBackground";
Ext.CLIJ_create2D(originalWithBackground, width, height, 32);

/*
## Combining images managed by CLIJ and CLIJ2
Images which have been pushed and or creaated by CLIJ or CLIJ2 can be combined with any command:
*/
 Ext.CLIJ2_addImagesWeighted(original, background, originalWithBackground, 1, 0.01);
 
// show result  using CLIJ2
Ext.CLIJ2_pull(originalWithBackground); 
run("Invert LUT"); 

/*
## Clean up finally using CLIJ2
As in every workflow, clean up by the end:
*/
Ext.CLIJ2_clear();

