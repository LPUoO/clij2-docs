## drawTwoValueLine
<img src="images/mini_empty_logo.png"/><img src="images/mini_empty_logo.png"/><img src="images/mini_clijx_logo.png"/>

Draws a line between two points with a given thickness. 

Pixels close to point 1 are set to value1. Pixels closer to point 2 are set to value2 All pixels other than on the line are untouched. Consider using clij.set(buffer, 0); in advance.

### Usage in ImageJ macro
```
Ext.CLIJx_drawTwoValueLine(ByRef Image destination, Number x1, Number y1, Number z1, Number x2, Number y2, Number z2, Number thickness, Number value1, Number value2);
```




### Example scripts
<a href="https://github.com/clij/clij2-docs/blob/master/src/main/jython/countNeighbors3D.py"><img src="images/language_jython.png" height="20"/></a> [countNeighbors3D.py](https://github.com/clij/clij2-docs/blob/master/src/main/jython/countNeighbors3D.py)  


[Back to CLIJ2 reference](https://clij.github.io/clij2-docs/reference)
[Back to CLIJ2 documentation](https://clij.github.io/clij2-docs)

[Imprint](https://clij.github.io/imprint)
