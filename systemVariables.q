// get IP
getIP:{
 ip:system"hostname -i";
 ipf:"" sv ip;
 res:" " vs ipf;
 "S"$res[0]
 }

// set variables for todays date and current timestamp
today:{.z.d}
now:{.z.p}

// test functions/variables
getIP[]
today[]
now[]
