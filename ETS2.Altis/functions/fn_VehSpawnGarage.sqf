
_puntospawn = nearestObject [player, "UserTexture1m_F"];
_nearVehicles = nearestObjects[_puntospawn,["Car","Air","Ship","Tank"],10];

_index = lbCurSel 1001;
_class = lbData [1001, _index];
if (_class in veicoli_meccanico AND !(player getVariable "azm_meccanico")) exitWith {["Questo veicolo può essere usato solo mentre lavori come meccanico","rosso",10] spawn azm_fnc_notifica;};
if (!(_class in veicoli_meccanico) AND player getVariable "azm_meccanico") exitWith {["Mentre sei un meccanico puoi usare solo i veicoli dedicati ai meccanici ritirali nelle areee meccanico","rosso",10] spawn azm_fnc_notifica;};
if (count(veicoli_attivi) > 0) exitWith {["Puoi avere solo 1 veicolo attivo alla volta","rosso",10] spawn azm_fnc_notifica;};
IF (_class == "") exitwith {};
if (_class in veicoli_attivi) then {
	["Il veicolo è gia in strada","red",10] spawn azm_fnc_notifica;
} else {
	closedialog 0;
	if (count(_nearVehicles) > 0) exitWith {
	["C'è gia un veicolo nell'area spostalo prima di prendere il tuo","rosso",10] spawn azm_fnc_notifica;
	};
	veicoli_attivi = veicoli_attivi + [_class];
	["Creazione veicolo","success",10] spawn azm_fnc_notifica;
	veh = createVehicle [_class, getPosATL _puntospawn];
	//_veh setPos getpos "garage_1";
	veh setDir (getDir _puntospawn);
	{
		_selected = typeOf(veh);
		_getvalue = _x select 2;
		_veicoloconce = _x select 0;
		if (_selected == _veicoloconce) then {
			moltiplicatore = _getvalue;
		}

	} forEach veicoli_concessionario;
	veh setvariable ["azm_propietario",getplayeruid player,true];
	veh setVariable ["azm_own",player,true];
	missionNamespace setVariable [format["veh_of_%1",getPlayerUID player],veh,true];
	if (_class in veicoli_meccanico || _class in veicoli_benzinai) then {
		player setVariable ["azm_veicolo_attivo",_class];
		diag_log format ["AZM>>%1>> %2 (%3) ha ritirato 1 veicolo meccanico (%4)",time,name player,getPlayerUID player,_class];
	} else {
		_class_molti = [_class,moltiplicatore];
		player setVariable ["azm_veicolo_attivo",_class_molti];
		diag_log format ["AZM>>%1>> %2 (%3) ha ritirato 1 veicolo (%4)",time,name player,getPlayerUID player,_class];
	};
	player moveInDriver veh;
	veh addEventHandler ["Killed",{
		[] spawn {
			["Il tuo veicolo è stato distrutto recati a un garage per ritirarlo nuvamente","info",10] spawn azm_fnc_notifica;
			veicoli_attivi = [];
			
		};
	}];
	veh = objNull;
};




