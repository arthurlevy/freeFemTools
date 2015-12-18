Paraview export.

This is an exemple of a 3D export to paraview.

time handling is tricky. You should run the edp file thqt produces a series of .vtk files. Then, you should convert the .vtk legacy paraview format to .vtu xml format.
And finally you create a .pvd paraview wrapper file that defines the collection of vtu file with the correct times.

This is automatized in the postProcessing bash shell script.

Also, once in paraview you can load state the script file for automatically produce the same plot conditions. 