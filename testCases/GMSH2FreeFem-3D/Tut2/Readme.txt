This second tutorial proposes to generate a more complet 3D mesh - which is compatible with FreeFem++ - using GMSH.
At first, be sure GMSH is installed on your computer.
This tutorial has been done using GMSH 2.8.5 (2014).

// *************** //
// Mesh Generation //
// *************** //

The file "Mesh.geo" can be opened in order to modify the mesh parameters.
It generates a cube with an inner cylinder, representing a volume of matrix containing a fiber. The side length is called "width" and the mesh density "density".
The cylinder "radius" depends on the fiber volume fraction.
Several labels and region numbers are defined and will be useful when solving a problem in Freefem++.
For more details concerning the mesh generation using GMSH, please refer to the website http://gmsh.info/ (Jan 2016)

In GMSH, open the file "Mesh.geo".
In the left side of the GMSH window, unroll the "Mesh" category and click on "3D" so as to generate the 3D mesh.
Then, in the "File" menu, select "Save As".
In the "Type" category, select "Mesh - Gmsh MSH (*.msh)".
Rename the file as you want and finish it by the extension ".msh".
A pop-up window called "MSH Options" will appear, be sure the case "Save all" is unchecked.
If checked, the labels and regions numbers will not be saved.
Finish by clicking on the "OK" button.

// ******************************* //
// Importing the mesh in FreeFem++ //
// ******************************* //

When the mesh is generated, open the script "3D-Mesh-Import.edp" and run it.
The mesh is then imported and plotted.

// ******* //
// Remarks //
// ******* //

There are, of course, numerous options in order to generate the mesh which are presented in the GMSH user manual.
The last tutorial adresses the possibility to generate periodic mesh based on the present one, which is interesting when applying periodic boundary conditions in FreeFem++.

Mael (March 2016)