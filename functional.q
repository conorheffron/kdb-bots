\l queries.q

// Functional select - get columns by symbols
getColsForSyms:{[t;c;s]
 c:$[count[c]~1;enlist[c];c];
 ?[t;enlist(in;`sym;enlist[s]);0b;c!c]
 }

// Dynamic Functional Select
dynamicBy:{[t;c]
 c:$[count[c]~1;enlist[c];c];
 ?[t;();c!c;()]
 }
