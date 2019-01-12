
azm_fuel_opengui = {
	_pump_cursor = cursorObject;
	if (_pump_cursor getVariable "azm_fuel_rimasto" <= 0) exitWith {
		["Questa pompa ha finito il carburante","info",10] spawn azm_fnc_notifica;
		private _marker = createMarker [format ["marker_pump_%1",netId _pump_cursor],_pump_cursor];
		_marker setMarkerType "hd_warning";
		_marker setMarkerColor "ColorKhaki";
		_marker setMarkerText "Questa pompa ha bisogno di rifornimenti";
	};
	createDialog "azm_fuel_gui";
	[99735] spawn Lega_fnc_fadeDisplay;
	vehicle_list_fuel = nearestObjects [player,["Car","Air"],10];
	if (count(vehicle_list_fuel) > 0) then {
		{
			_nome = (getText (configFile >> 'CfgVehicles' >> typeof(_x) >> "displayName"));
			_pic = (getText (configFile >> 'CfgVehicles' >> typeof(_x) >> 'picture'));
			_index = lbAdd [1001,_nome];
			lbSetPicture [1001,_index,_pic];
			lbSetData [1001,_index,netId _x];
		} forEach vehicle_list_fuel;
	} else {
		_index = lbAdd [1001,"NON CI SONO VEICOLI"];
		_index = lbAdd [1001,"NEL RAGGIO DI 15M"];
	};
};


azm_fuel_text = {
	_classe = lbData [1001,lbCurSel 1001];
	{
		if (_classe == netId _x) then {
			_costo = (100 - round(fuel _x * 100)) * moltiplicatore_benzina;
			((findDisplay 99735) displayCtrl 1003) ctrlSetStructuredText parseText format [" Veicolo: %1 <br /><br /> Livello attuale carburante: %2%3 <br /><br /> Prezzo: %4 € <br /><br /> Propietario: %5",(getText (configFile >> 'CfgVehicles' >> typeof(_x) >> "displayName")),round(fuel _x * 100),"%",_costo,name (_x getVariable ["azm_own",objNull])];
		}
	} forEach vehicle_list_fuel;
};


azm_avvia_rifornimento = {
	_classe = lbData [1001,lbCurSel 1001];
	if (_classe == "") exitWith {};
	{
		if (_classe == netId _x) then {
			if (round(fuel _x * 100) == 100) exitWith {["Questo veicolo non ha bisogno di essere rifornito","info",10] spawn azm_fnc_notifica;};
			if (isEngineOn _x) exitWith {["Il motore del veicolo deve essere spento durante il rifornimento","info",10] spawn azm_fnc_notifica;};
			_costo = (100 - round(fuel _x * 100)) * moltiplicatore_benzina;
			//_x setFuel 1;
			closeDialog 0;
			_scalo = profileNamespace getVariable VAR_SOLDI;
			_scalo = _scalo - _costo;
			["Rifornimento in corso","info",10] spawn azm_fnc_notifica;
			_pump_var = (nearestObjects [player,lista_pompe,5]) select 0;
			_pump_var_val = _pump_var getVariable "azm_fuel_rimasto";
			_pump_var_val = _pump_var_val - (1 - fuel _x);
			_pump_var setVariable ["azm_fuel_rimasto",_pump_var_val,true];
			_engine = _x addEventHandler ["Engine", {
				params ["_vehicle", "_engineState"];
				while {_engineState} do {
					_vehicle engineOn false;
				};
			}];
			for "_i" from (fuel _x) to 1 step 0.005 do {
				_x setFuel _i;
				sleep 0.1;
			};
			_x setFuel 1;
			_x removeEventHandler ["Engine",_engine];
			profileNamespace setVariable [VAR_SOLDI,_scalo];
			[format["Hai rifornito il tuo %1 per un costo di %2 €",(getText (configFile >> 'CfgVehicles' >> typeof(_x) >> "displayName")),_costo],"success",10] spawn azm_fnc_notifica;
		}
	} forEach vehicle_list_fuel;
};
//["Land_fs_feed_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_Feed_F"]




/*
this addAction ["<t color='#7FFF00'>Diventa fornitore petrolifero</t>",{["benzina"]call azm_open_confirm},[],30,false,true,"","",10];      
this addAction ["<t color='#fd0209'>Lascia il lavoro di fornitore petrolifero</t>",{call azm_rem_benzina},[],30,false,true,"","",10]; 
this addaction ["Apri garage benzinaio",{if (player getVariable "azm_benzinaio") then {call azm_fnc_benz_gui}},[],30,false,true,"","",10];

 */


azm_div_benzina = {
	if (player getvariable "azm_lavoro_attivo") exitWith {["Non puoi essere un fornitore petrolifero se hai un rimorchio che ti aspetta","warning",10] spawn azm_fnc_notifica;};
	if (player getVariable "azm_benzinaio") exitWith {};
	if (player getVariable "azm_meccanico") exitWith {["Deciditi o meccanico o fornitore petrolifero","warning",10] spawn azm_fnc_notifica;};
	if (count(veicoli_attivi) > 0) exitWith {["Deposita i veicoli attivi prima di lavorare come fornitore petrolifero","warning",10] spawn azm_fnc_notifica;};
	player setVariable ["azm_benzinaio",true];
	["Ora il tuo compito è quello di viaggiare per la mappa e rifornire le stazioni di benzina per i camionisti ricorda ogni pompa rifornita ti farà guadagnare dei soldi","info",60] spawn azm_fnc_notifica;
	[] spawn azm_fnc_loop;
	benz_action = player addaction ["<t color='#7FFF00'>Rifornisci pompa di benzina",{[cursorObject] spawn azm_fnc_rifornimento},[],50,false,true,"","typeof(cursorobject) in lista_pompe && (player distance2D cursorObject) < 5 && player getVariable 'azm_benzinaio'"];
};

azm_rem_benzina = {
	if !(player getVariable "azm_benzinaio") exitWith {};
	if (player getvariable "azm_veicolo_attivo" in veicoli_benzinai) exitWith {
		["Deposita il veicolo prima di lasciare il lavoro","red",10] spawn azm_fnc_notifica;
	};
	player setVariable ["azm_benzinaio",false];
	[] spawn azm_fnc_loop;
	["Hai lasciato il lavoro di fornitore petrolifero","info",10] spawn azm_fnc_notifica;
	player removeAction benz_action;
};

azm_fnc_benz_gui = {
	if !(player getVariable "azm_benzinaio") exitWith {["Devi essere un fornitore petrolifero per aprire il garage qui","red",10] spawn azm_fnc_notifica;diag_log format ["AZM>>%1>> %2 (%3) ha provato ad aprire il garage benzina",time,name player,getPlayerUID player];};
	createDialog "azm_garage_mec";
	[101111] spawn Lega_fnc_fadeDisplay;
	diag_log format ["AZM>>%1>> %2 (%3) ha aperto il garage benzina",time,name player,getPlayerUID player];
	{
		_nome = (getText (configFile >> 'CfgVehicles' >> _x >> "displayName"));
		_pic = (getText (configFile >> 'CfgVehicles' >> _x >> 'picture'));
		_index = lbAdd [1001,_nome];
		lbSetPicture [1001, _index, _pic];	
		lbSetData [1001,_index,_x];
		if (_x in veicoli_attivi) then {lbSetColor [1001,_index,[1, 0, 0, 0.9]]; lbSetTooltip [1001,_index,"Veicolo gia in strada"]}		
	} forEach veicoli_benzinai;
};


azm_fnc_rifornimento = {
	params["_pompa"];
	if !(typeOf(_pompa) in lista_pompe) exitWith {};
	if (_pompa getvariable "azm_fuel_rimasto" == 5) exitwith {["Questa pompa non ha bisogno di rifornimento","red",10] spawn azm_fnc_notifica;};
	if (_pompa getvariable "azm_fuel_rimasto" > (5 / 2)) exitwith {["Solo una pompa con meno del 50% di benzina puo essere rifornita","red",10] spawn azm_fnc_notifica;};
	for "_i" from 0 to 1 do {
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 6;
	};
	deleteMarker (format ["marker_pump_%1",netId _pompa]);
	_pompa setVariable ["azm_fuel_rimasto",5,true];
	_soldi = profileNamespace getVariable VAR_SOLDI;
	_soldi = _soldi + 8000;
	profilenamespace setvariable [VAR_SOLDI,_soldi];
	["Hai rifornito la pompa e sei stato pagato 8000€","success",10] spawn azm_fnc_notifica;
};


