
_index = lbCurSel 1001;
_class = lbData [1001, _index];

if (_class == "") exitWith {
	["devi selezionare il veicolo che vuoi comprare","info",10] spawn azm_fnc_notifica;
};
closeDialog 0;
_csoldi_conc = profileNamespace getVariable VAR_SOLDI;
_veicoli_player = profileNamespace getVariable VAR_VEICOLI;

{
	_classe_c = _x #0;
	_prezzo_c = _x #1;
	if (_class == _classe_c) then {
		if (_csoldi_conc < _prezzo_c) exitWith {
			["Non hai abbastanza soldi per comprare questo veicolo","red",10] spawn azm_fnc_notifica;
		};
		_veicoli_player pushBack _classe_c;
		_csoldi_conc = _csoldi_conc - _prezzo_c;
		profileNamespace setVariable [VAR_SOLDI,_csoldi_conc];
		profileNamespace setVariable [VAR_VEICOLI,_veicoli_player];
		
		
		diag_log format ["AZM>>%1>> %2 (%3) ha acquistato il veicolo %4 per %5 ora possiede %6 prima aveva %7",time,name player,getPlayerUID player,_classe_c,_prezzo_c,_csoldi_conc,(_csoldi_conc + _prezzo_c)];
		["Veicolo acquistato con successo puoi ritirarlo al tuo garage","success",10] spawn azm_fnc_notifica;
	};
} forEach veicoli_concessionario;

//_veh = createVehicle [_class, getpos _puntospawn];
//_veh setPos getpos "garage_1";
//_veh setDir (getDir _puntospawn);
if !(player getvariable "azm_lavoro_attivo") then {
	interface_loop = false; [] spawn azm_fnc_loop;
};
/*

veicoli_concessionario = [
			["Camioncino trasporto","C_Van_01_transport_F",1],
			["Camioncino serbatoio","C_Van_01_fuel_F",1],
			["Fuoristrada","C_Offroad_01_F",1],
			["Furgone","C_Van_02_vehicle_F",1],
			["Zamak scoperto","C_Truck_02_transport_F",1],
			["Zamak serbatoio","C_Truck_02_fuel_F",1],
			["Zamak riparazione","C_Truck_02_box_F",1],
			["Hemtt","B_Truck_01_mover_F",1],
			["Hemtt container","B_Truck_01_fuel_F",1]
		];


*/



