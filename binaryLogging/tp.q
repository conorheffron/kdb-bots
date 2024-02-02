Trade:([]sym:0#`;size:0#0;price:0#0n)
Quote:([]sym:0#`;bid:0#0n;ask:0#0n;bidSize:0#0;askSize:0#0)

.u.L:`:myLogFile;

.u.i:0;

.u.subscribers:();

.u.init:{
 // Check if log file exists, if not initialize it
 if[()~key .u.L; .u.L set ()];
 }

.u.dataToKTab:{[t;x]
 f:{raze x};
 `f set f;
 if[t~`Trade;
  sym:{f[x][0]}each x;
  size:{f[x][1]}each x;
  price:{f[x][2]}each x;
  d:`sym`size`price!(sym;size;price);
  kdb_t:flip d];
 if[t~`Quote;
  f:{raze x}
  sym:{f[x][0]}each x;
  bid:{f[x][1]}each x;
  ask:{f[x][2]}each x;
  size:{f[x][3]}each x;
  exsize:{f[x][4]}each x;
  d:`sym`bid`ask`size`exsize!(sym;bid;ask;size;exsize);
  kdb_t:flip d];
 kdb_t
 }

.u.upd:{[t;x]
 // Convert the data into a KDB table
 kdb_t:.u.dataToKTab[t;flip x];
 `kdb_t set kdb_t;
 `t set t;
 // publish the update out to any handles in .u.subscribers in the format (`upd;t;[KDB TABLE])
 {x(upsert;t;kdb_t)}each .u.subscribers;
 // Log the update to the log file in the format ,(`upd;t;[KDB TABLE])
 h:hopen .u.L;
 h enlist(`upd;t;kdb_t);
 hclose h;
 // increment .u.i by 1
 .u.i+:1;
 }
 
.u.sub:{.u.subscribers,:.z.w}

.u.init[];

// Notes for testing TP, Feed and Subscriber
// cd binaryLogging

// Test Ticker Plant
// q tp.q -p 5000
// .u.subscribers

// Test Feed
// q feed.q
// .feed.Trade
// .feed.Quote

// Test Subscriber
// q sub.q
// count Trade
// count Quote
// Trade
