.u.rooms:()!()

.u.join:{[room]
 // Append incoming handle (.z.w) to list of handles in .u.rooms at key room, and return welcome message
 .u.rooms[room]:distinct[.u.rooms[room],.z.w];
 mem_c:count .u.rooms[room];
 "Welcome to the ",string[room]," chat room. You are one of ",string[mem_c]," room members"
 }

.u.leaveh:{[room;h]
 // Remove the handle h from the list of handles in .u.rooms at key room, and return leave message
 .u.rooms[room]:.u.rooms[room] except h;
 "You have successfully left the ",string[room]," chat room"
 }

// This is the function a client will call, which will call .u.leaveh. No changes required here
.u.leave:{[room]
 .u.leaveh[room;.z.w]
 }

.u.chat:{[room;msg]
 // Send message to room members except sender, prepending room username of sender to message in format "[sender] msg"
 to:.u.rooms[room] except .z.w;
 to@\:(0N!;"[",string[room],"][",string[.z.u],"] ",msg); 
 }

// This will remove a disconnecting process from all rooms
.z.pc:{[h]
 .u.leaveh[;h]each key .u.rooms
 }

// comment out port setting for testing chat.q
// \p 4000
