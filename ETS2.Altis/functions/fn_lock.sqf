_veicolo = if (vehicle player == player) then {cursorObject} else {vehicle player};
_propietario = _veicolo getVariable "azm_propietario";
if ((getPlayerUID player) == _propietario) then {
	if (locked _veicolo isEqualTo 2) then {
		_veicolo lock 0;
		["Hai sbloccato il tuo veicolo","info",10] spawn azm_fnc_notifica;
	} else {
		_veicolo lock 2;
		["Hai bloccato il tuo veicolo","info",10] spawn azm_fnc_notifica;
	};
};