waitUntil {sleep 4;(chasetruck1 distance (getMarkerPos "loose1") < 50) || (chasetruck2 distance (getMarkerPos "loose2") < 50)};
["tskChase","failed"] call SHK_Taskmaster_upd;
[nil, nil, rHINT, "The trucks reached their destination. You've failed."] call RE;
sleep 8;
[objNull, objNull, rENDMISSION, "END1"] call RE;
