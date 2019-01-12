class azm_lavori_gui {
    idd = 10114;
    name = "azm_lavori_gui";
    movingenable = false;
    enablesimulation = true;
    onLoad = "uiNamespace setVariable ['azm_lavori_gui',_this select 0]";
    class controlsBackground
    {
        class header : RscText
        {
            text = "Made by Alezm";
            x = 0.313020833333333 * safezoneW + safezoneX;
            y = 0.273481012658228 * safezoneH + safezoneY;
            h = 0.0253159688412853 * safezoneH;
            w = 0.400520833333333 * safezoneW;
            idc = 1005;
            colorbackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.7};
        };
    /*    class sfondo : RscText
        {
            x = 0.313020833333333 * safezoneW + safezoneX;
            y = 0.306231742940603 * safezoneH + safezoneY;
            w = 0.4015625 * safezoneW;
            h = 0.302336903602726 * safezoneH;
            idc = 1004;
            colorbackground[] = {0,0,0,0.8};
        };*/
    };
    class controls
    {
        class RscStructuredText0 : RscStructuredText
        {
            idc = 1000;
            x = 0.517708333333333 * safezoneW + safezoneX;
            y = 0.306231742940603 * safezoneH + safezoneY;
            h = 0.302336903602726 * safezoneH;
            w = 0.196875 * safezoneW;
        };
        class bottone_chiudi : RscButton
        {
            text = "Chiudi";
            x = 0.313020833333333 * safezoneW + safezoneX;
            y = 0.608358325219085 * safezoneH + safezoneY;
            w = 0.0786458333333333 * safezoneW;
            h = 0.0264239688412853 * safezoneH;
            idc = 1002;
            tooltip = "Chiudi";
            action = "closedialog 0";
            colorbackground[] = AZM_ROSSO;
            colorbackgroundactive[] = AZM_ROSSO_DARK;
            colorfocused[] = AZM_ROSSO;
        };
        class bottone_spawn : RscButton
        {
            text = "Avvia Lavoro";
            x = 0.40234375 * safezoneW + safezoneX;
            y = 0.608358325219085 * safezoneH + safezoneY;
            w = 0.0786458333333333 * safezoneW;
            h = 0.0264239688412853 * safezoneH;
            idc = 1003;
            tooltip = "Avvia il lavoro selezionato";
            action = "lavoro_attivo = [] spawn azm_fnc_AvviaLavoro";
            colorbackground[] = AZM_VERDE;
            colorbackgroundactive[] = AZM_VERDE_DARK;
            colorfocused[] = AZM_VERDE;
        };
        class listalavori : RscListBox
        {
            x = 0.313020833333333 * safezoneW + safezoneX;
            y = 0.300231742940603 * safezoneH + safezoneY;
            w = 0.2015625 * safezoneW;
            h = 0.302336903602726 * safezoneH;
            idc = 1001;
            controlsbackground[] = {0.1,0,0,0.9};
            onLBSelChanged = "call azm_fnc_text";
        };
        class testolavoro : RscStructuredText
        {
            x = 0.518140833333333 * safezoneW + safezoneX;
            y = 0.300231742940603 * safezoneH + safezoneY;
            w = 0.1946525 * safezoneW;
            h = 0.302336903602726 * safezoneH;
            idc = 1006;
            colorbackground[] = {0,0,0,0.5};
            text = ".";
            //text = "<t color='#ff0000'>Red text</t> <t color='#99ffffff'>Transparent white text</t> <t colorLink='#0000ff'><a href='http://www.arma3.com/'>Blue link</a></t>";
        };
    };
};

