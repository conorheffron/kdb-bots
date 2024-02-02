// create dictionary from columns x and values y
createDict:{x!(y)}

// test createDict
createDict[`a`b`c;10 20 30]

// convert dictionary x to table 99h -> 98h
dictToTable:{
 r:(count')x;
 i:where value r<>1;
 $[i~7h$();enlist x;flip x]
 }

// test dictToTable
dictToTable `a`b`c!1 2 3
dictToTable `a`b`c!(1 2 3;10 20 30;100 200 300)

// count number of elements for each element in dictionary
countHandles:{
 (count')x
 }

// test countHandles
countHandles`a`b`c!(1 2;3 4 5 6;enlist 7)

// remove all occurences of element e from dictionary d
removeHandles:{[d;e]
 `e set e;
 {x except e} each d
 }

// test remove handles
removeHandles[`trade`quote`book!(3 4i;4 5i;3 4 6i);3i]
removeHandles[`trade`quote`book!(3 4i;4 5i;3 4 6i);3 4i]
