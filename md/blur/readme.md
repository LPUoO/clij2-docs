

# CLIJ example macro: blur.ijm

[Source](https://github.com/clij/clij2-docs/tree/master/src/main/macro/blur.ijm)

This macro shows how to blur an image in the GPU.

Author: Robert Haase
December 2018

Get test data

<pre class="highlight">
run("Close All");

run("Blobs (25K)");
run("Invert LUT");
input = getTitle();

</pre>
<a href="image_1587651220246.png"><img src="image_1587651220246.png" width="224" alt="blobs.gif"/></a>

Init GPU
 and push image data to GPU

<pre class="highlight">
run("CLIJ2 Macro Extensions", "cl_device=");
Ext.CLIJ2_clear();

// push images to GPU
Ext.CLIJ2_push(input);

// cleanup ImageJ
run("Close All");

</pre>

Apply a Gaussian blur filter in GPU

<pre class="highlight">
Ext.<a href="https://clij.github.io/clij2-docs/reference_gaussianBlur3D">CLIJ2_gaussianBlur3D</a>(input, blurred, 5, 5, 1);

// Get results back from GPU
Ext.CLIJ2_pull(blurred);

</pre>
<a href="image_1587651221795.png"><img src="image_1587651221795.png" width="224" alt="CLIJ2_gaussianBlur3D_result125"/></a>

Cleanup by the end

<pre class="highlight">
Ext.CLIJ2_clear();
</pre>




