azm_debug = false;  //if (azm_debug) then {


veicoli_attivi = [];


divisore_guadagno = 0.02;


sell_drecrease = 0.5;


moltiplicatore_meccanico = 5;


timer_cancella_lavoro_strade = 30; // in secondi

//fuel sysyem

moltiplicatore_benzina = 12;
veicoli_benzinai = ["C_Van_01_fuel_F", "C_Truck_02_fuel_F", "C_IDAP_Truck_02_water_F", "B_T_Truck_01_fuel_F", "O_T_Truck_03_fuel_ghex_F"];


admin_list = [
	"76561198164382639"
];



lista_stop = [];
{
	private _split = _x splitString "";
	if ("_" in _split) then {
		_split = _x splitString "_";
		if ((_split select 0) isEqualTo "cons") then {lista_stop pushBack [_x,markerText _x]};
	}	
} forEach allMapMarkers;
//diag_log str(lista_stop);


lista_start = [];
{
	private _split = _x splitString "";
	if ("_" in _split) then {
		_split = _x splitString "_";
		if ((_split select 0) isEqualTo "start") then {lista_start pushBack [_x,markerText _x]};
	}	
} forEach allMapMarkers;
//diag_log str(lista_start);


carico_casuale = ["Patate","Scatole","Vasi","Iphone X","Meloni","Scatole Vuote","Travi per rotaie","Assi di legno","Tegole","Vasi"];

	
veicoli_concessionario = [
	["C_Quadbike_01_F",0,5],
	["C_Hatchback_01_F",3000,10],
	["C_Offroad_01_F",13000,20],
	["C_SUV_01_F",17000,25],
	["C_Offroad_02_unarmed_F",20000,27],
	["C_Van_01_transport_F",30000,35],
	["C_Van_01_box_F",40000,40],
	["C_Van_02_vehicle_F",50000,45],
	["C_Van_02_transport_F",50000,45],
	["C_Truck_02_covered_F",60000,55],
	["C_Truck_02_transport_F",67000,63],
	["B_Truck_01_mover_F",75000,67],
	["B_T_Truck_01_covered_F",80000,73],
	["B_T_Truck_01_transport_F",84000,76],
	["B_T_Truck_01_box_F",95000,85],
	["O_Truck_03_covered_F",100000,95],
	["O_Truck_03_transport_F",115000,105]
];



veicoli_meccanico = ["C_Offroad_01_repair_F","C_Van_02_service_F","C_Truck_02_box_F","B_Truck_01_Repair_F","O_Truck_03_repair_F","C_Heli_Light_01_civil_F"];







[] spawn {
	sleep 2;
	if (isNil {profileNamespace getVariable VAR_SOLDI}) then {profileNamespace setVariable [VAR_SOLDI,10000];};
	if (isNil {profileNamespace getVariable VAR_VEICOLI}) then {profileNamespace setVariable [VAR_VEICOLI,[]];};
	if (isNil {profileNamespace getVariable VAR_VIAGGI}) then {profileNamespace setVariable [VAR_VIAGGI,0];};
	sleep 1;
	saveProfileNamespace;
};

