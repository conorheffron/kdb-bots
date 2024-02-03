h:hopen 5049

/ RDB via sync call
h(`query;`getTrades;.z.d;enlist[`sym]!enlist `JPM)
/ HDB via async call
h(`query;`getTrades;.z.d-5;enlist[`sym]!enlist `JPM)
