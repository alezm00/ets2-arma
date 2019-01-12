if (player getvariable "azm_lavoro_attivo") exitwith {["Non puoi depositare il veicolo mentre hai un lavoro in corso sarebbe controproducente","red",10] spawn azm_fnc_notifica;};


{
	_id = _x getVariable ["azm_propietario",""];
	if ((getPlayerUID player) == _id ) then {
		if ((player distance2D _x) < 200) then {
			veicoli_attivi = [];
			deleteVehicle _x;
			player setVariable ["azm_veicolo_attivo",""];
			["Veicolo depositato con successo","success",10] spawn azm_fnc_notifica;
			diag_log format ["AZM>>%1>> %2 (%3) ha depositato il suo veicolo (%4)",time,name player,getPlayerUID player,typeOf(_x)];
		} else {
			["il veicolo è troppo lontano","warning",10] spawn azm_fnc_notifica;
		}
		
	};
	
} forEach vehicles;

