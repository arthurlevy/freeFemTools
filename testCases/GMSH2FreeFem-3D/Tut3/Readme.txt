This third tutorial proposes to generate periodic 3D mesh - which is compatible with FreeFem++ - using GMSH.
At first, be sure GMSH is installed on your computer.
This tutorial has been done using GMSH 2.8.5 (2014).

// *************** //
// Mesh Generation //
// *************** //

The file "Mesh.geo" can be opened in order to modify the mesh parameters.
It generates a cube with an inner cylinder, representing a volume of matrix containing a fiber. The side length is called "width" and the mesh density "density".
The cylinder "radius" depends on the fiber volume fraction.
Several labels and region numbers are defined and will be useful when solving a problem in Freefem++.
The generation of periodic surface is done thanks to the command "Extrude".
The syntax of this command is detailed as follow: generated_volume[] = Extrude{lengthx,lengthy,lengthz}{Surface{IDsurface};};
Where IDsurface is the identification number of the surface one wants to extrude, lengthi is the length of the extrusion along the i_th axis and generated_volume is the obtained surface and volume group.
The different components of this generated volume and surface group can be accessed with the command generated_volume[i].
generated_volume[0] is the duplication of Surface{IDsurface}. The nodes generated are exactly at the same position as the reference surface.
Thus, Extrude is a solution to generate periodic meshes.
generated_volume[1] is the geometric volume obtained by the extrusion. 
In the case of the cube, the extrude command generates 4 lateral surfaces, accessible by using the command generated_volume[i], i from 2 to 5.
The process I used was to generate three pairs of identical surfaces thanks to the extrude command. The generated volumes and lateral surfaces were deleted.
Finally, the different pairs were assembled to form a surface loop and then a volume.
This might not be the more efficient way of generating periodic surfaces but it worked for me.
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

// **************************** //
// Applying periodic conditions //
// **************************** //

A finite element space s created, in which the functions are periodic according to all of the external surfaces of the mesh.
If no error message appears during the running of the code then it is OK.
For more details concerning the application of periodic conditions in FreeFem, please read the documentation.

// ******* //
// Remarks //
// ******* //

There are, of course, numerous options in order to generate the mesh which are presented in the GMSH user manual.

Mael (May 2016)