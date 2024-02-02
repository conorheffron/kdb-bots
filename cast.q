// convert string to list
fromDelimitedString:{ 
 L:x vs z;
 y$L
 }

toFullName:{
 "S"$string[x]," ",string[y]
 }

// test functions
fromDelimitedString[",";"SJF*";"JPM,100,4.5,test string"]
toFullName[`John;`Murphy]
// returns `John Murphy
