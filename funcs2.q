// get elements of list x where xi is divisible by y
whereDivisibleBy:{
 x2:x mod y;
 inds:where x2=0;
 x[inds]
 }

// test whereDivisibleBy function
whereDivisibleBy[1 3 5 6 10 20;5]

// round num down to the nearest integer
roundDown:{floor x}

// test roundDown funciton
roundDown 4.1
roundDown 4.1 4.3 4.5 4.8 5.0

// round x to the nearest long
roundToNearest:{
 `long$x
 }

// test roundToNearest function
roundToNearest 4.1 4.3 4.5 4.8 5.0
