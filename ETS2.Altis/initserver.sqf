
onPlayerDisconnected {
	private _veh = missionNamespace getVariable [format["veh_of_%1",_uid],objNull];
	private _pl = missionNamespace getVariable [format["azm_net_%1",_udi],objNull];
	deleteVehicle _veh;	
	deleteVehicle _pl;
};



lista_pompe = ["Land_fs_feed_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_Feed_F","Land_FuelStation_01_pump_malevil_F"];


_pump = nearestObjects [[worldSize/2,worldSize/2,0],lista_pompe,50000];
{
	_x setFuelCargo 0;
	_x setVariable ["azm_fuel_rimasto",floor(random[0,2,5]),true];
} forEach _pump;
