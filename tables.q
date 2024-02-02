\l common/schema.q

// enable table insert
BATCH:1b

// update - insert data in table if enabled or return copy of date in table format
upd:{[t;d]
 d_c:count[raze[d]];
 t_c:count[cols[t]];
 rows:d_c % t_c;
 `rows set rows;
 data:$[rows>1;flip[cols[t]!(d)];enlist[cols[t]!(d)]];
 $[BATCH;t insert(d);data]
 }

// select all from table t where s in sym column
filterOnSym:{[t;s]
 select from t where sym in s
 }

// return a copy c of table t with keys k set
returnKeyedTable:{[t;k]
 c:get t;
 xkey[k;c]
 }

// return table t with keys k set
applyKeyToTable:{[t;k]
 xkey[k;t]
 }
