/*
# CLIJ2 basics

Authors: Robert Haase, Daniela Vorkel, April 2020
        
[Source](https://github.com/clij/clij2-docs/tree/master/src/main/macro/basics.ijm)

This macro explains the basics for image processing on graphics processing units (GPUs) using CLIJ2.



## How to start
Before accessing CLIJ2 methods, every macro must contain following line to assign the GPU. By default,
the parameter `cl_device` is left empty, but asking CLIJ to automatically select a GPU. In example, if 
you have a GPU named "nVendor Awesome Intelligent 3000", you can enter its full name behind the quality
sign, written in brakets like `[nVendor Awesome Intelligent 3000]`. But also, you could just enter a part 
of the name, such as `nVendor` or `some`. CLIJ will select the associated GPU as long as there is no other 
GPU containing the same parts of the name.
*/
run("CLIJ2 Macro Extensions", "cl_device=");
/*

## Clean up at the beginning
Furthermore, to assure that the memory of the GPU is empty and fully operable, call the `clear();` command. 
This makes a lot of sense while developing new workflows. In case your macro crashes, the latest images will 
be left in GPU memory. Thus and before starting any macro, you want to clean up first:
*/
Ext.CLIJ2_clear();
/*
## Loading images and pushing them into GPU memory

To load images, we use ImageJs functionality. Next, we use the CLIJs `push();` method to send the loaded 
image to GPU memory.
*/
run("Cell Colony (31K)");

input_image = getTitle();
Ext.CLIJ2_push(input_image);
/*
Now, the image in the GPU is named like its correspondent image on the screen. 
We can request the GPU memory to find out which images are registered there by now: 
*/
Ext.CLIJ2_reportMemory();
/*
## Processing an image
If we use CLIJ methods to blur the input image, another `result` image gets allocated in GPU memory.
*/
sigma = 5;
//// you can, but you don't have to define the resulting image name:
//result = "blurred_image"; 
Ext.CLIJ2_gaussianBlur2D(input_image, result, sigma, sigma);
/*
## Showing a result image
If we want to stop a program just by using the `exit();` method, it won't display any result.

In order to get the `result` back from the GPU, we need to pull it:
*/
Ext.CLIJ2_pull(result);
/*
Furthermore, let's ask again which images are known in GPU memory:
*/
Ext.CLIJ2_reportMemory();
/*
## Free memory whenever possible
Obviously, memory is limited. If we would just continue to process images, more and more of them would 
be allocated in the GPU until its memory is full. At full memory, it will show an error message like 
`CL_OUT_OF_RESOURCES` or `CL_OUT_OF_HOST_MEMORY`. Thus, we need to release an image to free GPU memory. 
*/
Ext.CLIJ2_release(input_image);

Ext.CLIJ2_reportMemory();
/*
It is a good strategy to remove image A as soon as an image B has been processed out of it and image A isn't 
needed anymore. However, it is also a bit annoying to release images all the time. Thus, as long as GPU memory 
isn't full, one can just continue processing and create new images. As soon as processing runs into trouble, 
use the `reportMemory();` method to find out which images are currently occupying a lot of space within memory.
And when needed for your workflow, release some of them.

## Clean up when you're done
Furthermore, by the end of your macro, be a good programmer and clean up GPU. ;-)
*/

Ext.CLIJ2_clear();
Ext.CLIJ2_reportMemory();

