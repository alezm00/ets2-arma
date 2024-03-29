params [
	["_text","",[""]],
	["_type","default",["",[],{}]],
	["_speed",10,[10]]
];
if (isDedicated || !hasInterface) exitWith {};
if(isNil "open_notifications") then {
	open_notifications = [];
};
if(_text isEqualTo "") exitWith {};
disableSerialization;
_display = findDisplay 46;
_alpha = 1;
_colorName = "";
_color = [];
if(typeName _type == "ARRAY") then {
	if (count(_type) == 4) then {
		_type set [(count _type) - 1,_alpha];
		_color = _type;
	}
} else {
	switch (_type) do {
		case "error": {
			_colorName = "red";
		};
		case "warning": {
			_colorName = "amber";
		};
		case "success": {
			_colorName = "green";
		};
		case "info": {
			_colorName = "blue";
		};
		default {
			_colorName = _type;
		};
	};
	// https://material.io/guidelines/style/color.html
	switch (_colorName) do {
		case "red": {
			_color = [0.957,0.263,0.212,_alpha];
		};
		case "pink": {
			_color = [0.914,0.118,0.388,_alpha];
		};
		case "purple": {
			_color = [0.612,0.153,0.69,_alpha];
		};
		case "deep-purple": {
			_color = [0.404,0.227,0.718,_alpha];
		};
		case "indigo": {
			_color = [0.247,0.318,0.71,_alpha];
		};
		case "blue": {
			_color = [0.129,0.588,0.953,_alpha];
		};
		case "light-blue": {
			_color = [0.012,0.663,0.957,_alpha];
		};
		case "cyan": {
			_color = [0,0.737,0.831,_alpha];
		};
		case "teal": {
			_color = [0,0.588,0.533,_alpha];
		};
		case "green": {
			_color = [0.298,0.686,0.314,_alpha];
		};
		case "light-green": {
			_color = [0.545,0.765,0.29,_alpha];
		};
		case "lime": {
			_color = [0.804,0.863,0.224,_alpha];
		};
		case "yellow": {
			_color = [1,0.922,0.231,_alpha];
		};
		case "amber": {
			_color = [1,0.757,0.027,_alpha];
		};
		case "orange": {
			_color = [1,0.596,0,_alpha];
		};
		case "deep-orange": {
			_color = [1,0.341,0.133,_alpha];
		};
		case "brown": {
			_color = [0.475,0.333,0.282,_alpha];
		};
		case "grey": {
			_color = [0.62,0.62,0.62,_alpha];
		};
		case "blue-grey": {
			_color = [0.376,0.49,0.545,_alpha];
		};
		default {
			_color = [(profileNamespace getvariable ['GUI_BCG_RGB_R',0.3843]),(profileNamespace getvariable ['GUI_BCG_RGB_G',0.7019]),(profileNamespace getvariable ['GUI_BCG_RGB_B',0.8862]),_alpha];
		};
	};
};

if (_text isEqualType "") then {
	_text = parseText _text;
};
playSound "HintExpand";

_margin = 0.01;
_width = 300 * pixelW;
_borderWidth = 10 * pixelW;
_textWidth = _width - _borderWidth;
_height = 0.01;
_posX = 0.14 * safezoneW + safezoneX;
_posY = 0.057 * safezoneH + safezoneY;
_sposta = 0;

/*_displaySide = "right"; // left or right
if(_displaySide == "left") then {
	_posX = _margin + safeZoneX;
} else {
	_posX = safeZoneW + safeZoneX - _margin - _width;
};*/

private _BorderCtrl = _display ctrlCreate ["RscText", -1];
_BorderCtrl ctrlSetPosition [_posX, _posY, _borderWidth, _height];
_BorderCtrl ctrlSetBackgroundColor _color;
_BorderCtrl ctrlSetFade 1;
_BorderCtrl ctrlCommit 0;
_BorderCtrl ctrlSetFade 0;
_BorderCtrl ctrlCommit 0.4;

private _TextCtrl = _display ctrlCreate ["RscStructuredText", -1];
_TextCtrl ctrlSetStructuredText _text;
_TextCtrl ctrlSetPosition [(_posX + _borderWidth), _posY, _textWidth, _height];
_adjustedHeight = (ctrlTextHeight _TextCtrl);
//systemChat format["%1",_adjustedHeight];
if (_adjustedHeight <= 0.1) then {
	_adjustedHeight;
	_sposta = 1;
};
if ((_adjustedHeight > 0.1) && (_adjustedHeight <= 0.2)) then {
_adjustedHeight = _adjustedHeight * 0.4;
	_sposta = 2;
};
if ((_adjustedHeight > 0.2) && (_adjustedHeight <= 0.3)) then {
_adjustedHeight = _adjustedHeight * 0.35;
	_sposta = 3;
};
if ((_adjustedHeight > 0.3) && (_adjustedHeight <= 0.4)) then {
_adjustedHeight = _adjustedHeight * 0.33;
_sposta = 4;
};
if ((_adjustedHeight > 0.4) && (_adjustedHeight <= 0.5)) then {
_adjustedHeight = _adjustedHeight * 0.29;
_sposta = 5;
};
if ((_adjustedHeight > 0.5) && (_adjustedHeight <= 0.6)) then {
_adjustedHeight = _adjustedHeight * 0.3;
_sposta = 6;
};
if ((_adjustedHeight > 0.6) && (_adjustedHeight <= 0.7)) then {
_adjustedHeight = _adjustedHeight * 0.28;
_sposta = 7;
};
if ((_adjustedHeight > 0.7) && (_adjustedHeight <= 0.8)) then {
_adjustedHeight = _adjustedHeight * 0.31;
_sposta = 8;
};
if ((_adjustedHeight > 0.8) && (_adjustedHeight <= 0.9)) then {
_adjustedHeight = _adjustedHeight * 0.29;
_sposta = 9;
};
if ((_adjustedHeight > 0.9) && (_adjustedHeight <= 1.0)) then {
_adjustedHeight = _adjustedHeight * 0.28;
_sposta = 10;
};
if (_adjustedHeight > 1) then {
_adjustedHeight = _adjustedHeight * 0.28;
_sposta = 11;
};
//systemChat format["%1",_adjustedHeight];
_TextCtrl ctrlSetPosition [(_posX + _borderWidth), _posY, _textWidth, _adjustedHeight];
_TextCtrl ctrlCommit 0;
_BorderCtrl ctrlSetPosition [_posX, _posY, _borderWidth, _adjustedHeight];
_BorderCtrl ctrlCommit 0;
_TextCtrl ctrlSetBackgroundColor [0.129,0.129,0.129,_alpha];
_TextCtrl ctrlSetFade 1;
_TextCtrl ctrlCommit 0;
_TextCtrl ctrlSetFade 0;
_TextCtrl ctrlCommit 0.4;

[_TextCtrl,_BorderCtrl,_speed] spawn {
	disableSerialization;
	uiSleep (_this select 2);
	private _TextCtrl = _this select 0;
	private _BorderCtrl = _this select 1;
	_TextCtrl ctrlSetFade 1;
	_TextCtrl ctrlCommit 0.3;
	_BorderCtrl ctrlSetFade 1;
	_BorderCtrl ctrlCommit 0.3;
	uiSleep 0.3;
	ctrlDelete _BorderCtrl;
	ctrlDelete _TextCtrl;
};

_offsetY = 0;
if (count open_notifications > 0) then {
	private _activeNotifications = 0;
	{
		private _ctrlBorder = _x select 0;
		private _ctrlText = _x select 1;
		private _ctrlmove = _x select 2;
		//systemChat format["%1",_ctrlmove];
		if (_ctrlmove == 1) then {
			_offsetY = 0.06;
		} else {
			if (_ctrlmove == 2) then {
				_offsetY = 0.095;
			} else {
				if (_ctrlmove == 3) then {
					_offsetY = 0.1;
				} else {
					if (_ctrlmove == 4) then {
						_offsetY = 0.14;
					} else {
						if (_ctrlmove == 5) then {
							_offsetY = 0.15;
						} else {
						if (_ctrlmove == 6) then {
							_offsetY = 0.19;
							} else {
								if (_ctrlmove == 7) then {
									_offsetY = 0.2;
								} else {
									if (_ctrlmove == 8) then {
										_offsetY = 0.245;
									} else {
										if (_ctrlmove == 9) then {
											_offsetY = 0.28;
										} else {
											if (_ctrlmove == 10) then {
												_offsetY = 0.29;
											} else {
												if (_ctrlmove == 11) then {
													_offsetY = 0.31;
												} else {
													_offsetY = 0.34;
												};
											};
										};
									};
								};
							}; 
						};
					};
				};
			};
		};
		//hint format["%1",_offsetY];
		if (!isNull _ctrlBorder && !isNull _ctrlText) then {
			_ctrlBorder ctrlSetPosition [_posX, (_posY + _offsetY)];
			_ctrlText ctrlSetPosition [(_posX + _borderWidth), (_posY + _offsetY)];
			_ctrlBorder ctrlCommit 0.25;
			_ctrlText ctrlCommit 0.25;
			_offsetY = _offsetY + _margin + ((ctrlPosition _ctrlText) select 3);
			if (_activeNotifications > 1) then {
				_ctrlText ctrlSetFade 1;
				_ctrlText ctrlCommit 0.2;
				_ctrlBorder ctrlSetFade 1;
				_ctrlBorder ctrlCommit 0.2;
			};
		};
		_activeNotifications = _activeNotifications + 1;
	} forEach open_notifications;
};
open_notifications = ([[_BorderCtrl,_TextCtrl,_sposta]] + open_notifications) select {!isNull (_x select 0) && !isNull (_x select 1)};