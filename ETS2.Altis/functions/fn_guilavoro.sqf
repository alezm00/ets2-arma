createDialog "azm_lavori_gui";
[10114] spawn Lega_fnc_fadeDisplay;
['Generazione lavori in corso','info',10] spawn azm_fnc_notifica;

{
	_partenza = _x select 0 select 1;
	_arrivo = _x select 1 select 1;
	_oggetto = _x select 3;
	_soldi = _x select 4;
	_text = format [" %1 >>> %2",_partenza,_arrivo];
	_new = [_x select 0,_x select 1,_soldi,_oggetto] joinString "@";
	_index = lbAdd [1001,_text];
	lbSetData [1001,_index,_new];
	if (azm_debug) then {systemChat format["%1",_new];};
} forEach lista_lavori;

