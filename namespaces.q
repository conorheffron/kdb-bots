// create name space from name space root, n properties, and values
createNamespace:{[ns;n;v]
 `ns set ns;
 // props: join name space root and config value name 
 // i.e. 
 // `test`firstName
 // `test`lastName
 props:{`,ns,x} each n;
 // props_formatted:
 // `test.firstName
 // `test.LastName
 props_formatted:{` sv x} each props;
 // create dictionary of props -> values
 d:props_formatted!v;
 `d set d;
 // set name space values by key of dictionary d
 {x set d[x]} each key d
 }

createNamespace[`test;`firstName`lastName;`John`Murphy]
