//
//	Mesh Parameters
//

width 				= 1.0;
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

// Face 1
	
Line Loop(11) = {10,20,30,40};			

Plane Surface(21) = {11,5};

cub[] = Extrude{0,0,width}{
	Surface{21};
};

Periodic Surface 21 {Boundary{Surface{21};}} = cub[0] {Boundary{Surface{cub[0]};}};

Delete {
  Volume{cub[1]};
  Surface{cub[2], cub[3], cub[4], cub[5]};
}

// Face 2

Line Loop(12) = {10,-90,-80,-50};	

Plane Surface(22) = {12};

cub2[] = Extrude{0,width,0}{
	Surface{22};
};

Delete {
  Volume{cub2[1]};
  Surface{cub2[2], cub2[3], cub2[4], cub2[5]};
}

Periodic Surface 22 {Boundary{Surface{22};}} = cub2[0] {Boundary{Surface{cub2[0]};}};

// Face 3

Line Loop(13) = {-40,-70,-60,-50};	

Plane Surface(23) = {13};

cub3[] = Extrude{width,0,0}{
	Surface{23};
};

Delete {
  Volume{cub3[1]};
  Surface{cub3[2], cub3[4]};
}

Periodic Surface 23 {Boundary{Surface{23};}} = cub3[0] {Boundary{Surface{cub3[0]};}};

// External Volume

Surface Loop (31) = {21, 22, 23, cub[0], cub[6], cub[7], cub[8], cub[9], cub2[0], cub3[0]};

Volume(32) = {31};

// Internal Volume

Plane Surface(33) = {5};

cyl[] = Extrude{0,0,width}{
	Surface{33};
};

Delete {
  Volume{cyl[1]};
  Surface{cyl[2], cyl[3], cyl[4], cyl[5]};
}

Periodic Surface 33 {Boundary{Surface{33};}} = cyl[0] {Boundary{Surface{cyl[0]};}};

Surface Loop (34) = {33, cyl[0], cub[6], cub[7], cub[8], cub[9]};

Volume(35) = {34};

// Labels and regions attribution

Physical Surface(labelfront) 	= {21,33};
Physical Surface(labelright) 	= {cub2[0]};
Physical Surface(labelleft) 	= {22};
Physical Surface(labelbottom) 	= {23};
Physical Surface(labeltop) 		= {cub3[0]};
Physical Surface(labelrear) 	= {cub[0],cyl[0]};
Physical Surface(labelinterface)= {cub[6], cub[7], cub[8], cub[9]};

Physical Volume(regionmatrix) 	= {32};
Physical Volume(regionfibres) 	= {35};

