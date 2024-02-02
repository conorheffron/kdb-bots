// add enum values es to enum e
addToEnum:{[e;es]
 r:$[e~key[e];get[e],es;es];
 e set distinct[r];
 e$es
 }

// get the values of enum x only
resolveEnum:{
 get(x)
 }

// validate enum x is of type enum (20-76h)
isEnum:{
 L:-57#til 77h;
 L:`short$L;
 type[x] in L
 }
