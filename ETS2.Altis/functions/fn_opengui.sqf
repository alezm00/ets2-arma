params ["_gui"];
createDialog _gui;




player setVariable ["azm_ingame_save_soldi",profileNamespace getVariable VAR_SOLDI,true];
player setVariable ["azm_ingame_save_veicoli",profileNamespace getVariable VAR_VEICOLI,true];
player setVariable ["azm_ingame_save_viaggi",profileNamespace getVariable VAR_VIAGGI,true];
player setVariable ["azm_ingame_save_meccanico",player getVariable "azm_meccanico",true];
player setvariable ["azm_ingame_save_benz",player getvariable "azm_benzinaio",true];
player setVariable ["azm_ingame_save_veicolo_attivo",veicoli_attivi,true];
if !(player getVariable "azm_lavoro_attivo") then {
	player setVariable ["azm_ingame_save_lavoro_attivo",false,true];
};

switch (_gui) do {
	case "azm_garage_gui": { 
		[10111] spawn Lega_fnc_fadeDisplay;
		diag_log format ["AZM>>%1>> %2 (%3) ha aperto il garage",time,name player,getPlayerUID player];	
		if (count(profileNamespace getVariable VAR_VEICOLI) == 0) exitWith {["Non possiedi alcun veicolo","red",10] spawn azm_fnc_notifica;};
		{			
			_pic = (getText (configFile >> 'CfgVehicles' >> _x >> 'picture'));
			_nome = (getText (configFile >> 'CfgVehicles' >> _x >> "displayName"));
			_index = lbAdd [1001,_nome];
			lbSetPicture [1001, _index, _pic];
			lbSetData [1001,_index,_x];
			if (_x in veicoli_attivi) then {lbSetColor [1001,_index,[1, 0, 0, 0.9]]; lbSetTooltip [1001,_index,"Veicolo gia in strada"]}
		} forEach (profileNamespace getVariable VAR_VEICOLI);
	
	};
	case "azm_garage_mec": {
		[101111] spawn Lega_fnc_fadeDisplay;
		if !(player getVariable "azm_meccanico") exitWith {closeDialog 0;["Devi essere un meccanico per aprire il garage qui","red",10] spawn azm_fnc_notifica;diag_log format ["AZM>>%1>> %2 (%3) ha provato ad aprire il garage meccanici",time,name player,getPlayerUID player];};
		diag_log format ["AZM>>%1>> %2 (%3) ha aperto il garage meccanici",time,name player,getPlayerUID player];
		{
			_nome = (getText (configFile >> 'CfgVehicles' >> _x >> "displayName"));
			_pic = (getText (configFile >> 'CfgVehicles' >> _x >> 'picture'));
			_index = lbAdd [1001,_nome];
			lbSetPicture [1001, _index, _pic];	
			lbSetData [1001,_index,_x];
			if (_x in veicoli_attivi) then {lbSetColor [1001,_index,[1, 0, 0, 0.9]]; lbSetTooltip [1001,_index,"Veicolo gia in strada"]}		
		} forEach veicoli_meccanico;
	};
	case "azm_pmenu": {
		[10113] spawn Lega_fnc_fadeDisplay;
		if !((getPlayerUID player) in admin_list OR (getPlayerUID player) isEqualTo "_SP_PLAYER_") then {ctrlShow [1008,false]};
		if !(player getvariable "azm_lavoro_attivo") then {ctrlenable [1007,false]};
		diag_log format ["AZM>>%1>> %2 (%3) ha aperto il player menu",time,name player,getPlayerUID player];
		_soldi_pmenu = profileNamespace getVariable VAR_SOLDI;
		_viaggi_pmenu = profileNamespace getVariable VAR_VIAGGI;
		_veicoli_pmenu = profileNamespace getVariable VAR_VEICOLI;
		_text_soldi = format["Possiedi : %1 €",[_soldi_pmenu] call azm_fnc_numbertext];
		_text_viaggi = format["Hai effettuato %1 viaggi",_viaggi_pmenu];
		_text_nveicoli = format["Possiedi %1 veicoli",count(_veicoli_pmenu)];
		ctrlSetText [1001,_text_soldi];
		ctrlSetText [1003,_text_viaggi];
		ctrlSetText [1004,_text_nveicoli];
		if !(player getvariable "azm_lavoro_attivo") then {
			interface_loop = false; [] spawn azm_fnc_loop;
		};
	};
	case "azm_conce_gui": {
		[10112] spawn Lega_fnc_fadeDisplay;
		_veicoli = profileNamespace getVariable VAR_VEICOLI;
		diag_log format ["AZM>>%1>> %2 (%3) ha aperto la concessionaria",time,name player,getPlayerUID player];
		{
			_classe_c = _x #0;
			_prezzo_c = _x #1;
			_nome_c = (getText (configFile >> 'CfgVehicles' >> _classe_c >> "displayName"));
			_mol_c = _x #2;
			if !(_classe_c in _veicoli) then {
				if ((getPlayerUID player) in admin_list OR (getPlayerUID player) isEqualTo "_SP_PLAYER_") then {
					nome_c_prezzo_c = format ["%1 --- prezzo: %2€ - %3",_nome_c,[_prezzo_c] call azm_fnc_numbertext,_mol_c];
				} else {
					nome_c_prezzo_c = format ["%1 --- prezzo: %2 €",_nome_c,[_prezzo_c] call azm_fnc_numbertext];
				};
				_pic = (getText (configFile >> 'CfgVehicles' >> _classe_c >> 'picture'));
				_index_c =	lbAdd [1001,nome_c_prezzo_c];
				lbSetPicture [1001, _index_c, _pic];
				lbSetData [1001,_index_c,_classe_c];
			}		
		} forEach veicoli_concessionario;
	};
	case "azm_admin_gui": {
		[99876] spawn Lega_fnc_fadeDisplay;
		diag_log format ["AZM>>%1>> %2 (%3) ha aperto il menu admin",time,name player,getPlayerUID player];
		{
			_index = lbAdd [1004,_x select 1];
			lbsetdata [1004,_index,_x select 0];
		} foreach lista_start;
		{
			_index = lbAdd [1005,_x select 1];
			lbsetdata [1005,_index,_x select 0];			
		} forEach lista_stop;
		{
			_index = lbAdd [1008,_x];
			lbSetData [1008,_index,_x];			
		} forEach [VAR_SOLDI,VAR_VIAGGI,VAR_VEICOLI];
		{
			_uid = getPlayerUID _x;
			_owner = owner _x;
			_val = [_uid,_x getVariable "azm_ingame_save_soldi",_x getVariable "azm_ingame_save_veicoli",_x getVariable "azm_ingame_save_viaggi",_x getVariable "azm_ingame_save_meccanico",_owner,_x getVariable "azm_ingame_save_veicolo_attivo",_x getVariable "azm_ingame_save_lavoro_attivo",_x getvariable "azm_ingame_save_benz",netId _x] joinString "@";
			//systemChat format ["%1",_val];
			_name = format["%1 - %2",_owner,name _x];
			_index = lbAdd [998765,_name];
			lbSetData [998765,_index,_val];
		} forEach allPlayers;
		((findDisplay 99876) displayCtrl 1006) ctrlSetStructuredText parseText format ["Guadagno:"];
	};
	default {hint "dio cane"};
};





