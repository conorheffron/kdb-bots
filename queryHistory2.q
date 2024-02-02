.ipc.history:enlist`startTime`endTime`event`handle`user`query`result`success!(0Np;0Np;`;0Ni;`;::;::;0b)

historyUpd:{[t;query]
 start_t:.z.p;
 r:@[value ; query; string :];
 end_t:.z.p;
 success:$[10h~type[r];0b;1b];
 `.ipc.history insert (start_t;end_t;t;.z.w;.z.u;query;r;success);
 r
 }

.z.pg:{
 historyUpd[`.z.pg;x]
 }

.z.ps:{
 historyUpd[`.z.ps;x]
 }
