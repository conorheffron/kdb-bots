// change delimiter y of file x to use delimiter z instead
changeDelimiter:{
 data:("SSS";y)0:x;
 x 0: z 0: data;
 }

// load csv using zero where x is file and y is column types
loadCSV1:{
 (y;enlist[","])0:x
 }

// load csv without using zero
loadCSV2:{[fp;typ]
 `typ set typ;
 data:"c"$read1 fp;
 L:"\n" vs data;
 k:L[0];
 L:L[1+til count[L]-2];
 kl:"," vs k;
 kl:"S"$kl;
 LL:{"," vs x}each L;
 `LL set LL;
 r:{typ$LL[x]}each til count[LL];
 flip kl!flip r
 }
