//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.0 - 2010    //
//--------------------------//
//    DAC_Config_Events     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_TypNumber","_TempArray","_Events_Vehicle",
			"_Events_Unit_S","_Events_Unit_V","_Events_Unit_T","_Events_Unit_A","_Events_Unit_C","_Events_Unit_H"
		];

			_TypNumber = _this select 0;_TempArray = [];

switch (_TypNumber) do
{
//-------------------------------------------------------------------------------------------------------------------------
//------------ Events => Create | ReachWP | NotAliveGroup | NotAliveUnit | (BeforeReduce) | (AfterBuildUp) ----------------
//-------------------------------------------------------------------------------------------------------------------------
	case 1:
	{
		_Events_Unit_S =	[
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_V = 	[
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_T = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Unit_A = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Unit_C = 	[
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_H = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Vehicle =	[
								["_vehc lock true; _vehc allowCrewInImmobile true"],
								["_vehc lock true; _vehc allowCrewInImmobile true"],
								[]
							];
	};
//-------------------------------------------------------------------------------------------------
	case 2:
	{
		_Events_Unit_S =	[
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_V = 	[
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_T = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Unit_A = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Unit_C = 	[
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_H = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Vehicle =	[
								[],
								[],
								[]
							];
	};
//-------------------------------------------------------------------------------------------------
	case 3:
	{
		_Events_Unit_S =	[
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_V = 	[
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_T = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Unit_A = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Unit_C = 	[
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_H = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Vehicle =	[
								[],
								[],
								[]
							];
	};
//-------------------------------------------------------------------------------------------------

	Default {
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
					hintc "Error: DAC_Config_Events > No valid config number";
				};
				if(true) exitwith {};
			};
};

_TempArray = [_Events_Unit_S,_Events_Unit_V,_Events_Unit_T,_Events_Unit_A,_Events_Unit_C,_Events_Unit_H,_Events_Vehicle];
_TempArray