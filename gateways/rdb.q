\p 5011

n:100;

Trade:([]sym:n?`JPM`GE`GS;size:n?100;price:n?1f);
Quote:([]sym:n?`JPM`GE`GS;bidSize:n?100;bidPrice:n?100f;askSize:n?100;askPrice:n?100f);
  
getTrades:{[args]
 selectWhere[`Trade;args]
 }
 
getQuotes:{[args]
 selectWhere[`Quote;args]
 }

selectWhere:{[t;args]
 `args set args;
 c:{(in;x;enlist[args[x]])}each key args;
 ?[t;c;0b;()]
 }
