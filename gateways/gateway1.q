\p 5050

\l ../queryHistory2.q
 
rdbh:hopen 5011;
query:{[func;args]
 // Route query to the rdb using the above rdb handle
 rdbh(func;args)
 }
