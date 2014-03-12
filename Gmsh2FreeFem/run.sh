gmsh -2 -format mesh -string 'Mesh.SaveElementTagType=2;' -o geom.3.mesh geom.geo

awk -f 3to2.awk geom.3.mesh > geom.msh

FreeFem++ freefemcode.edp
