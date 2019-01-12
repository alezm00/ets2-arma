endLoadingScreen;
cutText ["","BLACK OUT"];
sleep 0.1;
createDialog "azm_spawn_gui";

escKeyEH = (findDisplay 10117) displayAddEventHandler ["KeyDown", "if (((_this select 1) == 1)) then {true} else {false};"];
spawnn = [];
{
	private _split = _x splitString "";
	if ("_" in _split) then {
		_split = _x splitString "_";
		if ((_split select 0) isEqualTo "Spawn") then { // spawn_xyz
			spawnn pushBack _x;
		}
	}	
} forEach allMapMarkers;
diag_log str(spawnn);
{
	_pos = _x;
	_poss = (_pos splitString "_") select 1;
	_index = lbAdd [1000,_poss];
	lbSetData [1000,_index,_pos];	
} forEach spawnn;
