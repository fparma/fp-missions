
if (isServer) then {
    waitUntil {!isNil "gm2" && {isPlayer gm2}};
    group tr1 setGroupOwner (owner gm2);
    group tr2 setGroupOwner (owner gm2);
};
