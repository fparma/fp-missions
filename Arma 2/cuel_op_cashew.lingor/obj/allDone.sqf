if ((isServer) && (!("task4" call SHK_Taskmaster_isCompleted))) then {
sleep 4;
["task4", "succeeded"] call SHK_Taskmaster_upd;
};

sleep 12;

if (!boomArt) then {
cutText ["All main objectives completed. Good job.","PLAIN"];
} else {
cutText ["All mission objectives complete! Outstanding work soldier!","PLAIN"];
};
sleep 15;
endMission "END1";