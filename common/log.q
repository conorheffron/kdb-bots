// print log message
.log.print:{[typ;msg]
 0N!string[.z.p]," ",typ," ",msg
 }

// logging levels
.log.info:{[msg]
 .log.print["INFO";msg];
 }

.log.warn:{[msg]
 .log.print["WARN";msg];
 }

.log.error:{[msg]
 .log.print["ERROR";msg];
 }

// test log levels
.log.info"process has started";
.log.warn"process is using 1.4 GB of RAM";
.log.error"data is in the wrong format";
