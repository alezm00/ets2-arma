_index = lbCurSel 1001;
_classe = lbdata [1001, _index];
_classe = _classe splitString "@";
tons = random [10,25,50];
_arr1 = call compile(_classe select 1);
_arr0 = call compile(_classe select 0);
_display = uiNamespace getVariable ["azm_lavori_gui",displayNull];
_display displayCtrl 1006 ctrlSetStructuredText parseText format["<t size='1.3'> Partenza: %1</t><br/> <t size='1.3'>Arrivo: %2</t><br/> <t size='1.3'>Guadagno: %3 €</t><br/> <t size='1.3'>Tipo carico: %4</t><br/> <t size='1.3'>Peso: %5 tonnellate</t><br/> ",_arr0 select 1,_arr1 select 1,_classe select 2,_classe select 3,round(tons)];
