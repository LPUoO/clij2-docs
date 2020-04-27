## downsample3D
<img src="images/mini_clij1_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Scales an image using given scaling factors for X and Y dimensions. The nearest-neighbor method
is applied. In ImageJ the method which is similar is called 'Interpolation method: none'.

### Usage in ImageJ macro
```
Ext.CLIJ2_downsample3D(Image source, Image destination, Number factorX, Number factorY, Number factorZ);
```


### Usage in Java


<details>

<summary>
clij2.downsample3D(source, destination, factorX, factorY, factorZ);
</summary>
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer source = clij2.push(sourceImagePlus);
destination = clij2.create(source);
float factorX = 1.0;
float factorY = 2.0;
float factorZ = 3.0;
```

```
// Execute operation on GPU
clij2.downsample3D(source, destination, factorX, factorY, factorZ);
```

```
//show result
destinationImagePlus = clij2.pull(destination);
destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(source);
clij2.release(destination);
```


</details>



### Usage in Matlab


<details>

<summary>
clij2.downsample3D(source, destination, factorX, factorY, factorZ);
</summary>
```
% init CLIJ and GPU
clij2 = init_clatlab();

% get input parameters
source = clij2.pushMat(source_matrix);
destination = clij2.create(source);
factorX = 1.0;
factorY = 2.0;
factorZ = 3.0;
```

```
% Execute operation on GPU
clij2.downsample3D(source, destination, factorX, factorY, factorZ);
```

```
% show result
destination = clij2.pullMat(destination)

% cleanup memory on GPU
clij2.release(source);
clij2.release(destination);
```


</details>



### Usage in Icy


details>

<summary>
clij2.downsample3D(source, destination, factorX, factorY, factorZ);
</summary>
```
// init CLIJ and GPU
importClass(net.haesleinhuepf.clicy.CLICY);
importClass(Packages.icy.main.Icy);

clij2 = CLICY.getInstance();

// get input parameters
source_sequence = getSequence();source = clij2.pushSequence(source_sequence);
destination = clij2.create(source);
factorX = 1.0;
factorY = 2.0;
factorZ = 3.0;
```

```
// Execute operation on GPU
clij2.downsample3D(source, destination, factorX, factorY, factorZ);
```

```
// show result
destination_sequence = clij2.pullSequence(destination)
Icy.addSequence(destination_sequence
// cleanup memory on GPU
clij2.release(source);
clij2.release(destination);
```


</details>



[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
