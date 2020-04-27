## standardDeviationOfAllPixels
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Determines the standard deviation of all pixels in an image. 

The value will be stored in a new row of ImageJs
Results table in the column 'Standard_deviation'.

### Usage in ImageJ macro
```
Ext.CLIJ2_standardDeviationOfAllPixels(Image source);
```


### Usage in Java


<details>

<summary>
clij2.standardDeviationOfAllPixels(source);
</summary>
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer source = clij2.push(sourceImagePlus);
```

```
// Execute operation on GPU
double resultStandardDeviationOfAllPixels = clij2.standardDeviationOfAllPixels(source);
```

```
//show result
System.out.println(resultStandardDeviationOfAllPixels);

// cleanup memory on GPU
clij2.release(source);
```


</details>



### Usage in Matlab


<details>

<summary>
clij2.standardDeviationOfAllPixels(source);
</summary>
```
% init CLIJ and GPU
clij2 = init_clatlab();

% get input parameters
source = clij2.pushMat(source_matrix);
```

```
% Execute operation on GPU
double resultStandardDeviationOfAllPixels = clij2.standardDeviationOfAllPixels(source);
```

```
% show result
System.out.println(resultStandardDeviationOfAllPixels);

% cleanup memory on GPU
clij2.release(source);
```


</details>



### Usage in Icy


details>

<summary>
clij2.standardDeviationOfAllPixels(source);
</summary>
```
// init CLIJ and GPU
importClass(net.haesleinhuepf.clicy.CLICY);
importClass(Packages.icy.main.Icy);

clij2 = CLICY.getInstance();

// get input parameters
source_sequence = getSequence();source = clij2.pushSequence(source_sequence);
```

```
// Execute operation on GPU
double resultStandardDeviationOfAllPixels = clij2.standardDeviationOfAllPixels(source);
```

```
// show result
System.out.println(resultStandardDeviationOfAllPixels);

// cleanup memory on GPU
clij2.release(source);
```


</details>



[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
