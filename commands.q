// set port p to value x
setPort:{
 system "p"," ",string x;
 }

// get port value for current session
getPort:{
 p:system "p";
 p
 }

// amend port by increasing int value by x
amendPort:{
 my_p:system "p";
 new_p:my_p+x;
 setPort[new_p];
 new_p
 }

// change console rows/cols
changeConsole:{[rows;columns]
 system["c ",string[rows]," ",string[columns]];
 }

// check console rows/cols
checkConsole:{
 system "c"
 }

// list q functions
listFunctions:{
 system "f"
 }

// list q variables
listVariables:{
 system "v"
 }

// list q tables
listTables:{
 system "a"
 }
