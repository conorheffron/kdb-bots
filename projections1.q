//casting
toFloat:{9h$x}

toShort:{5h$x}

toInt:{6h$x}

// check val
isZero:{x=0}

isZeroLong:{x~0}

// get halve of value passed and return as float
halve:{r:x%2;`float$r}

// test functions
toFloat 1 2 3
toShort 55
toInt 100
isZero 0
isZero 5
isZero 0h
isZero 0x00
isZero 0b
isZeroLong 0
isZeroLong 1
isZeroLong 0h
isZeroLong 0i
halve 100
halve 2 3 4 5
