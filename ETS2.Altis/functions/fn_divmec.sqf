if (player getvariable "azm_lavoro_attivo") exitWith {["Non puoi essere un meccanico se hai un rimorchio che ti aspetta","warning",10] spawn azm_fnc_notifica;};
if (player getVariable "azm_meccanico") exitWith {};
if (player getVariable "azm_benzinaio") exitWith {["Deciditi o fornitore petrolifero o meccanico","warning",10] spawn azm_fnc_notifica;};
if (count(veicoli_attivi) > 0) exitWith {["Deposita i veicoli attivi prima di lavorare come meccanico","warning",10] spawn azm_fnc_notifica;};
diag_log format ["AZM>>%1>> %2 (%3) è diventato meccanico",time,name player,getPlayerUID player];
["Ora sei un meccanico e puoi riparare in mezzi ovunque","success",10] spawn azm_fnc_notifica;
player setvariable ["azm_meccanico",true];
interface_loop = false;
[] spawn azm_fnc_loop;