params["_sel"];
veicolo = vehicle player;

switch (_Sel) do {
	case 1: {
		waitUntil { speed veicolo == 0 };
		moveOut player;
		sleep 0.1;
		for "_i" from -90 to 90 step 0.001 do {
			player setdir (getdir veicolo) + _i;
			sleep 0.0001;
		};
		["Caricando il rimorchio","info",10] spawn azm_fnc_notifica;
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 6;
		veicolo = objNull;
		retourn = true;
	};
	case 2: { 
		waitUntil { speed veicolo == 0 };
		moveOut player;
		sleep 0.1;
		for "_i" from -90 to 90 step 0.001 do {
			player setdir (getdir veicolo) + _i;
			sleep 0.0001;
		};
		["Consegna della merce in corso","success",10] spawn azm_fnc_notifica;
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		sleep 6;
		veicolo = objNull;
		retourn = true;
	};
};




