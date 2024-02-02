\l splayed.q

writePartition:{[dir;p;t]
 t_str:string[t];
 p_str:string[p];
 pt:"S"$p_str,"/",t_str;
 tenum:.Q.en[dir] get(t);
 getPathSym[pt;dir] set tenum
 }

allPaths:{[dir]
 fs:1_string[dir];
 L:system "ls ",fs;
 r:L where L like "????.??.??";
 `dir set dir;
 {"S"$string[dir],"/",x}each r
 }

softDeleteCol:{[d;t;c]
 p:allPaths[d];
 `t set t;
 `c set c;
 {softDelete1Col[x;t;c]}each p
 }

orderCols:{[d;t;c]
 p:allPaths[d];
 `t set t;
 `c set c;
 {order1Cols[x;t;c]}each p
 }

deleteCol:{[d;t;c]
 p:allPaths[d];
 `t set t;
 `c set c;
 {delete1Col[x;t;c]}each p
 }

addCol:{[d;t;c;v]
 p:allPaths[d];
 `t set t;
 `c set c;
 `v set v;
 {add1Col[x;t;c;v]}each p
 }

// q partitioned.q
// trade:([]time:3#.z.P;sym:`JPM`GE`GE;size:100 200 300;price:375 412 231;exchange:`N`N`T)
// trade
// writePartition[`:hdb;2016.03.21;`trade]
// writePartition[`:hdb;2016.03.20;`trade]
// \\

// ll hdb/
// ll hdb/2016.03.20
// ll -a hdb/2016.03.20/trade/

// Load and verify partitioned DB
// q hdb/
// trade
// \\

// q partitioned.q
// allPaths `:hdb
// softDeleteCol[`:hdb;`trade;`size]
// orderCols[`:hdb;`trade;`time`sym`price`size`exchange]
// deleteCol[`:hdb;`trade;`size]
// addCol[`:hdb;`trade;`size;700]
