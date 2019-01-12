[missionNamespace,"arsenalOpened",{
	disableSerialization;
	_display = _this select 0;
	_display displayAddEventHandler ["KeyDown", "if ((_this select 1) in [24,31,19,29]) then {true}"];
	{
		(_display displayCtrl _x) ctrlSetText "Disabled";
		(_display displayCtrl _x) ctrlSetTextColor [1,0,0,0.5];
		(_display displayCtrl _x) ctrlRemoveAllEventHandlers "buttonclick";
		(_display displayCtrl _x) ctrlSetTooltip "Disattivato";
	}forEach [44146,44147,44150];
}] call BIS_fnc_addScriptedEventHandler;



//u.u
azm_fnc_spawn = {
	_index = lbCurSel 1000;
	_spawn = lbData [1000, _index];
	if (_spawn == "") exitWith {};
	//hint format["%1   %2",_spawn,_index];
	closeDialog 0;
	diag_log format ["AZM>>%1>> %2 (%3) è spawnato a %4",time,name player,getPlayerUID player,_spawn];
	player setpos (getmarkerpos _spawn);
	flip_action = player addaction ["<t color='#7FFF00'>Flip vehicle</t>",{call azm_fnc_flip},[],-10,false,true,"","cursorObject isKindOf 'car' && (player distance cursorObject)<5 && alive cursorObject"];
	repair_action = player addaction ["<t color='#7FFF00'>Ripara veicolo</t>",{call azm_fnc_repair},[],-12,false,true,"","cursorObject isKindOf 'car' && (player distance cursorObject)<5 && alive cursorObject"];
	pmenu_action = player addAction ["<t color='#3383fb'>Player menu</t>",{["azm_pmenu"] call azm_fnc_opengui;},[],49,false,true,"",""];
	lock_action = player addAction ["<t color='#7FFF00'>Lock vehicle</t>",{call azm_fnc_lock},[],48,false,true,"","(vehicle player != player OR cursorObject isKindOf 'car') && (player distance cursorObject)<5 && alive cursorObject"];
	remove_action = player addAction ["<t color='#f90000'>Remove Wreck</t>",{deleteVehicle cursorObject;["Carcassa rimossa","info",10] spawn azm_fnc_notifica;},[],50,false,true,"","cursorObject isKindOf 'car' && (player distance cursorObject)<5 && !(alive cursorObject)"];
	reset_action = player addAction ["<t color='#f90000'>Reimposta veicolo</t>",{[cursorObject] call azm_veh_water_reset},[],50,false,true,"","cursorObject isKindOf 'car' && (player distance cursorObject) < 20 && surfaceIsWater getPos player && surfaceIsWater getpos cursorObject && cursorObject getHitPointDamage 'hitEngine' != 0"];
	player setvariable ["azm_lavoro_attivo",false];
	player setVariable ["azm_veicolo_attivo",[]];
	player setvariable ["azm_meccanico",false];
	player setVariable ["azm_benzinaio",false];
	player addEventHandler ["GetInman",{call azm_fnc_hitstart;[ _this select 2] execVM "fuel.sqf";}];
	player addEventHandler ["GetOutMan",{terminate var_start_hitpart;}];
	player addEventHandler ["Respawn",{[] execVM "initplayerlocal.sqf";}];
	
	missionNamespace setVariable [format["azm_net_%1",getPlayerUID player],netId player,true];

	player addEventHandler ["InventoryOpened", {
   		[602] spawn Lega_fnc_fadeDisplay;
	}];


	player linkItem "ItemGPS";
	player addItem "ACRE_PRC152";
	player allowDamage false;
	cutText ["","BLACK IN"];
	12 cutRsc ["azm_vmenu","PLAIN"];
	[] spawn azm_fnc_loop;
    road = [] spawn azm_road;
};

azm_fnc_map_spawn = {
	_index = lbCurSel 1000;
	_sel = lbdata [1000, _index];
	_mapCtrl = ((findDisplay 10117) displayCtrl 1002);
	_mapCtrl ctrlMapAnimAdd [1, 0.15, (getMarkerPos _sel)];
	ctrlMapAnimCommit _mapCtrl;
};







azm_fnc_hitstart = {
	azm_temp_arr = [1200,900,1500,1800,600];
	azm_hit_arr = ["wheel_1_1_steering","wheel_1_2_steering","wheel_2_1_steering","wheel_2_2_steering","HitEngine","HitFuel"];
	azm_hitval_arr = [0.5,0.7,1,0,0];
	var_start_hitpart = [selectRandom azm_temp_arr,selectRandom azm_hit_arr,selectRandom azm_hitval_arr] spawn azm_fnc_hit;
};

azm_fnc_hit = {
	params["_time","_hitpart","_hitvalue"];
	if (azm_debug) then {systemChat format["%1    %2      %3",_time,_hitpart,_hitvalue];};
	switch (_hitpart) do {
		case "wheel_1_1_steering": {switch (_hitvalue) do {case 0: {testo = ""}; case 0.5: {testo = "Rilevato danno medio a una delle ruote" };case 0.7: {testo = "Danno estremo a una delle ruote" };case 1: {testo = "ATTENZIONE!!! UNA DELLE RUOTE è ESPLOSA" };default { testo = "errore ruote"}; };};
		case "wheel_1_2_steering": {switch (_hitvalue) do {case 0: {testo = ""}; case 0.5: {testo = "Rilevato danno medio a una delle ruote" };case 0.7: {testo = "Danno estremo a una delle ruote" };case 1: {testo = "ATTENZIONE!!! UNA DELLE RUOTE è ESPLOSA" };default { testo = "errore ruote"}; }; };
		case "wheel_2_1_steering": {switch (_hitvalue) do {case 0: {testo = ""}; case 0.5: {testo = "Rilevato danno medio a una delle ruote" };case 0.7: {testo = "Danno estremo a una delle ruote" };case 1: {testo = "ATTENZIONE!!! UNA DELLE RUOTE è ESPLOSA" };default { testo = "errore ruote"}; }; };
		case "wheel_2_2_steering": {switch (_hitvalue) do {case 0: {testo = ""}; case 0.5: {testo = "Rilevato danno medio a una delle ruote" };case 0.7: {testo = "Danno estremo a una delle ruote" };case 1: {testo = "ATTENZIONE!!! UNA DELLE RUOTE è ESPLOSA" };default { testo = "errore ruote"}; }; };
		case "HitEngine": {switch (_hitvalue) do {case 0: {testo = ""}; case 0.5: {testo = "Rilevato danno medio al motore" };case 0.7: {testo = "Danno estremo alla testata del motore" };case 1: {testo = "ATTENZIONE!!! SONO SALTALE LE GUARNIZIONI" };default { testo = "errore motore"}; }; };
		case "HitFuel": {switch (_hitvalue) do {case 0: {testo = ""}; case 0.5: {testo = "Rilevata ostrusione nel sistema di filtraggio del carburante" };case 0.7: {testo = "Danno estremo all'iniezione del carburante" };case 1: {testo = "ATTENZIONE!!! I TUBI DEL CARBURANTE SONO ESPLOSI" };default { testo = "errore serbatoio"}; }; };
		default {testo = "errore generale"};
	};
	if (azm_debug) then {systemChat format["%1",testo];};
	if (_hitpart in ["HitEngine","HitFuel","HitHRotor","HitHull"]) then {
		sleep _time;
		hint parseText format["<t color='#ff0000' size='2'>%1</t>",testo];
		vehicle player setHitPointDamage [_hitpart, _hitvalue];
	} else {
		sleep _time;
		hint parseText format["<t color='#ff0000' size='2'>%1</t>",testo];
		vehicle player setHit [_hitpart,_hitvalue];
	};
	call azm_fnc_hitstart;
};

azm_fnc_loop = {
	interface_loop = false;
	sleep 0.1;
	interface_loop = true;
	while {interface_loop} do {
		player setVariable ["azm_ingame_save_soldi",profileNamespace getVariable VAR_SOLDI,true];
		player setVariable ["azm_ingame_save_veicoli",profileNamespace getVariable VAR_VEICOLI,true];
		player setVariable ["azm_ingame_save_viaggi",profileNamespace getVariable VAR_VIAGGI,true];
		player setVariable ["azm_ingame_save_meccanico",player getVariable "azm_meccanico",true];
		player setvariable ["azm_ingame_save_benz",player getvariable "azm_benzinaio",true];
		player setVariable ["azm_ingame_save_veicolo_attivo",veicoli_attivi,true];
		player setVariable ["azm_ingame_save_lavoro_attivo",player getVariable "azm_lavoro_attivo",true];
		if (player getVariable "azm_meccanico") then {
			_display = uiNamespace getVariable ["azm_vmenu",displayNull];
			_display displayCtrl 1000 ctrlSetStructuredText parseText format["<t size='1'> Soldi: %1€</t><br/> <t size='1'>Viaggi: %2</t><br/> <t size='1'>Veicoli posseduti: %3</t><br/> <t size='1'>Lavoro:</t> <t color='#7FFF00'>%4 </t>",[profileNamespace getVariable VAR_SOLDI] call azm_fnc_numbertext, profileNamespace getVariable VAR_VIAGGI, count(profileNamespace getVariable VAR_VEICOLI),"Meccanico"];
			
		} else {
			if (player getVariable "azm_benzinaio") then {
				_display = uiNamespace getVariable ["azm_vmenu",displayNull];
				_display displayCtrl 1000 ctrlSetStructuredText parseText format["<t size='1'> Soldi: %1€</t><br/> <t size='1'>Viaggi: %2</t><br/> <t size='1'>Veicoli posseduti: %3</t><br/> <t size='1'>Lavoro:</t> <t color='#7FFF00'>%4 </t>",[profileNamespace getVariable VAR_SOLDI] call azm_fnc_numbertext, profileNamespace getVariable VAR_VIAGGI, count(profileNamespace getVariable VAR_VEICOLI),"Fornitore Petrolifero"];	
			} else {
				_display = uiNamespace getVariable ["azm_vmenu",displayNull];
				_display displayCtrl 1000 ctrlSetStructuredText parseText format["<t size='1'> Soldi: %1€</t><br/> <t size='1'>Viaggi: %2</t><br/> <t size='1'>Veicoli posseduti: %3</t><br/> <t size='1'>Lavoro:</t> <t color='#7FFF00'>%4 </t>",[profileNamespace getVariable VAR_SOLDI] call azm_fnc_numbertext, profileNamespace getVariable VAR_VIAGGI, count(profileNamespace getVariable VAR_VEICOLI),"Disoccupato"];
			};
		};
		sleep 20;
	}
};



azm_fnc_lascia_mec = {
	if !(player getVariable "azm_meccanico") exitWith {};
	if (player getvariable "azm_veicolo_attivo" in veicoli_meccanico) exitWith {
		["Deposita il veicolo meccanico prima di lasciare il lavoro","red",10] spawn azm_fnc_notifica;
	};
	player setvariable ["azm_meccanico",false];
	diag_log format ["AZM>>%1>> %2 (%3) ha lasciato il lavoro di meccanico",time,name player,getPlayerUID player];
	["Hai lasciato il lavoro di meccanico","red",10] spawn azm_fnc_notifica;
	interface_loop = false;
	[] spawn azm_fnc_loop;
};






azm_admin_gen = {  // ["Staffload","Retailzy",10] remoteExec ["azm_admin_gen", 0];
	params["_partenza","_arrivo","_soldi"];
	if (player getVariable "azm_meccanico") exitWith {};
	if (player getVariable "azm_benzinaio") exitWith {};
	call azm_fnc_exitlavoro;
	interface_loop = false;
	publicVariable "_soldi";
	primo_admin = getmarkerpos _partenza;
	secondo_admin = getmarkerpos _arrivo;
	player setvariable ["azm_lavoro_attivo",true];
	["Lavoro avviato","info",10] spawn azm_fnc_notifica;
	_display = uiNamespace getVariable ["azm_vmenu",displayNull];
	_display displayCtrl 1000 ctrlSetStructuredText parseText format["<t size='1'> Partenza: %1</t><br/> <t size='1'>Arrivo: %2</t><br/> <t size='1'>Guadagno: %3€</t><br/> <t size='1'>Stai trasportando: %4</t><br/> <t size='1'>Peso: %5 tonnellate</t>",_partenza,_arrivo,[_soldi] call azm_fnc_numbertext,selectRandom carico_casuale,round(random [10,25,50])];
	mark_primo = createMarkerLocal	["marker_primo",primo_admin];
	mark_primo setMarkerType "hd_dot";
	mark_primo setMarkerColorLocal "ColorYellow";
	mark_primo setMarkerTextLocal format["Rimorchio"];
	onEachFrame {
		if ((player distance primo_admin) < 100) then {
			dimen = 0.035;
		} else {dimen = 0.04};
		drawIcon3D [
			"\A3\ui_f\data\map\Markers\Military\dot_ca.paa",
			[ 0, 1, 1, 1 ],
			[primo_admin select 0, primo_admin select 1,1],
			1,
			1,
			0,
			format ["Rimorchio - %1 metri",round(player distance primo_admin)], 
			2, 
			dimen, 
			"PuristaMedium",
			"center",
			true
		];
	};
	waitUntil {player distance primo_admin < 5 AND vehicle player != player AND (speed vehicle player)< 5};
	deletemarkerlocal "marker_primo"; 
	cutText ["Caricando il rimorchio","BLACK OUT"];
	mark_secondo = createMarkerLocal	["marker_secondo",secondo_admin];
	mark_secondo setMarkerType "hd_dot";
	mark_secondo setMarkerColorLocal "ColorYellow";
	mark_secondo setMarkerTextLocal format["Consegna"];
	sleep 15;
	cutText ["","BLACK IN"];
	["Carico raccolto dirigiti verso l'azienda di consegna","info",10] spawn azm_fnc_notifica;
	onEachFrame {
		if ((player distance secondo_admin) < 100) then {
			dimen = 0.035;
		} else {dimen = 0.06};
		drawIcon3D [
			"\A3\ui_f\data\map\Markers\Military\dot_ca.paa",
			[ 0, 1, 1, 1 ],
			[secondo_admin select 0, secondo_admin select 1,1],
			1,
			1,
			0,
			format ["Consegna - %1 metri",round(player distance secondo_admin)], 
			2, 
			dimen, 
			"PuristaMedium",
			"center",
			true
		];
	};
	waitUntil {player distance secondo_admin < 5 AND vehicle player != player AND (speed vehicle player)< 5};
	deletemarkerlocal "marker_secondo";
	onEachFrame {};
	_soldi_menu = profileNamespace getVariable VAR_SOLDI;
	_viaggi_menu = profileNamespace getVariable VAR_VIAGGI;
	_viaggi_menu = _viaggi_menu + 1;
	_soldi_menu = _soldi_menu + _soldi;
	profileNamespace setVariable [VAR_SOLDI,_soldi_menu];
	profileNamespace setVariable [VAR_VIAGGI,_viaggi_menu];
	
	
	diag_log format ["AZM>>%1>> %2 (%3) ha consegnato il carico e ha guadagnato : %4€",time,name player,getPlayerUID player,_soldi_menu];
	player setvariable ["azm_lavoro_attivo",false];
	[format["Hai consegnato il carico e hai guadagnato %1€",_soldi],"success",10] spawn azm_fnc_notifica;
	[] spawn azm_fnc_loop;
};



azm_guad_text = {
	_index = lbCurSel 1004;
	_indexx = lbCurSel 1005;
	_a_start = lbdata [1004, _index];
	_a_stop = lbData [1005,_indexx];
	//hint format["%1   %2",_a_start,_a_stop];
	if (_a_start == "") exitWith {};
	if (_a_stop == "") exitWith {};

	_mol = round(random [0,3,4]);
	_distance = (getMarkerPos _a_start) distance2D (getMarkerPos _a_stop);
	_guadagno = _distance * _mol / 2;
	_guadagno = round(_guadagno);
	((findDisplay 99876) displayCtrl 1006) ctrlSetStructuredText parseText format ["Guadagno: %1€ (%2)",_guadagno,_mol];
	player setVariable ["azm_admin_guad",_guadagno];
};
azm_gui_global_lavoro = {
	_index = lbCurSel 1004;
	_indexx = lbCurSel 1005;
	_a_start = lbdata [1004, _index];
	_a_stop = lbData [1005,_indexx];
	_soldi = player getVariable "azm_admin_guad";
	if (_a_start == "") exitWith {};
	if (_a_stop == "") exitWith {};
	diag_log format ["AZM>>%1>>ADMIN %2 (%3) ha avviato un lavoro da %4 a %5 per un guadagno globale di %6",time,name player,getPlayerUID player,_a_start,_a_stop,_soldi];
	lavoro_admin_attivo = [_a_start,_a_stop,_soldi] remoteExec ["azm_admin_gen", 0];
};



azm_fnc_text_admin = {
	_index = lbCurSel 998765;
	_values = lbdata [998765,_index];
	//systemChat format ["ciao : %1",_values];
	_arr = _values splitString "@";
	//systemChat format ["%1",_arr];
	((findDisplay 99876) displayCtrl 1003) ctrlSetStructuredText parseText format [" OwnerId: %6<br /> UID: %1 <br /> Soldi: %2€ <br /> Viaggi: %4 <br /> Lavoro Attivo: %8<br /> Lavoro meccanico: %5 <br /> Lavoro Benzinaio: %9<br /> Veicolo attivo: %7<br /> Veicoli:<br /> %3",_arr select 0,[call compile (_arr select 1)] call azm_fnc_numbertext,_arr select 2,_arr select 3,_arr select 4,_arr select 5,_arr select 6,_arr select 7,_arr select 8];
};

azm_fnc_admin_copy = {
	//_index = lbCurSel 998765;
	//_values = lbdata [998765,_index];
	//_arr = _values splitString "@";
	//hint "Dati del player selezionato copiati con successo";
	//copyToClipboard parsetext format [" OwnerId: %6          UID: %1              Soldi: %2€                    Viaggi: %4         Lavoro Attivo: %8            Lavoro meccanico: %5        Veicolo attivo: %7     Veicoli:      %3",_arr select 0,_arr select 1,_arr select 2,_arr select 3,_arr select 4,_arr select 5,_arr select 6,_arr select 7];
};
// [profileNamespace,[VAR_SOLDI,20000]] remoteExec ["setVariable",cursorObject];

azm_fnc_admin_vars_modify = {
	_indexlist = lbCurSel 998765;
	_valueslist = lbdata [998765,_indexlist];
	_arr = _valueslist splitString "@";
	if (count(_arr) isEqualTo 0) exitWith {
		["Devi selezionare il player","red"] spawn azm_fnc_notifica;
	};
	//systemChat str(_arr);
	_selplayer = objectFromNetId (_arr select 9);
	//systemChat str(_selplayer);
	_indexcombo = lbCurSel 1008;
	_valuecombo = lbData [1008,_indexcombo];
	if (_valuecombo isEqualTo "") exitWith {
		["Devi selezionare la variabile da modificare","red"] spawn azm_fnc_notifica;
	};
	_valuetext = ctrlText 1009;
	if (_valuetext isEqualTo "") exitWith {
		["Devi inserire un valore","red"] spawn azm_fnc_notifica;
	};
	hint format ["%1   %2",(call compile _valuetext),_valuecombo];
	[[(call compile _valuetext),_valuecombo],{
		profileNamespace setVariable [(_this select 1),(_this select 0)];
	}] remoteExec ["call",_selplayer];
};


azm_call_compile = {
	call compile _this;
};


azm_veh_water_reset = {
	deleteVehicle (_this select 0);
	veicoli_attivi = [];
	["Hai resettato il tuo veicolo recati ad un garage per ritirarlo nuovamente","warning",10] spawn azm_fnc_notifica;
	player setVariable ["azm_ingame_save_veicolo_attivo",veicoli_attivi,true];
	diag_log format ["AZM>>%1>> %2 (%3) ha resettato il veicolo in acqua",time,name player,getPlayerUID player];
};




azm_open_confirm = {
	params["_mode"];
	switch (_mode) do {
		case "sell": {
			_index = lbCurSel 1001;
			class_sell = lbData [1001, _index];
			if (class_sell == "") exitWith {["Devi selezionare il veicolo che vuoi vendere","info",10] spawn azm_fnc_notifica;};
			if (class_sell in veicoli_attivi) exitWith {["Non puoi vendere un veicolo mentre è in strada","red",10] spawn azm_fnc_notifica;};
			//systemChat format ["%1",class_sell];
			{
				_class = _x select 0;
				_prezzo = _x select 1;
				if (class_sell == _class) then {
					if (_prezzo == 0) then {prezzo = 0} else {prezzo = _prezzo * sell_drecrease;};
					//systemChat format ["%1",prezzo];
					closeDialog 0;
					createdialog "azm_confirm_gui";
					[10120] spawn Lega_fnc_fadeDisplay;
					nome_sell = (getText (configFile >> 'CfgVehicles' >> class_sell >> "displayName"));
					((findDisplay 10120) displayCtrl 1001) ctrlSetStructuredText parseText format ["<br /> Stai per vendere il tuo %1 <br /> Per: %2 €",nome_sell,prezzo];
					((findDisplay 10120) displayCtrl 1003) ctrlSetEventHandler ["ButtonClick","[class_sell,prezzo] call azm_vehsell"];
				};
			} forEach veicoli_concessionario;
		};
		case "benzina": {
			createdialog "azm_confirm_gui";
			[10120] spawn Lega_fnc_fadeDisplay;
			((findDisplay 10120) displayCtrl 1001) ctrlSetStructuredText parseText format ["Stai per diventare un fornitore petrolifero il tuo compito sara quello di viaggiare per la mappa e fermarti in tutte le pompe di benzina per rifornirle"];
			((findDisplay 10120) displayCtrl 1003) ctrlSetEventHandler ["ButtonClick","closeDialog 0;call azm_div_benzina"];
		};
		default {hint "Porco Dio"};
	};
};

azm_vehsell = {
	params["_classe","_prezzo"];
	closeDialog 0;
	_nomel = (getText (configFile >> 'CfgVehicles' >> class_sell >> "displayName"));
	_soldi = profileNamespace getVariable VAR_SOLDI;
	_veicoli = profileNamespace getVariable VAR_VEICOLI;
	_soldi = _soldi + _prezzo;
	profileNamespace setVariable [VAR_SOLDI,_soldi];
	_veicoli = _veicoli - [_classe];
	profileNamespace setVariable [VAR_VEICOLI,_veicoli];
	interface_loop = false;
	[] spawn azm_fnc_loop;
	[format["hai venduto il tuo %1 per %2",_nomel,_prezzo],"info",10] spawn azm_fnc_notifica;
};





azm_road = {
	while {true} do {
		if (count(player nearRoads 70) < 1 && vehicle player != player && player getvariable "azm_lavoro_attivo" && ((player getVariable ["distanceconorprimo",9999]) > 400)) then {
		 	player setVariable ["azm_notroad",true];
			if (player getVariable "azm_notroad") then {
				//hint "run";
				_i = timer_cancella_lavoro_strade;
				while {_i > -1 && player getVariable "azm_notroad"} do {
					//systemChat format ["%1 Secondi",_i];
					titleText [format["<t size='2' color='#ff0000'>TORNA IMMEDIATAMENTE IN STRADA OPPURE IL TUO LAVORO SARA' ANNULLATO HAI</t><t size='2'> %1 </t><t size='2' color='#ff0000'>SECONDI",_i],"PLAIN",-1,true,true];
					if (count(player nearRoads 50) > 0) then {
						titleText [".","PLAIN",1,true,true]; 
						player setVariable ["azm_notroad",false];
						call azm_road_restart;
						terminate road;
						cica = false;
					};
					_i = _i - 1;
					sleep 0.8;
					if (_i < 0) then {
					cica = true;
					} else {
					cica = false;
					}
				};
				if (cica) then {
					//hint "la tua ora è giunta";
					titleText [".","PLAIN",1,true,true];
					player setVariable ["azm_notroad",false];
					["IL TUO LAVORO E' STATO ANNULLATO PERCHE' ERI TROPPO LONTANO DA UNA STRADA","red",10] spawn azm_fnc_notifica;
					call azm_fnc_exitlavoro;
					terminate road;
				};
			};
		};
	sleep 5;
	};
};
azm_road_restart = { sleep 5;  road = [] spawn azm_road;};









azm_fnc_numbertext = {
	private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];
	_number = [_this,0,0,[0]] call bis_fnc_param;
	_mod = [_this,1,3,[0]] call bis_fnc_param;

	_digits = _number call bis_fnc_numberDigits;
	_digitsCount = count _digits - 1;

	_modBase = _digitsCount % _mod;
	_numberText = "";
	{
		_numberText = _numberText + str _x;
		if ((_foreachindex - _modBase) % (_mod) isEqualTo 0 && !(_foreachindex isEqualTo _digitsCount)) then {_numberText = _numberText + ",";};
	} forEach _digits;
	_numberText
};



Lega_fnc_fadeDisplay = { /*
    params [
        ["_displayIdent", "", ["", 0]],
        ["_fadeTime", 0.5, [0]],
		["_from","center",[""]]
    ];

    private _display = displayNull;
    if (_displayIdent isEqualType "") then {
        waitUntil {!(isNull uiNamespace getVariable [_displayIdent, displayNull])};
        _display = uiNamespace getVariable [_displayIdent, displayNull]
    } else {
        waitUntil {!(isNull (findDisplay _displayIdent))};
        _display = findDisplay _displayIdent;
    };

    private _allControls = allControls _display;
    {
        _x setVariable ["originalposition", (ctrlPosition _x)];
		switch (_from) do {
			case "center": {_x ctrlSetPosition [safezoneX + (safeZoneW / 2),safeZoneY + (safeZoneH / 2),0,0];};
			case "bleft": {_x ctrlSetPosition [0,(safeZoneH / 2),0,0];};
			case "tleft": {_x ctrlSetPosition [0,0,0,0]};
			case "bright": {_x ctrlSetPosition [(safeZoneW / 2),(safeZoneH / 2),0,0];};
			case "tright": {_x ctrlSetPosition [(safeZoneW / 2),0,0,0];};
			default {_x ctrlSetPosition [safezoneX + (safeZoneW / 2),safeZoneY + (safeZoneH / 2),0,0];};
		};
        _x ctrlCommit 0;
        _x ctrlSetFade 1; 
        _x ctrlCommit 0;
        _x ctrlSetFade 0;
        _x ctrlSetPosition (_x getVariable ["originalposition", []]);
        _x ctrlCommit _fadeTime;
    } forEach _allControls;*/
};
