## openingDiamond
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Apply a binary opening to the input image by calling n erosions and n dilations subsequenntly.

### Usage in ImageJ macro
```
Ext.CLIJ2_openingDiamond(Image input, ByRef Image destination, Number number_of_erotions_and_dilations);
```


### Usage in Java
<details>
<summary>
clij2.openingDiamond(input, destination, number_of_erotions_and_dilations);
</summary>
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer input = clij2.push(inputImagePlus);
destination = clij2.create(input);
int number_of_erotions_and_dilations = 10;
```

```
// Execute operation on GPU
clij2.openingDiamond(input, destination, number_of_erotions_and_dilations);
```

```
//show result
destinationImagePlus = clij2.pull(destination);
destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(input);
clij2.release(destination);
```
</details>


### Usage in Matlab
<details>
<summary>
clij2.openingDiamond(input, destination, number_of_erotions_and_dilations);
</summary>
```
% init CLIJ and GPU
clij2 = init_clatlab();

% get input parameters
input = clij2.pushMat(input_matrix);
destination = clij2.create(input);
number_of_erotions_and_dilations = 10;
```

```
% Execute operation on GPU
clij2.openingDiamond(input, destination, number_of_erotions_and_dilations);
```

```
% show result
destination = clij2.pullMat(destination)

% cleanup memory on GPU
clij2.release(input);
clij2.release(destination);
```
</details>


### Usage in Icy
<details>
<summary>
clij2.openingDiamond(input, destination, number_of_erotions_and_dilations);
</summary>
```
// init CLIJ and GPU
importClass(net.haesleinhuepf.clicy.CLICY);
importClass(Packages.icy.main.Icy);

clij2 = CLICY.getInstance();

// get input parameters
input_sequence = getSequence();input = clij2.pushSequence(input_sequence);
destination = clij2.create(input);
number_of_erotions_and_dilations = 10;
```

```
// Execute operation on GPU
clij2.openingDiamond(input, destination, number_of_erotions_and_dilations);
```

```
// show result
destination_sequence = clij2.pullSequence(destination)
Icy.addSequence(destination_sequence
// cleanup memory on GPU
clij2.release(input);
clij2.release(destination);
```
</details>


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
