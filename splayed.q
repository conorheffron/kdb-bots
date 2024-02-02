// write splayed table to disk
writeSplay:{[dir;table]
 tenum:.Q.en[dir] get(table);
 getPathSym[table;dir] set tenum
 }

// get path for directory as symbol
getPathSym:{[table;dir] 
 t_str:string table;
 d_str:string dir;
 p_str:d_str,"/",t_str,"/";
 "S"$p_str
 }

// soft delete - remove key but keep column file
softDelete1Col:{[d;t;c]
 p:getPathSym[t;d];
 p_str:string p;
 p_sym:"S"$p_str,".d";
 k:value p_sym;
 kn:k except c;
 .[p_sym;();:;kn]
 }

// re-order columns - can be used to revert soft delete
order1Cols:{[d;t;c]
 p:getPathSym[t;d];
 p_str:string p;
 p_sym:"S"$p_str,".d";
 p_sym set c
 }

// delete column
delete1Col:{[d;t;c]
 p:getPathSym[t;d];
 p_str:string p;
 p_sym:"S"$p_str,".d";
 k:value p_sym;
 kn:k except c;
 col_file:"S"$p_str,string[c];
 $[()~key col_file;p_sym;delCol[col_file;p_sym;kn]]
 }

delCol:{[col_file;p_sym;kn]
 hdel[col_file];
 .[p_sym;();:;kn]
 }

// add new column c with values v
add1Col:{[dir;t;c;v]
 p_sym:` sv dir,t,`.d;
 p_sh:` sv dir,t;
 t_c:count[value[p_sh]];
 key_exists:c in cols[p_sh];
 v_c:count[v];
 v:$[v_c<t_c;t_c#v;v];
 $[key_exists;exists;addNewColumn[p_sh;c;v;p_sym]]
 }

addNewColumn:{[p_sh;c;v;p_sym]
 @[p_sh;c;:;v];
 .[p_sym;();,;c]
 }


// Test Splayed Tables Script - write to disk, soft delete col, re-order cols, and delete col from disk
// q splayed.q
// trade:([]time:3#.z.P;sym:`JPM`GE`GE;size:100 200 300;price:375 412 231;exchange:`N`N`T)
// trade
// writeSplay[`:db;`trade]
// key `:db
// key `:db/trade/

// Load db to verify results
// q db
// trade

// q splayed.q
// softDelete1Col[`:db;`trade;`size]

// order1Cols[`:db;`trade;`time`sym`price`size`exchange]

// delete1Col[`:db;`trade;`asdf]
// delete1Col[`:db;`trade;`size]

// add1Col[`:db;`trade;`price;500]
// add1Col[`:db;`trade;`size;500]
