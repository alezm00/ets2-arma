[] execVM "vars.sqf";
["players"] execVM 'player_markers.sqf';
[] execVM "fnc.sqf";
[] execVM "nametags.sqf";
[] execVM "fuel_sys.sqf";
[] execVM "progress_sys.sqf";

VAR_SOLDI = "azm_hsoldi";
VAR_VEICOLI = "azm_hveicoli";
VAR_VIAGGI = "azm_hviaggi";



/**


//meccanico
this addaction ["Apri garage meccanici",{if (player getVariable "azm_meccanico") then {["azm_garage_mec"] call azm_fnc_opengui;}}];
this addAction ["<t color='#7FFF00'>Diventa Meccanico</t>",{call azm_fnc_divmec},[],30,false,true,"","",10];
this addAction ["<t color='#fd0209'>Lascia il lavoro di meccanico</t>",{call azm_fnc_lascia_mec},[],30,false,true,"","",10];

//garage concessionario
this addAction ["Apri Garage",{["azm_garage_gui",'garage_1'] call azm_fnc_opengui}];
this addaction ["Apri concessionario",{["azm_conce_gui"] call azm_fnc_opengui;}];


//fornitore pretrolifero
this addAction ["<t color='#7FFF00'>Diventa fornitore petrolifero</t>",{["benzina"]call azm_open_confirm},[],30,false,true,"","",10];
this addAction ["<t color='#fd0209'>Lascia il lavoro di fornitore petrolifero</t>",{call azm_rem_benzina},[],30,false,true,"","",10];
this addaction ["Apri garage benzinaio",{if (player getVariable "azm_benzinaio") then {call azm_fnc_benz_gui}},[],30,false,true,"","",10];

bis_fnc_initAmmoBox
*/


lista_pompe = ["Land_fs_feed_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_Feed_F","Land_FuelStation_01_pump_malevil_F"];


_pump = nearestObjects [[worldSize/2,worldSize/2,0],lista_pompe,50000];
{
	_x setFuelCargo 0;
	_x addAction ["<t color='#f2e868'>Fai rifornimento</t>",{call azm_fuel_opengui},[],50,false,true,"","",2];
	_x setVariable ["azm_fuel_rimasto",round(random[0,2,5]),true];
} forEach _pump;
