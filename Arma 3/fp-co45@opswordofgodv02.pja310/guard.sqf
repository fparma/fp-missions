_unit = _this select 0;

_unit setVariable ["fp_noDelete", true];

sleep 10;

removeheadgear _unit;
removegoggles _unit;
removeuniform _unit; 
removeallweapons _unit;
removevest _unit;
_unit unassignitem "NVGoggles";
_unit removeitem "NVGoggles";

_unit forceadduniform "rhs_uniform_mflora_patchless";
_unit addgoggles "G_Balaclava_oli";
_unit addVest "rhs_6sh92_radio";
_unit addHeadgear "H_Beret_blk";

[_unit,"rhs_weap_akms",5] call bis_fnc_addweapon; 

_faces = [
	'AfricanHead_01',
	'AfricanHead_02',
	'AfricanHead_03'
];

_unit setFace (_faces call bis_fnc_selectRandom);