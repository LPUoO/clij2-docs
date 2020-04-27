## connectedComponentsLabelingDiamond
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Performs connected components analysis inspecting the diamond neighborhood of every pixel to a binary image and generates a label map.

### Usage in ImageJ macro
```
Ext.CLIJ2_connectedComponentsLabelingDiamond(Image binary_input, ByRef Image labeling_destination);
```


### Usage in Matlab
```
// init CLIJ and GPU
clij2 = init_clatlab();

% get input parameters
binary_input = clij2.pushMat(binary_input);
labeling_destination = clij2.create(binary_input);
```

```
% Execute operation on GPU
clij2.connectedComponentsLabelingDiamond(clij, binary_input, labeling_destination);
```

```
% show result
labeling_destination = clij2.pullMat(labeling_destination)

% cleanup memory on GPU
clij2.release(binary_input);
clij2.release(labeling_destination);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer binary_input = clij2.push(binary_inputImagePlus);
labeling_destination = clij2.create(binary_input);
```

```
// Execute operation on GPU
clij2.connectedComponentsLabelingDiamond(clij, binary_input, labeling_destination);
```

```
//show result
labeling_destinationImagePlus = clij2.pull(labeling_destination);
labeling_destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(binary_input);
clij2.release(labeling_destination);
```


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
