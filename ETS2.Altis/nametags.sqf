ShowNameTags = addMissionEventHandler ["Draw3D",{
    _units = [];
    {
        if (side _x == side player) then {
          _units pushBack _x;
        };
    }forEach allPlayers;
    {
        _distance = cameraOn distance _x;
        _alpha = 1 - (_distance/100);
        _colour = [0,1,1,_alpha];
        _crew = crew (vehicle _x);
        _veh = vehicle _x;
        _name = '';
        _unit = _x;
        {
            if (_x != player) then {
                _name = format ['%1 - %2', name _x, round(player distance _x)];
            }
        }forEach _crew;

        _bounding = boundingBoxReal _veh;
        _b1 = _bounding select 0;
        _b2 = _bounding select 1;
        _maxHeight = (abs ((_b2 select 2) - (_b1 select 2))) * 1.1; 

        _pos = visiblePosition _veh;
        _height = (_b2 select 2) + 1.25 + ((getPosATL _veh) select 2) - 1;

        if (_veh == _x)then{
            _height = (_pos select 2) + ((getPosATL _veh) select 2) + (_b2 select 2);
        };
        if (_veh isKindOF "Helicopter") then {_height = _height + 1};
        if (stance _x == "CROUCH")then {_height = _height};

        _pos set[2,_height];

        drawIcon3D['', _colour, _pos, 0, 0, 0, _name, 1, 0.04];
    }forEach _units;
}];
