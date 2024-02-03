writeText:{[fp;l]
 // accepts a file path and a list of strings as its two arguments, 
 // writes those lines to the file and returns the file path indicating a successful write
 // fp set l
 fp 0: l
 }

readText:{[fp]
 //  accepts a file path as its sole argument and returns the lines of text in a file
 read0 fp
 }

writePipeDelimtedTable:{[fp;t]
 // accepts a file path and a q table as its two arguments, writes the q table to the file in text format delimted by pipe (|), 
 // and return the file path indicating a successful write
 fp 0: "|" 0: t
 }

readCommaDelimitedTable:{[fp;typ]
 // accepts a file path to a CSV file and list of types (e.g. "SJF" for symbol, long, float) as its two arguments, 
 // and returns a q table with the columns cast to the specified types
 (typ;enlist[","])0:fp
 }

saveBinary:{[fp;obj]
 // accepts a file path and any object (e.g. atom, list, table etc) as its two arguments, 
 // writes the object to disk in binary (serialized format) and returns the path to that file indicating a successful write
 fp 1: `byte$obj
 }

readBinary:{[fp]
 // accepts a file path to a binary file as its sole argument, reads that file from disk and returns a q object
 read1 fp
 }

readBinaryAndCreateVariable:{
 // accepts a symbol as its sole argument, 
 // which represents the name of a binary file in the current directory (\pwd) 
 // - the function should read in this binary file and create a variable in the process with this name, 
 // and the variable should contain whatever is in the file. Finally the function should return the argument that was passed in, 
 // indicating successful creation of the variable
 binary_data:read1 x;
 `x set binary_data;
 x
 }

saveBinaryFromVariable:{ 
 // accepts a symbol as its sole argument, which represents the name of a variable in the q process - 
 // the function should save the variable in the current working directory and return the name of the variable indicating a successful write
 key[x] 1: get`x
 }

// test IO functions
// writeText[`:io/test_out.txt;("hello";"file";"world! end")]

// readText[`:io/test_out.txt]

// writePipeDelimtedTable[`:io/pipe_test.txt;flip`a`b`c!(1 2 3;4 5 6;7 8 11)]

// readCommaDelimitedTable[`:io/test.csv;"SSJ"]

// saveBinary[`:io/test_binary;("hello";"world!")]
// saveBinary[`:./pwd;("pwd")]

// readBinary[`:io/test_binary]
// readBinary[`:./pwd]

// readBinaryAndCreateVariable[`:io/test_binary]

// saveBinaryFromVariable[`:./pwd]
