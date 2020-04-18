## resliceLeft
<img src="images/mini_clij1_logo.png"/><img src="images/mini_clij2_logo.png"/><img src="images/mini_clijx_logo.png"/>

Flippes X, Y and Z axis of an image stack. This operation is similar to ImageJs 'Reslice [/]' method 
 but offers less flexibility such as interpolation.

### resliceLeft is often followed by
* <a href="reference_rotateRight">rotateRight</a> (2)


### Usage in ImageJ macro
```
Ext.CLIJ2_resliceLeft(Image source, Image destination);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer source = clij2.push(sourceImagePlus);
destination = clij.create(new long[]{source.getHeight(), source.getDepth(), source.getWidth()}, source.getNativeType());
```

```
// Execute operation on GPU
clij2.resliceLeft(clij, source, destination);
```

```
//show result
destinationImagePlus = clij2.pull(destination);
destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(source);
clij2.release(destination);
```




### Example scripts
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/reslicing.ijm"><img src="images/language_macro.png" height="20"/></a> [reslicing.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/reslicing.ijm)  
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/turn_stack.ijm"><img src="images/language_macro.png" height="20"/></a> [turn_stack.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/turn_stack.ijm)  
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/jython/interactiveCylinderProjection.py"><img src="images/language_jython.png" height="20"/></a> [interactiveCylinderProjection.py](https://github.com/clij/clij2-docs/blob/master/src/main/jython/interactiveCylinderProjection.py)  
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/jython/interactiveSphereProjection.py"><img src="images/language_jython.png" height="20"/></a> [interactiveSphereProjection.py](https://github.com/clij/clij2-docs/blob/master/src/main/jython/interactiveSphereProjection.py)  


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
