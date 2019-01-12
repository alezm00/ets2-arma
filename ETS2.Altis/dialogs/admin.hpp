class azm_admin_gui {
    idd = 99876;
    name = "azm_admin_gui";
    movingenable = false;
    enablesimulation = true;
    class controlsBackground
    {
        class sfondo : RscBackground
        {
            idc = -1;
            x = 0.215625 * safezoneW + safezoneX;
            y = 0.141820837390458 * safezoneH + safezoneY;
            w = 0.570833333333333 * safezoneW;
            h = 0.636173320350535 * safezoneH;
            colorbackground[] = {0,0,0,0.5};
        };
        class header : RscText
        {
            idc = -1;
            x = 0.215104166666667 * safezoneW + safezoneX;
            y = 0.113924050632911 * safezoneH + safezoneY;
            h = 0.024342259006816 * safezoneH;
            w = 0.570833333333333 * safezoneW;
            text = "Made by Alezm";
            colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.7};
        };
    };
    class controls
    {
        class playerlist : RscListBox
        {
            x = 0.219791666666667 * safezoneW + safezoneX;
            y = 0.149902629016553 * safezoneH + safezoneY;
            w = 0.196354166666667 * safezoneW;
            h = 0.3 * safezoneH;
            idc = 998765;
            onLBSelChanged = "call azm_fnc_text_admin";
            onLBDblClick = "call azm_fnc_admin_copy";
        };
        class playertext : RscStructuredText
        {
            idc = 1003;
            x = 0.421875 * safezoneW + safezoneX;
            y = 0.149902629016553 * safezoneH + safezoneY;
            h = 0.3 * safezoneH;
            w = 0.35729 * safezoneW;
        };
        class combostart : RscCombo
        {
            x = 0.219791666666667 * safezoneW + safezoneX;
            y = 0.73904576436222 * safezoneH + safezoneY;
            w = 0.0817708333333333 * safezoneW;
            h = 0.0262366114897761 * safezoneH;
            idc = 1004;
            onLBSelChanged = "call azm_guad_text";
        };
        class combostop : RscCombo
        {
            x = 0.30703125 * safezoneW + safezoneX;
            y = 0.73904576436222 * safezoneH + safezoneY;
            w = 0.0817708333333333 * safezoneW;
            h = 0.0262366114897761 * safezoneH;
            idc = 1005;
            onLBSelChanged = "call azm_guad_text";
        };
        class guadagno : RscStructuredText
        {
            idc = 1006;
            x = 0.391666666666667 * safezoneW + safezoneX;
            y = 0.740019474196689 * safezoneH + safezoneY;
            h = 0.0262366114897761 * safezoneH;
            w = 0.112729166666667 * safezoneW;
        };
        class avvialavoro : RscButton
        {
            x = 0.523645833333333 * safezoneW + safezoneX;
            y = 0.740993184031159 * safezoneH + safezoneY;
            w = 0.0666666666666667 * safezoneW;
            h = 0.0262366114897761 * safezoneH;
            idc = 1007;
            text = "Lavoro";
            tooltip = "Avvia lavoro globale";
            action = "closedialog 0;call azm_gui_global_lavoro";
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
        };
        class textvarsel : RscCombo
        {
            x = 0.219791666666667 * safezoneW + safezoneX;
            y = 0.4634858812074 * safezoneH + safezoneY;
            h = 0.0314263213242454 * safezoneH;
            w = 0.0916666666666667 * safezoneW;
            idc = 1008;
        };
        class textvarvalue : RscEdit
        {
            x = 0.3171875 * safezoneW + safezoneX;
            y = 0.4634858812074 * safezoneH + safezoneY;
            h = 0.0314263213242454 * safezoneH;
            w = 0.0916666666666667 * safezoneW;
            idc = 1009;
        };
        class btnvarsetvalue : RscButton
        {
            x = 0.415625 * safezoneW + safezoneX;
            y = 0.4634858812074 * safezoneH + safezoneY;
            w = 0.0951903333333333 * safezoneW;
            h = 0.0314263213242454 * safezoneH;
            idc = 1010;
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
            text = "Variabile";
            tooltip = "Modifica i salvataggi del player selezionato";
            action = "call azm_fnc_admin_vars_modify";
        };
       
    };
};

