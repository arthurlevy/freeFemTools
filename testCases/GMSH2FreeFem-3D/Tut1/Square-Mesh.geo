//
//	Mesh Parameters
//

width				= 1.0;
density 			= 1.0e-1;

region 	= 100;

labelbottom 	= 1;
labelright 		= 2;
labeltop 		= 3;
labelleft 		= 4;
labelfront 		= 5;
labelrear 		= 6;

//
//	Geometry
//

Point(1)	=  {0,0,0,density};
Point(2)	=  {width,0,0,density};
Point(3)	=  {width,width,0,density};
Point(4)	=  {0,width,0,density};
Point(5)	=  {0,0,width,density};
Point(6)	=  {width,0,width,density};
Point(7)	=  {width,width,width,density};
Point(8)	=  {0,width,width,density};

Line(10) = {1,2};	Line(20) = {2,3};	Line(30) = {3,4};	Line(40) = {4,1};
Line(50) = {1,5};	Line(60) = {2,6};	Line(70) = {3,7};	Line(80) = {4,8};
Line(90) = {5,6};	Line(100) = {6,7};	Line(110) = {7,8};	Line(120) = {8,5};

Line Loop(11) = {10,20,30,40};			Plane Surface(21) = {11};
Line Loop(12) = {60,100,-70,-20};		Plane Surface(22) = {12};
Line Loop(13) = {10,60,-90,-50};		Plane Surface(23) = {13};
Line Loop(14) = {50,-120,-80,40};		Plane Surface(24) = {14};
Line Loop(15) = {-30,70,110,-80};		Plane Surface(25) = {15};
Line Loop(16) = {90,100,110,120};		Plane Surface(26) = {16};

Surface Loop(31) = {21,22,23,24,25,26};

Volume(32) = {31};

// Labels and regions affection

Physical Surface(labelfront) 	= {21};
Physical Surface(labelright) 	= {22};
Physical Surface(labelleft) 	= {24};
Physical Surface(labelbottom) 	= {23};
Physical Surface(labeltop) 		= {25};
Physical Surface(labelrear) 	= {26};

Physical Volume(region) = {32};

