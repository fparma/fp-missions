// by Bon_Inf*


_ied = _this select 0;

for "_i" from 0 to 2 do {

	hint format["%1 seconds", (3-_i)*5];

	sleep 5;
};
hint "";


_ied setvariable ["bon_ied_blowit",true,true];