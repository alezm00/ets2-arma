closeDialog 0;
interface_loop = false;
_index = lbCurSel 1001;
_lav_start = lbData [1001,_index];
_arr_lav = _lav_start splitString "@";
//systemChat str _arr_lav;
_proc0 = call compile (_arr_lav select 0);
_proc1 = call compile (_arr_lav select 1);
_guadagno = call compile (_arr_lav select 2);
//systemChat str(_guadagno);
primo = getmarkerpos (_proc0 select 0);
secondo = getmarkerpos (_proc1 select 0);
player setVariable ["azm_ingame_save_lavoro_attivo",_arr_lav,true];

if (player getvariable "azm_lavoro_attivo") exitwith {};
player setvariable ["azm_lavoro_attivo",true];
diag_log format ["AZM>>%1>> %2 (%3) ha avviato un lavoro",time,name player,getPlayerUID player];
["Lavoro avviato","info",10] spawn azm_fnc_notifica;
//10 cutRsc ["azm_vmenu","PLAIN"];
_display = uiNamespace getVariable ["azm_vmenu",displayNull];
_display displayCtrl 1000 ctrlSetStructuredText parseText format["<t size='1'> Partenza: %1</t><br/> <t size='1'>Arrivo: %2</t><br/> <t size='1'>Guadagno: %3€</t><br/> <t size='1'>Stai trasportando: %4</t><br/> <t size='1'>Peso: %5 tonnellate</t>",_proc0 select 1,_proc1 select 1,_arr_lav select 2,_arr_lav select 3,round(tons)];



if (azm_debug) then {hint format["%1 ---- %2 >>> %3",_arr_lav,primo,secondo];};
_mark_primo = createMarkerLocal	[format["marker_primo_%1",getPlayerUID player],primo];
_mark_primo setmarkertypelocal "hd_dot";
_mark_primo setMarkerColorLocal "ColorYellow";
_mark_primo setMarkerTextLocal format["Rimorchio"];
onEachFrame {
	if ((player distance primo) < 100) then {
		dimen = 0.035;
	} else {dimen = 0.04};
	drawIcon3D [
		"\A3\ui_f\data\map\Markers\Military\dot_ca.paa",
		[ 0, 1, 1, 1 ],
		[primo select 0, primo select 1,1],
		1,
		1,
		0,
		format ["Rimorchio - %1 metri",round(player distance primo)], 
		2, 
		dimen, 
		"PuristaMedium",
		"center",
		true
	];
	player setVariable ["distanceconorprimo",round(player distance primo)];
};
waitUntil {player distance primo < 5 AND vehicle player != player AND (speed vehicle player) < 2 AND driver vehicle player == player};
deletemarkerlocal format["marker_primo_%1",getPlayerUID player];
cutText ["Caricando il rimorchio","BLACK OUT"];
_mark_secondo = createMarkerLocal [format["marker_secondo_%1",getPlayerUID player],secondo];
_mark_secondo setmarkertypelocal "hd_dot";
_mark_secondo setMarkerColorLocal "ColorYellow";
_mark_secondo setMarkerTextLocal format["Consegna"];

sleep 15;
cutText ["","BLACK IN"];

["Carico raccolto dirigiti verso l'azienda di consegna","info",10] spawn azm_fnc_notifica;
onEachFrame {
	if ((player distance secondo) < 100) then {
		dimen = 0.035;
	} else {dimen = 0.06};
	drawIcon3D [
		"\A3\ui_f\data\map\Markers\Military\dot_ca.paa",
		[ 0, 1, 1, 1 ],
		[secondo select 0, secondo select 1,1],
		1,
		1,
		0,
		format ["Consegna - %1 metri",round(player distance secondo)], 
		2, 
		dimen, 
		"PuristaMedium",
		"center",
		true
	];
	player setVariable ["distanceconorprimo",round(player distance secondo)];
};
waitUntil {player distance secondo < 5 AND vehicle player != player AND (speed vehicle player) < 2 AND driver vehicle player == player};
deletemarkerlocal format["marker_secondo_%1",getPlayerUID player];
onEachFrame {};
_soldi_menu = profileNamespace getVariable VAR_SOLDI;
_viaggi_menu = profileNamespace getVariable VAR_VIAGGI;
_viaggi_menu = _viaggi_menu + 1;
_soldi_menu = _soldi_menu + _guadagno;
profileNamespace setVariable [VAR_SOLDI,_soldi_menu];
profileNamespace setVariable [VAR_VIAGGI,_viaggi_menu];


diag_log format ["AZM>>%1>> %2 (%3) ha consegnato il carico e ha guadagnato : %4€",time,name player,getPlayerUID player,_soldi_menu];
player setvariable ["azm_lavoro_attivo",false];
player setVariable ["azm_ingame_save_lavoro_attivo",false,true];
[format["Hai consegnato il carico e hai guadagnato %1€",_guadagno],"success",10] spawn azm_fnc_notifica;
[] spawn azm_fnc_loop;
