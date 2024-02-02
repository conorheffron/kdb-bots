\l common/cron.q

.u.subscribers:();
n:100;
trade:([]sym:n?`3;size:n?100;price:n?1f); / ? is for random generation, n?`N generates n random symbols of N characters each
 
// Function called .u.sub, which takes no arguments but merely adds the caller's handle to .u.subscribers
.u.sub:{
 .u.subscribers,:.z.w
 }

// Each time a handle disconnects from the process you should remove this handle from .u.subscribers, if it is in there
.z.pc:{[h]
 if[h in .u.subscribers;
  .u.subscribers:.u.subscribers except h;];
 }

// Using cron you should schedule a function (you can choose the name) to run every second
.cron.add[`myUpsert;enlist(::);`R;1000;.z.P;.z.P+00:01]

// This function should upsert a random record from the above trade table into each of its subscribers
myUpsert:{
 ri:rand 1?100;
 `r set trade[ri];
 {x(upsert;`trade;enlist[r])}each .u.subscribers;
 }

// Test Publisher 1
// q pub1.q -p 5000
// .u.subscribers
// .cron.enable 1000
// .cron.disable[]

// Test Subscriber 1
// q
// h:hopen 5000
// h".u.sub[]"
// count trade
// trade
// count trade
