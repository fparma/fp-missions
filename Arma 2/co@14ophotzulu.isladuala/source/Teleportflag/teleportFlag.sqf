//------------------------------
// Teleport action script
// Created by: Pelle - SSG, 2009
// Edited: 2011-12-01
//------------------------------

_caller = _this select 1;
_target = _this select 3;
_dir = getDir _caller;


switch (_target) do 
{
	//Sierra
	case 0: 
	{
		_dir = getDir s10;		
		_caller setPos [(getpos s10 select 0),(getpos s10 select 1),(getpos s10 select 2)];
		_caller setDir _dir;
	};
	//Alpha 0
	case 1: 
	{
		_dir = getDir a00;
		_caller setPos [(getpos a00 select 0),(getpos a00 select 1),(getpos a00 select 2)];
		_caller setDir _dir;
	};
	//Bravo 0
	case 2: 
	{
		_dir = getDir b00;
		_caller setPos [(getpos b00 select 0),(getpos b00 select 1),(getpos b00 select 2)];
		_caller setDir _dir;
	};	
	//Charlie 0
	case 9: 
	{
		_dir = getDir c00;
		_caller setPos [(getpos c00 select 0),(getpos c00 select 1),(getpos c00 select 2)];
		_caller setDir _dir;
	};		
//---------------------------------------//	
	//Alpha 1
	case 3: 
	{
		_dir = getDir a11;
		_caller setPos [(getpos a11 select 0),(getpos a11 select 1),(getpos a11 select 2)];
		_caller setDir _dir;
	};	
	//Alpha 2
	case 4: 
	{
		_dir = getDir a21;
		_caller setPos [(getpos a21 select 0),(getpos a21 select 1),(getpos a21 select 2)];
		_caller setDir _dir;
	};	
	//Alpha 3
	case 5: 
	{
		_dir = getDir a31;
		_caller setPos [(getpos a31 select 0),(getpos a31 select 1),(getpos a31 select 2)];
		_caller setDir _dir;
	};	
//---------------------------------------//
	//Bravo 1
	case 6: 
	{
		_dir = getDir b11;
		_caller setPos [(getpos b11 select 0),(getpos b11 select 1),(getpos b11 select 2)];
		_caller setDir _dir;
	};	
	//Bravo 2
	case 7: 
	{
		_dir = getDir b21;
		_caller setPos [(getpos b21 select 0),(getpos b21 select 1),(getpos b21 select 2)];
		_caller setDir _dir;
	};	
	//Bravo 3
	case 8: 
	{
		_dir = getDir b31;
		_caller setPos [(getpos b31 select 0),(getpos b31 select 1),(getpos b31 select 2)];
		_caller setDir _dir;
	};	
//---------------------------------------//	
	//charlie 1
	case 6: 
	{
		_dir = getDir c11;
		_caller setPos [(getpos c11 select 0),(getpos c11 select 1),(getpos c11 select 2)];
		_caller setDir _dir;
	};	
	//charlie 2
	case 7: 
	{
		_dir = getDir c21;
		_caller setPos [(getpos c21 select 0),(getpos c21 select 1),(getpos c21 select 2)];
		_caller setDir _dir;
	};	
	//charlie 3
	case 8: 
	{
		_dir = getDir c31;
		_caller setPos [(getpos c31 select 0),(getpos c31 select 1),(getpos c31 select 2)];
		_caller setDir _dir;
	};	
//---------------------------------------//	
	//hem
	case 200: 
	{
		_caller setPos [(getpos flaggan select 0),(getpos flaggan select 1),(getpos flaggan select 2)];
	};	
	//flaggan2
	case 201: 
	{
		_caller setPos [(getpos flaggan2 select 0),(getpos flaggan2 select 1),(getpos flaggan2 select 2)];
	};		

};											