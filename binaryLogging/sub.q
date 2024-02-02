upd:upsert;

.sub.init:{
 h:hopen 5000;
 // get the path to the log file from tp and replay it
 fp:h`.u.L;
 -11!fp;
 // subscribe to the tp
 h".u.sub[]";
 }

.sub.init[];
