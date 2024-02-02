\p 5049

\l ../queryHistory2.q

rdbh:hopen 5011;
hdbh:hopen 5012;

query:{[func;d;args]
 $[d~.z.d;rdbh(func;args);(neg hdbh)(func;args)]
 }

.z.ps:{[x]
 h:key .z.W;
 db:(rdbh;hdbh);
 h:h except db;
 h@\:(show;x);
 }
