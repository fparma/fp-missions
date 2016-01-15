private ["_pos","_trg"];
_pos = [4134.7583,4074.6431,16.857695];

["civilian_city", 0, _pos] call mso_core_fnc_createCompositionLocal;

_trg = createTrigger["EmptyDetector", [4139.0952,4085.3003,17.042225]];
_trg setTriggerStatements ["true", "", ""];
_trg setSoundEffect ["Env102", "", "", "arabian_market_1"];

_trg = createTrigger["EmptyDetector", [4239.1582,4141.4668,26.757397]];
_trg setTriggerArea [150, 150, 0, false];
_trg setTriggerStatements ["true", "", ""];
_trg setSoundEffect ["Env102", "", "", "Muslim_prayer1"];

_trg = createTrigger["EmptyDetector", [4209.6709,3978.1343,26.747063]];
_trg setTriggerArea [20, 20, 0, false];
_trg setTriggerStatements ["true", "", ""];
_trg setSoundEffect ["Env102", "", "", "RadioMusic2_EP1"];

_trg = createTrigger["EmptyDetector", [4073.1948,4102.6963,23.128082]];
_trg setTriggerArea [20, 20, 0, false];
_trg setTriggerStatements ["true", "", ""];
_trg setSoundEffect ["Env102", "", "", "RadioMusic1_EP1"];

_trg = createTrigger["EmptyDetector", [4104.5195,4107.9497,18.963051]];
_trg setTriggerStatements ["true", "", ""];
_trg setSoundEffect ["Env102", "", "", "LittleDogSfx"];

_trg = createTrigger["EmptyDetector", [4031.7222,4027.4575,16.090508]];
_trg setTriggerStatements ["true", "", ""];
_trg setSoundEffect ["Env102", "", "", "CockSfx"];

_trg = createTrigger["EmptyDetector", [4012.7036,3974.646,16.233406]];
_trg setTriggerStatements ["true", "", ""];
_trg setSoundEffect ["Env102", "", "", "CowSfx"];
