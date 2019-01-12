class azm_spawn_gui {
    idd = 10117;
    name = "azm_spawn_gui";
    movingenable = false;
    enablesimulation = true;
    class controlsBackground
    {
        class header : RscText
        {
            idc = -1;
            text = "Made by Alezm";
            x = 0.309895833333334 * safezoneW + safezoneX;
            y = 0.278481012658228 * safezoneH + safezoneY;
            h = 0.0253159688412853 * safezoneH;
            w = 0.373 * safezoneW;
            colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.7};
        };
    };
    class controls
    {
        class listaspawn : RscListBox
        {
            x = 0.309895833333334 * safezoneW + safezoneX;
            y = 0.307643622200585 * safezoneH + safezoneY;
            w = 0.144270833333333 * safezoneW;
            h = 0.364216163583252 * safezoneH;
            idc = 1000;
            onLBSelChanged = "[] call azm_fnc_map_spawn";
            onLBDblClick = "call azm_fnc_spawn";
        };
        class tastospawn : RscButton
        {
            x = 0.309895833333334 * safezoneW + safezoneX;
            y = 0.681463080817917 * safezoneH + safezoneY;
            w = 0.144270833333333 * safezoneW;
            h = 0.0392159999999999 * safezoneH;
            idc = 1001;
            tooltip = "Spawna nell citta selezionata";
            text = "Spawn";
            action = "call azm_fnc_spawn";
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
        };
        class mappa : RscMapControl
        {
            idc = 1002;
            x = 0.458333333333333 * safezoneW + safezoneX;
            y = 0.307643622200585 * safezoneH + safezoneY;
            w = 0.224479166666667 * safezoneW;
            h = 0.364216163583252 * safezoneH;
        };
    };
};
