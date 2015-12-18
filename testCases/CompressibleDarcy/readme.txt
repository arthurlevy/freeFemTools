CompressibleDacy.

Usage : FreeFem++ CompressibleDarcy.edp


This solves a Darcy flow for a compressible ideal gaz at constant temperature.
ie density proportional to pressure.
the equation to solve is (Darcy law and continuity) reduces to :
 \div (P . K/mu . \grad(P)) =  0
where K is the permeability tensor and mu the fluid viscosity. P is the pressure.
the spatial problem is solved using Finite Element with library FreeFem++. (LGPL)
this is a non linear problem that is solved using a Newton Raphson (NR) method.
test case hereunder is for Jim case.
A.L nov. 10 2012