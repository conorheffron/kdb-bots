\l splayed.q

writePartition:{[dir;p;t]
 pt:getPartitionPath[dir;p;t];
 tenum:.Q.en[dir] get(t);
 pt set tenum
 }

allPaths:{[dir]
 d_str:string dir;
 par_path:"S"$d_str,"/par.txt";
 par_not_exists:()~key par_path;
 paths:$[par_not_exists;enlist[dir];{hsym["S"$x]}each read0[par_path]];
 f1:{[x]system "ls ",x};
 f2:{[L;k]`k set k;{k,"/",x}each L};
 `f1 set f1;
 `f2 set f2;
 L:raze {f2[f1[1_string[x]];1_string[x]]}each paths;
 r:L where L like "*????.??.??*";
 {hsym["S"$x]}each r
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

getPartitionPath:{[d;p;t]
 t_str:string t;
 d_str:string d;
 p_str:string p;
 r_str:d_str,"/",p_str,"/",t_str;
 r:"S"$r_str;
 par_path:"S"$d_str,"/par.txt";
 par_not_exists:()~key par_path;
 r_c:$[par_not_exists;1;count[read0[par_path]]];
 ind:p mod r_c;
 `ind set ind;
 `par_path set par_path;
 `p_str set p_str;
 `t_str set t_str;
 $[par_not_exists;r;getParPathSym[par_path;ind;p_str;t_str]]
 }

getParPathSym:{[par_path;ind;p_str;t_str]
 data:read0 par_path;
 "S"$":",data[ind],"/",p_str,"/",t_str,"/"
 }

// Test functions
// q segmented.q
// getPartitionPath[`:hdb1;2016.01.01;`trade]
// getPartitionPath[`:hdb1;2016.01.02;`trade]
// getPartitionPath[`:hdb1;2016.01.03;`trade]
// getPartitionPath[`:hdb1;2016.01.04;`trade]
// getPartitionPath[`:hdb1;2016.01.05;`trade]

// getPartitionPath[`:hdb2;2016.01.01;`trade]
// getPartitionPath[`:hdb2;2016.01.02;`trade]
// getPartitionPath[`:hdb2;2016.01.03;`trade]
// getPartitionPath[`:hdb2;2016.01.04;`trade]
// getPartitionPath[`:hdb2;2016.01.05;`trade]
