isIdenticalTo:{
 x_s:count x;
 y_s:count y;
 x_t:type x;
 y_t:type y;
 // LX/LY is size, type and values of given lists
 LX:(x_s;x_t;x);
 LY:(y_s;y_t;y);
 // compare list stats/vals
 r:LX~LY;
 r
 }

isPositive:{x>0}

subtractFrom10:{10-x}

double:{x*2}

// Test functions
isIdenticalTo[3;3]
isIdenticalTo[3;3f]
isPositive -4 0 3
subtractFrom10 3
double 3 4 5
