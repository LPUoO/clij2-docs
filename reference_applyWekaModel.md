## applyWekaModel
<img src="images/mini_empty_logo.png"/><img src="images/mini_empty_logo.png"/><img src="images/mini_clijx_logo.png"/>

Applies a Weka model using functionality of Fijis Trainable Weka Segmentation plugin.
It takes a 3D feature stack (e.g. first plane original image, second plane blurred, third plane edge image)and applies a pre-trained a Weka model. Take care that the feature stack has been generated in the sameway as for training the model!

### Usage in ImageJ macro
```
Ext.CLIJx_applyWekaModel(Image featureStack3D, Image prediction2D_destination, String loadModelFilename);
```


### Usage in Java
```
// init CLIJ and GPU
import net.haesleinhuepf.clij2.CLIJ2;
import net.haesleinhuepf.clij.clearcl.ClearCLBuffer;
CLIJ2 clij2 = CLIJ2.getInstance();

// get input parameters
ClearCLBuffer featureStack3D = clij2.push(featureStack3DImagePlus);
prediction2D_destination = clij.create(featureStack3D);
```

```
// Execute operation on GPU
CLIJxWeka2 resultApplyWekaModel = clij2.applyWekaModel(clij, featureStack3D, prediction2D_destination, loadModelFilename);
```

```
//show result
System.out.println(resultApplyWekaModel);
prediction2D_destinationImagePlus = clij2.pull(prediction2D_destination);
prediction2D_destinationImagePlus.show();

// cleanup memory on GPU
clij2.release(featureStack3D);
clij2.release(prediction2D_destination);
```




### Example scripts
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/"><img src="images/language_macro.png" height="20"/></a> [weka.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/weka.ijm)  
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/macro/"><img src="images/language_macro.png" height="20"/></a> [weka_segmentation.ijm](https://github.com/clij/clij2-docs/blob/master/src/main/macro/weka_segmentation.ijm)  


[Back to CLIJ documentation](https://clij.github.io/)

[Imprint](https://clij.github.io/imprint)
