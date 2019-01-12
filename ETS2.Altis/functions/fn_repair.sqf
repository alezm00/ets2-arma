_veicolo = cursorObject;
if (player getVariable "azm_meccanico") then {
	for "_i" from 0 to 1 do {
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 6;
	};
} else {
	player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	sleep 6;
};

_puntospawn = nearestObject [player, "UserTexture_1x2_F"];
diag_log format ["AZM>>%1>> %2 (%3) ha riparato un veicolo (%4 ---- %5)",time,name player,getPlayerUID player,typeOf(_veicolo),getpos player];
if (player distance _puntospawn < 40) then {
	if (player getVariable "azm_meccanico") then {
		_veicolo setDamage 0;
		_propietario = _veicolo getVariable "azm_propietario";
		if !(typeof(_veicolo) in veicoli_meccanico) then {
			soldio = (player getVariable "azm_veicolo_attivo") select 1;
			soldio = round(soldio * moltiplicatore_meccanico);
			_pmon = profileNamespace getVariable VAR_SOLDI;
			_pmon = _pmon + soldio;
			profileNamespace setVariable [VAR_SOLDI,_pmon];

			[format["Veicolo riparato completamente e sei stato pagato %1€",[soldio] call azm_fnc_numbertext],"success",10] spawn azm_fnc_notifica;
		} else {
			["Veicolo riparato completamente","success",10] spawn azm_fnc_notifica;
		}
	} else {
		_veicolo setDamage 0;
		["Veicolo riparato completamente","success",10] spawn azm_fnc_notifica;
	}
} else {
	if (player getVariable "azm_meccanico") then {
		_veicolo setDamage 0;
		if !(typeof(_veicolo) in veicoli_meccanico) then {
			soldio = getNumber (configfile >> "CfgVehicles" >> typeOf(_veicolo) >> "enginePower");
			soldio = round(soldio * moltiplicatore_meccanico);
			_pmon = profileNamespace getVariable VAR_SOLDI;
			_pmon = _pmon + soldio;
			profileNamespace setVariable [VAR_SOLDI,_pmon];
			[format["Veicolo riparato completamente e sei stato pagato %1€",[soldio] call azm_fnc_numbertext],"success",10] spawn azm_fnc_notifica;
		} else {
			["Veicolo riparato completamente","success",10] spawn azm_fnc_notifica;
		}
	} else {
		{
		_veicolo setHit [_x,0];
		} forEach ["wheel_1_1_steering","wheel_1_2_steering","wheel_2_1_steering","wheel_2_2_steering","wheel_1_3_steering","wheel_2_3_steering","wheel_1_4_steering","wheel_2_4_steering"];
		["Hai riparato solo le ruote recati a un garage per ripararlo completamente","success",10] spawn azm_fnc_notifica;
	}

};






/*

Code:

//Engine
VehicleName setHitPointDamage ["HitEngine", 1];
//Fuel
VehicleName setHitPointDamage ["HitFuel", 1];
//MainR
VehicleName setHitPointDamage ["HitHRotor", 1];
//TailR
VehicleName setHitPointDamage ["HitVRotor", 1];
//Hull
VehicleName setHitPointDamage ["HitHull", 1];

// Here you can find the names of the vehicle parts
https://community.bistudio.com/wiki/g...
// What we use the break the vehicle parts
https://community.bistudio.com/wiki/s...

//left front wheel
VehicleName sethit ["wheel_1_1_steering", 0]
//left back wheel
VehicleName sethit ["wheel_1_2_steering", 0]
//right front wheel
VehicleName sethit ["wheel_2_1_steering", 0]
//right back wheel
VehicleName sethit ["wheel_2_2_steering", 0]
//Left middle tire (trucks)
VehicleName setHit ["wheel_1_3_steering", 0];
//Right middle tire (trucks)
VehicleName setHit ["wheel_2_3_steering", 0];
//Truck only (last wheel)
VehicleName setHit ["wheel_1_4_steering", 0];
//Truck only (last wheel)
VehicleName setHit ["wheel_2_4_steering", 0];

 lista_ruote = ["wheel_1_1_steering","wheel_1_2_steering","wheel_2_1_steering","wheel_2_2_steering","wheel_1_3_steering","wheel_2_3_steering","wheel_1_4_steering","wheel_2_4_steering"];
 */









