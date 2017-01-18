//
//	Mesh Parameters
//


width				= 1.0;
densityborder 		= 1.0e-1;
densityinterface	= 1.0e-1;
fibrevolumefraction	= 50;
radius				= width*Sqrt(fibrevolumefraction/(100*3.14));


regionmatrix 	= 1;
regionfibres 	= 2;

labelbottom 	= 1;
labelright 		= 2;
labeltop 		= 3;
labelleft 		= 4;
labelfront 		= 5;
labelrear 		= 6;
labelinterface	= 7;

//
//	Internal Geometry
//

Point(1) = {width/2,width/2,0,densityinterface};
Point(2) = {width/2-radius,width/2,0,densityinterface};
Point(3) = {width/2,width/2-radius,0,densityinterface};
Point(4) = {width/2+radius,width/2,0,densityinterface};
Point(5) = {width/2,width/2+radius,0,densityinterface};

Circle(1) = {2,1,3};
Circle(2) = {3,1,4};
Circle(3) = {4,1,5};
Circle(4) = {5,1,2};

Line Loop(5) = {1,2,3,4};

//
//	External Geometry
//

Point(6)	=	{0,0,0,densityborder};
Point(7)	=	{width,0,0,densityborder};
Point(8)	=	{width,width,0,densityborder};
Point(9)	=	{0,width,0,densityborder};
Point(10)	=	{0,0,width,densityborder};
Point(11)	=	{0,width,width,densityborder};
Point(12)	=	{width,0,width,densityborder};

Line(10) = {6,7};	Line(20) = {7,8};	Line(30) = {8,9};	Line(40) = {9,6};
Line(50) = {6,10};	Line(60) = {10,11};	Line(70) = {11,9};	Line(80) = {10,12};
Line(90) = {12,7};

// External Volume
	
Line Loop(11) = {10,20,30,40};			

Plane Surface(21) = {11,5};

cub[] = Extrude{0,0,width}{
	Surface{21};
};

// Internal volume

Plane Surface(33) = {5};

cyl[] = Extrude{0,0,width}{
	Surface{33};
};

// Labels and regions attribution

Physical Surface(labelfront) 		= {21,33};
Physical Surface(labelright) 		= {cub[5]};
Physical Surface(labelleft) 		= {cub[3]};
Physical Surface(labelbottom) 		= {cub[2]};
Physical Surface(labeltop) 			= {cub[4]};
Physical Surface(labelrear) 		= {cub[0],cyl[0]};
Physical Surface(labelinterface) 	= {cyl[2],cyl[3],cyl[4],cyl[5]};

Physical Volume(regionmatrix) = {cub[1]};
Physical Volume(regionfibres) = {cyl[1]};