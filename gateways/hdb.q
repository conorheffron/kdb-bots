\p 5012
n:100;

Trade:([]date:asc n?.z.d-til 5;sym:n?`JPM`GE`GS;size:n?100;price:n?1f);
Quote:([]date:asc n?.z.d-til 5;sym:n?`JPM`GE`GS;bidSize:n?100;bidPrice:n?100f;askSize:n?100;askPrice:n?100f);

getTrades:{[args]
 r:selectWhere[`Trade;args];
 (neg .z.w)(r)
 }

getQuotes:{[args]
 r:selectWhere[`Quote;args];
 (neg .z.w)(r)
 }

selectWhere:{[t;args]
 `args set args;
 c:{(in;x;enlist[args[x]])}each key args;
 ?[t;c;0b;()]
 }
