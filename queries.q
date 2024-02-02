// Load schema and cron scripts
\l common/schema.q
\l common/cron.q

// insert random quote to quote table
randQuote:{
 `quote insert(.z.P;rand[`JPM`GE`BP`MSFT];rand til 10000;rand til 1000;rand til 1000;rand til 10000;rand[`N`L`T])
 }

// insert random trade to trade table
randTrade:{
 `trade insert (.z.P;rand[`JPM`GE`BP`MSFT];rand til 10000;rand til 10000;rand[`B`S];rand[`N`L`T])
 }

// test randQuote/randTrade functions as cron jobs
.cron.add[`randQuote;enlist(::);`R;1000;.z.P;.z.P+00:01]
.cron.add[`randTrade;enlist(::);`R;5000;.z.P;.z.P+00:01]

// get size sum per sym in trade table
getVolumePerSym:{
 select sum size by sym from `trade
 }

// get weithed average price to size by sym in trade table
getVWAPPerSym:{
 select vwap:size wavg price by sym from `trade
 }

// get all trades where size is greater than average size per sym (nested query which uses fby)
getLargerThanAvgTrades:{
 select from `trade where size > (avg;size) fby sym
 }

// rename table columns (table t;columns to change c;and new column names n)
renameColumn:{[t;c;n]
 new_cols:cols[t];
 ind:new_cols?c;
 new_cols[ind]:n;
 t:new_cols xcol t;
 t
 }
