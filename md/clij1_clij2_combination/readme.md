

# Combining CLIJ and CLIJ2 
Authors: Robert Haase, Daniela Vorkel, April 2020

[Source](https://github.com/clij/clij2-docs/tree/master/src/main/macro/clij1_clij2_combination.ijm)

This macro shows how to combine CLIJ and CLIJ2.

Initially, we define two input images we would like to combine by adding.

```java
// clean up first 
run("Close All"); 
 
// get test data 
run("Blobs (25K)"); 
run("8-bit");
rename("original");
getDimensions(width, height, channels, slices, frames)
original = getTitle();

newImage("background", "16-bit ramp", width, height, slices);
 background = getTitle();
```
<a href="image_1588706457112.png"><img src="image_1588706457112.png" width="250" alt="original"/></a>
<a href="image_1588706457176.png"><img src="image_1588706457176.png" width="250" alt="background"/></a>

## Initialize GPU and push image data to GPU memory
When combining CLIJ and CLIJ2, it is important to initialize CLIJ2 like in the following example. 
CLIJ2 takes care of initializing CLIJ in the background:

```java
run("CLIJ2 Macro Extensions", "cl_device="); 
Ext.CLIJ2_clear(); 
```

## Pushing images to GPU memory
Afterwards, all methods from CLIJ and CLIJ2 are available, for example to push images to the GPU:

```java
// push images to GPU using CLIJ2
Ext.CLIJ2_push(original);
// push images to GPU using CLIJ
Ext.CLIJ_push(background);

// clean up ImageJ 
run("Close All"); 

```

... and for creating an output image with 32 bits using CLIJ:

```java
originalWithBackground = "originalWithBackground";
Ext.CLIJ_create2D(originalWithBackground, width, height, 32);

```

## Combining images managed by CLIJ and CLIJ2
Images, which have been pushed and/or created by CLIJ or CLIJ2, can be combined with any command:

```java
 Ext.CLIJ2_addImagesWeighted(original, background, originalWithBackground, 1, 0.01);
 
// show result using CLIJ2
Ext.CLIJ2_pull(originalWithBackground); 
run("Invert LUT"); 

```
<a href="image_1588706457318.png"><img src="image_1588706457318.png" width="250" alt="originalWithBackground"/></a>

## Finally, clean up using CLIJ2
As for every workflow, clean up at the end:

```java
Ext.CLIJ2_clear();

```



```
```
