cron.ID:1000;					// let's start our job IDS at 1000 (completely arbitrary)
.cron.jobs:1!flip`jobId`func`args`typ`interval`start`end!"j**sjpp"$\:();		// alternative way of defining a table
`.cron.jobs upsert (0N;`;enlist(::);`;0N;0Wp;-0Wp);							// insert a dummy record in the first row that will enforce the args column to remain generic

// .cron.add - adds a job to .cron.jobs
// func - a symbol containing the name of a function
// args - Most often a function run by cron won't require arguments, but best to make it flexible
// typ - This can be one of:
// -> `O - means once i.e. should be removed from the scheduled jobs when it runs
// -> `R - repeat - should run according to the interval
// interval - number of nanoseeconds between each tick
// start - start time (a timestamp) - job should not run before this time
// start - end time (a timestamp) - job should not run after this time
// Each time .cron.add is called, .cron.ID should be incremented by 1 and used to populate the jobId column

.cron.add:{[func; args; typ; interval; start; end]
 cron.ID+:1;
 `.cron.jobs insert(cron.ID;func;args;typ;interval;start;end) 
 }

.cron.run:{[id] 		// accepts a job id as its argument, runs that job
 r:exec from `.cron.jobs where jobId=id;
 f:eval(r[`func];r[`args]);
 $[type[f]~type[2020.02.02];f;$[count[r[`args]]~2;(+/)r[`args];f[0]]]
 }

.cron.delete:{[id] 	// deletes a job with that id from .cron.jobs
 delete from `.cron.jobs where jobId=id
 }

.cron.enable:{[period] 		// modifies \t to enable cron - period is in milliseconds
 system "t ",string[period];
 }

.cron.disable:{ 	// modifies \t to disable cron
 system "t 0";
 }

// Update cron job details:
// If `R (repeating job) - increment cron job start time by interval
// If `O (one-time job) - set start time to match end time
.cron.update:{[id]		// update interval
 old:exec from `.cron.jobs where jobId=id;
 `old_t set old[`typ];
 $[`R~old_t;old[`start]+:old[`interval];$[`O~old_t;old[`start]:old[`end];::]];
 `.cron.jobs upsert(old);
 }

.z.ts:{ 
 // get qualified jobs
 job_ids:exec jobId from `.cron.jobs where .z.P within (start;end);
 // run jobs
 .cron.run each job_ids;
 // update table
 .cron.update each job_ids;
 }
