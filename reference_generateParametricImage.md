## generateParametricImage
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_empty_logo.png"/>

Take a labelmap and a vector of values to replace label 1 with the 1st value in the vector. 

Note that indexing in the vector starts at zero. The 0th entry corresponds to background in the label map.Internally this method just calls ReplaceIntensities.


### Usage in ImageJ macro
```
Ext.CLIJ2_generateParametricImage(Image parameter_value_vector, Image label_map, ByRef Image parametric_image_destination);
```




### Usage in Java


<details>

<summary>
clij2.generateParametricImage(parameter_value_vector, label_map, parametric_image_destination);
</summary>
<pre class="highlight">// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer parameter_value_vector = clij2.push(parameter_value_vectorImagePlus);
ClearCLBuffer label_map = clij2.push(label_mapImagePlus);
parametric_image_destination = clij2.create(parameter_value_vector);
</pre>

<pre class="highlight">
// Execute operation on GPU
clij2.generateParametricImage(parameter_value_vector, label_map, parametric_image_destination);
</pre>

<pre class="highlight">
//show result
parametric_image_destinationImagePlus = clij2.pull(parametric_image_destination);
parametric_image_destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(parameter_value_vector);
clij2.release(label_map);
clij2.release(parametric_image_destination);
</pre>

</details>





### Usage in Matlab


<details>

<summary>
clij2.generateParametricImage(parameter_value_vector, label_map, parametric_image_destination);
</summary>
<pre class="highlight">% init CLIJ and GPU
clij2 = init_clatlab();

% get input parameters
parameter_value_vector = clij2.pushMat(parameter_value_vector_matrix);
label_map = clij2.pushMat(label_map_matrix);
parametric_image_destination = clij2.create(parameter_value_vector);
</pre>

<pre class="highlight">
% Execute operation on GPU
clij2.generateParametricImage(parameter_value_vector, label_map, parametric_image_destination);
</pre>

<pre class="highlight">
% show result
parametric_image_destination = clij2.pullMat(parametric_image_destination)

% cleanup memory on GPU
clij2.release(parameter_value_vector);
clij2.release(label_map);
clij2.release(parametric_image_destination);
</pre>

</details>





### Usage in Icy


<details>

<summary>
clij2.generateParametricImage(parameter_value_vector, label_map, parametric_image_destination);
</summary>
<pre class="highlight">// init CLIJ and GPU
importClass(net.haesleinhuepf.clicy.CLICY);
importClass(Packages.icy.main.Icy);

clij2 = CLICY.getInstance();

// get input parameters
parameter_value_vector_sequence = getSequence();
parameter_value_vector = clij2.pushSequence(parameter_value_vector_sequence);
label_map_sequence = getSequence();
label_map = clij2.pushSequence(label_map_sequence);
parametric_image_destination = clij2.create(parameter_value_vector);
</pre>

<pre class="highlight">
// Execute operation on GPU
clij2.generateParametricImage(parameter_value_vector, label_map, parametric_image_destination);
</pre>

<pre class="highlight">
// show result
parametric_image_destination_sequence = clij2.pullSequence(parametric_image_destination)
Icy.addSequence(parametric_image_destination_sequence);
// cleanup memory on GPU
clij2.release(parameter_value_vector);
clij2.release(label_map);
clij2.release(parametric_image_destination);
</pre>

</details>



[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
