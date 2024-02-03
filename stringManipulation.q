// return x as string no matter the actual type of x
ensureStr:{
 $[type[x]=10h;x;string x]
 }

// test ensureStr
ensureStr"a"
ensureStr"abc"
ensureStr`abc
ensureStr 10

// get size of list and return size as part of message (string)
getListCount:{
 c:count x;
 s:" item";
 r:$[c<>1;s,"s";s];
 "The list has ",string[c],r
 }

// test getListCount function
getListCount enlist 1
getListCount 1 2
count getListCount 1 2
getListCount "abc"
getListCount ""

// print list count and return identity
printListCount:{
 0N!getListCount[x];
 }

// test printListCount function
(::)~printListCount "abc"

// check characters in string are all upper case format
isAllCaps:{
 $[any distinct[(),x] in .Q.a;0b;1b]
 }

// test isAllCaps function
isAllCaps"a"
isAllCaps"A"
isAllCaps"aaB"
isAllCaps"BBB"
isAllCaps"ABC_123"
isAllCaps "ABC|~"

// check if string x begins with string y
startsWith:{y~x[til count[y]]}

// test startsWith function
startsWith["abcdef";"abc"]
startsWith["abcdef";"bc"]
