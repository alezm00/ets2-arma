
class azm_pmenu {
    idd = 10113;
    name = "azm_pmenu";
    movingenable = false;
    enablesimulation = true;
    class controlsBackground
    {
        class header : RscText
        {
            idc = 1000;
            text = "Made by Alezm";
            x = 0.411458333333333 * safezoneW + safezoneX;
            y = 0.308718597857838 * safezoneH + safezoneY;
            h = 0.0253159688412853 * safezoneH;
            w = 0.180729166666667 * safezoneW;
            colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.7};
        };
        class sfondo : RscText
        {
            idc = 1002;
            x = 0.411458333333333 * safezoneW + safezoneX;
            y = 0.337852969814995 * safezoneH + safezoneY;
            w = 0.180729166666667 * safezoneW;
            h = 0.243451801363193 * safezoneH;
            colorbackground[] = {0,0,0,0.5};
        };
    };
    class controls
    {
        class testo1 : RscText
        {
            idc = 1004;
            x = 0.416666666666667 * safezoneW + safezoneX;
            y = 0.428432570593963 * safezoneH + safezoneY;
            h = 0.0253159688412853 * safezoneH;
            w = 0.165625 * safezoneW;
        };
        class testo2: RscText
        {
            idc = 1003;
            x = 0.416666666666667 * safezoneW + safezoneX;
            y = 0.38948417721519 * safezoneH + safezoneY;
            h = 0.0253159688412853 * safezoneH;
            w = 0.165625 * safezoneW;
        };
        class testo3 : RscText
        {
            idc = 1001;
            x = 0.416666666666667 * safezoneW + safezoneX;
            y = 0.349562317429406 * safezoneH + safezoneY;
            h = 0.0253159688412853 * safezoneH;
            w = 0.165625 * safezoneW;
        };
        class btnsalva : RscButton
        {
            text = "Salva";
            x = 0.416666666666667 * safezoneW + safezoneX;
            y = 0.475170399221032 * safezoneH + safezoneY;
            w = 0.05 * safezoneW;
            h = 0.0253159688412853 * safezoneH;
            idc = 1005;
            action = "closedialog 0;saveProfileNamespace;['Salvataggio completato','success',10] spawn azm_fnc_notifica;";
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
        };
        class btnlvora : RscButton
        {
            text = "Lavoro";
            x = 0.468666666666667 * safezoneW + safezoneX;
            y = 0.475170399221032 * safezoneH + safezoneY;
            w = 0.05 * safezoneW;
            h = 0.0253159688412853 * safezoneH;
            idc = 1006;
            action = "call azm_fnc_gen;";
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
        };
        class btnannlavoro : RscButton
        {
            text = "Annulla";
            x = 0.468666666666667 * safezoneW + safezoneX;
            y = 0.505470399221032 * safezoneH + safezoneY;
            w = 0.05 * safezoneW;
            h = 0.0253159688412853 * safezoneH;
            idc = 1007;
            tooltip = "Annulla il lavoro in corso";
            action = "call azm_fnc_exitlavoro;";
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
        };
        class btnadmin : RscButton
        {
            text = "Admin";
            x = 0.520666666666667 * safezoneW + safezoneX;
            y = 0.475170399221032 * safezoneH + safezoneY;
            w = 0.05 * safezoneW;
            h = 0.0253159688412853 * safezoneH;
            idc = 1008;
            action = "closedialog 0;['azm_admin_gui'] call azm_fnc_opengui;";
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
        };
        class btnchiudi : RscButton
        {
            text = "Chiudi";
            x = 0.411458333333333 * safezoneW + safezoneX;
            y = 0.586041869522882 * safezoneH + safezoneY;
            w = 0.041666666666667 * safezoneW;
            h = 0.0253159688412853 * safezoneH;
            idc = 1009;
            action = "closedialog 0;";
            colorBackground[] = AZM_ROSSO;
            colorBackgroundActive[] = AZM_ROSSO_DARK;
            colorFocused[] = AZM_ROSSO;
        };
    };
};

