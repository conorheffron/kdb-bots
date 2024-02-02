\l partitioned.q
\l enums.q

appendToTable:{[d;p;t;x]
 symLoc:"S"$string[d],"/sym";
 $[()~key symLoc;::;load[symLoc]];
 tab:"S"$string[getPathSym[p;d]],string[t];
 tabd:"S"$string[tab],"/";
 tmp:$[()~key tabd;x;value[tabd],x];
 tabd set .Q.en[d;tmp]
 }

modifyCells:{[d;p;t;c;r;v]
 tab:"S"$string[getPathSym[p;d]],string[t],"/",string[c];
 if[c~`sym;
  addToEnum[c;v];
  `:db/sym set sym;
  es:get tab;
  es[r]:v;
  tab set es];
 if[c<>`sym;
  vals:get[tab];
  vals[r]:v;
  tab set vals];
 }

deleteRows:{[d;p;t;r]
 tab:"S"$string[getPathSym[p;d]],string[t];
 tabd:"S"$string[tab],"/";
 L:til count[get[tab]];
 inds:L _/desc r;
 t:get[tabd];
 t:t[inds];
 tabd set .Q.en[d;t]
 }

// Testing functions
// q modifyRows.q
// appendToTable[`:hdb;2016.01.01;`trade;([]sym:`JPM`GE`GE;size:100 200 300;exchange:`N)]
// appendToTable[`:hdb;2016.01.01;`trade;([]sym:`JPM`BP;size:700;exchange:`T)]

// q hdb
// trade

// q modifyRows.q
// modifyCells[`:hdb;2016.01.01;`trade;`size;1 2;5000]

// q hdb
// trade

// q modifyRows.q
// deleteRows[`:hdb;2016.01.01;`trade;3 4]
