## setImageBorders
<img src="images/mini_empty_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Sets all pixel values at the image border to a given value.

### Usage in ImageJ macro
```
Ext.CLIJ2_setImageBorders(Image destination, Number value);
```


### Usage in Java
<details>
<summary>
clij2.setImageBorders(destination, value);
</summary>
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
destination = clij2.create();
float value = 1.0;
```

```
// Execute operation on GPU
clij2.setImageBorders(destination, value);
```

```
//show result
destinationImagePlus = clij2.pull(destination);
destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(destination);
```
</details>


### Usage in Matlab
<details>
<summary>
clij2.setImageBorders(destination, value);
</summary>
```
% init CLIJ and GPU
clij2 = init_clatlab();

% get input parameters
destination = clij2.create();
value = 1.0;
```

```
% Execute operation on GPU
clij2.setImageBorders(destination, value);
```

```
% show result
destination = clij2.pullMat(destination)

% cleanup memory on GPU
clij2.release(destination);
```
</details>


### Usage in Icy
<details>
<summary>
clij2.setImageBorders(destination, value);
</summary>
```
// init CLIJ and GPU
importClass(net.haesleinhuepf.clicy.CLICY);
importClass(Packages.icy.main.Icy);

clij2 = CLICY.getInstance();

// get input parameters
destination = clij2.create();
value = 1.0;
```

```
// Execute operation on GPU
clij2.setImageBorders(destination, value);
```

```
// show result
destination_sequence = clij2.pullSequence(destination)
Icy.addSequence(destination_sequence
// cleanup memory on GPU
clij2.release(destination);
```
</details>


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
