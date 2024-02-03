pyr:{[l]
 m:max each l;
 sum[{$[x~y;0;x]}prior m]
 }

pyr (4;8 9;1 5 3)
pyr (3;9 1;8 7 4;5 7 3 1)
