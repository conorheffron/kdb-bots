\l queries.q

instrument:([sym:`JPM`MSFT`BP]company:`$("JP Morgan Chase";"Microsoft";"British Petroleum");industry:`Banking`Software`Energy;domicile:`USA`USA`UK)

// left join trade and quote tables to see prevailing quote (dont update table schemas)
getPrevailingQuote:{ 
 r:`sym`time xkey trade lj `sym`time xkey quote;
 0!r
 }

// left join trade and quote tables (incl. exchange) to see prevailing quote (dont update table schemas)
getPrevailingLocalQuote:{
 r:`sym`time`exchange xkey trade lj `sym`time`exchange xkey quote;
 0!r
 }
