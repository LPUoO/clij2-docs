## pullLabelsToROIManager
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Pulls all labels in a label map as ROIs to the ROI manager.

### Usage in ImageJ macro
```
Ext.CLIJ2_pullLabelsToROIManager(Image labelmap_input);
```


### Usage in Java


<details>

<summary>
clij2.pullLabelsToROIManager(labelmap_input);
</summary>
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer labelmap_input = clij2.push(labelmap_inputImagePlus);
```

```
// Execute operation on GPU
clij2.pullLabelsToROIManager(labelmap_input);
```

```
//show result

// cleanup memory on GPU
clij2.release(labelmap_input);
```


</details>



### Usage in Matlab


<details>

<summary>
clij2.pullLabelsToROIManager(labelmap_input);
</summary>
```
% init CLIJ and GPU
clij2 = init_clatlab();

% get input parameters
labelmap_input = clij2.pushMat(labelmap_input_matrix);
```

```
% Execute operation on GPU
clij2.pullLabelsToROIManager(labelmap_input);
```

```
% show result

% cleanup memory on GPU
clij2.release(labelmap_input);
```


</details>



### Usage in Icy


details>

<summary>
clij2.pullLabelsToROIManager(labelmap_input);
</summary>
```
// init CLIJ and GPU
importClass(net.haesleinhuepf.clicy.CLICY);
importClass(Packages.icy.main.Icy);

clij2 = CLICY.getInstance();

// get input parameters
labelmap_input_sequence = getSequence();labelmap_input = clij2.pushSequence(labelmap_input_sequence);
```

```
// Execute operation on GPU
clij2.pullLabelsToROIManager(labelmap_input);
```

```
// show result

// cleanup memory on GPU
clij2.release(labelmap_input);
```


</details>





### Example notebooks
<a href="https://clij.github.io/clij2-docs/md/working_with_rois"><img src="images/language_macro.png" height="20"/></a> [working_with_rois](https://clij.github.io/clij2-docs/md/working_with_rois)  




### Example scripts
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/working_with_rois.ijm"><img src="images/language_macro.png" height="20"/></a> [working_with_rois.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/working_with_rois.ijm)  


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
