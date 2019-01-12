class azm_confirm_gui {
    idd = 10120;
    name = "azm_confirm_gui";
    movingenable = false;
    enablesimulation = true;
    class controlsBackground
    {
        class header : RscText
        {
            idc = -1;
            x = 0.3828125 * safezoneW + safezoneX;
            y = 0.322297955209348 * safezoneH + safezoneY;
            h = 0.0253159688412853 * safezoneH;
            w = 0.242708333333333 * safezoneW;
            text = "Made by Alezm";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.7};
        };
    };
    class controls
    {
        
        class text : RscStructuredText
        {
            idc = 1001;
            x = 0.3828125 * safezoneW + safezoneX;
            y = 0.345693768257059 * safezoneH + safezoneY;
            h = 0.135318889970789 * safezoneH;
            w = 0.242708333333333 * safezoneW;
            colorbackground[] = {0,0,0,0.9};
        };
        class annulla : RscButton
        {
            x = 0.3828125 * safezoneW + safezoneX;
            y = 0.482773694255112 * safezoneH + safezoneY;
            w = 0.0776041666666667 * safezoneW;
            h = 0.028371388510224 * safezoneH;
            idc = 1002;
            action = "closedialog 0;";
            text = "Annulla";
            colorBackground[] = AZM_ROSSO;
            colorBackgroundActive[] = AZM_ROSSO_DARK;
            colorFocused[] = AZM_ROSSO;
        };
        class conferma : RscButton
        {
            x = 0.548697916666667 * safezoneW + safezoneX;
            y = 0.482773694255112 * safezoneH + safezoneY;
            w = 0.0776041666666667 * safezoneW;
            h = 0.028371388510224 * safezoneH;
            idc = 1003;
            text = "Conferma";
            action = "";
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
        };
    };
};

