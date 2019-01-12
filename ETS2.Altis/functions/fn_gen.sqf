if (player getvariable "azm_lavoro_attivo") exitwith {["Hai gia un lavoro attivo completalo oppure annullalo","warning",10] spawn azm_fnc_notifica;};

if (player getVariable "azm_meccanico") exitWith {["Mentre sei un meccanico non puoi effettuare lavori come camionista","warning",10] spawn azm_fnc_notifica;};
if (player getVariable "azm_benzinaio") exitWith {["Mentre sei un fornitore petrolifero non puoi effettuare lavori come camionista","warning",10] spawn azm_fnc_notifica;};
if (count(veicoli_attivi) < 1) exitwith {["Devi avere un veicolo attivo e vicino a te per avviare un lavoro","red",10] spawn azm_fnc_notifica;};
if ((player getVariable "azm_veicolo_attivo") select 0 in veicoli_meccanico ||(player getVariable "azm_veicolo_attivo") select 0 in veicoli_benzinai) exitWith {["Non puoi portare carichi con questo veicolo","warning",10] spawn azm_fnc_notifica;};
closedialog 0;
if (isNull(findDisplay 10014)) then {
	lista_lavori = [];
	for "_i" from 0 to 19 step 1 do {
		lista_lavori = lista_lavori + [[selectRandom lista_start ,selectRandom lista_stop,_i,selectRandom carico_casuale]];
	};
	lista_lavori;
	_moltiplicatore = (player getVariable "azm_veicolo_attivo") select 1;
	_moltiplicatore = _moltiplicatore * divisore_guadagno;
	{
		_p11 = _x select 0 select 1;
		_p22 = _x select 1 select 1;
		_sel = _x #2;
		_distance = getMarkerPos(_x select 0 select 0) distance2D getmarkerpos(_x select 1 select 0);
		_playerdis = (player distance2D getMarkerPos(_x select 0 select 0)) + _distance;
		_guadagno = _playerdis * _moltiplicatore;
		_guadagno = round(_guadagno);
		(lista_lavori select _sel) pushBack _guadagno;
	} forEach lista_lavori;
	lista_lavori;
};
call azm_fnc_guilavoro;


