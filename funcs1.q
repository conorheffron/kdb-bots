isWholeNumber:{
 x_t:type x;
 // supported types: short, int and long atoms
 supp_t:(-5h;-6h;-7h);
 x_t in supp_t
 }

// test isWholeNumber function
isWholeNumber 4.5
isWholeNumber 4
isWholeNumber 4h
isWholeNumber 4j
isWholeNumber"a"

// multiply second item in list by 2
doubleSecondItem:{
 x[1]*:2;
 x
 }

// test doubleSecondItem function
doubleSecondItem 10 20 30 40 50

// return list without the last two elements
dropLastTwoItems:{
 // x except -2#x slow
 x[til count[x]-2]
 }

// test dropLastTwoItems function
dropLastTwoItems 1 2 3 4
dropLastTwoItems "abcde"

transpose:{flip x}

transpose(1 2 3 4;10 20 30 40;100 200 300 400)

// get index of element x in list y (first occurrence)
getIndexOf:{
 inds:where x=y;
 inds[0]
 }

// test getIndexOf function
getIndexOf[`john`mike`pat`tim`harry;`pat]

// get first day of next month where x is date from current month
firstDayOfNextMonth:{
 // cast date to month
 m:`month$x;
 // add 1 to month and cast back to date to get the first day of the month
 r:`date$m+1;
 r
 }

// test firstDayOfNextMonth funciton
firstDayOfNextMonth 2015.01.01
firstDayOfNextMonth 2015.01.11
firstDayOfNextMonth 2015.01.31
firstDayOfNextMonth 2015.02.27
