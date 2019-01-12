class azm_garage_gui {
    idd = 10111;
    name = "azm_garage_gui";
    movingenable = false;
    enablesimulation = true;
    onLoad = "uiNamespace setVariable ['azm_garage_gui',_this select 0]";
    class controlsBackground
    {
        class header : RscText
        {
            idc = -1;
            text = "Made by Alezm";
            x = 0.313020833333333 * safezoneW + safezoneX;
            y = 0.273481012658228 * safezoneH + safezoneY;
            h = 0.0253159688412853 * safezoneH;
            w = 0.400520833333333 * safezoneW;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.7};
        };
    };
    class controls
    {
        
        class lista_veicolo_garage : RscListBox
        {
            x = 0.313020833333333 * safezoneW + safezoneX;
            y = 0.301801363193768 * safezoneH + safezoneY;
            w = 0.400520833333333 * safezoneW;
            h = 0.303846153846154 * safezoneH;
            idc = 1001;
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
            colorBackground[] = AZM_ROSSO;
            colorBackgroundActive[] = AZM_ROSSO_DARK;
            colorFocused[] = AZM_ROSSO;
        };
        class bottone_spawn : RscButton
        {
            text = "Ritira";
            x = 0.395 * safezoneW + safezoneX;
            y = 0.608358325219085 * safezoneH + safezoneY;
            w = 0.0786458333333333 * safezoneW;
            h = 0.0264239688412853 * safezoneH;
            idc = 1003;
            tooltip = "Spawna il veicolo selezionato";
            action = "[] call azm_fnc_VehSpawnGarage";
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
        };
        class bottone_depo : RscButton
        {
            text = "Deposita";
            x = 0.476 * safezoneW + safezoneX;
            y = 0.608358325219085 * safezoneH + safezoneY;
            w = 0.0786458333333333 * safezoneW;
            h = 0.0264239688412853 * safezoneH;
            idc = 1004;
            tooltip = "Deposita il veicolo";
            action = "[] call azm_fnc_VehdepoGarage;closedialog 0;";
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
        };
        class bottone_sel : RscButton
        {
            text = "Vendi";
            x = 0.557 * safezoneW + safezoneX;
            y = 0.608358325219085 * safezoneH + safezoneY;
            w = 0.0786458333333333 * safezoneW;
            h = 0.0264239688412853 * safezoneH;
            idc = 1005;
            tooltip = "Vendi il veicolo selezionato";
            action = "['sell'] call azm_open_confirm;";
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
        };
    };
};



class azm_garage_mec {
    idd = 101111;
    name = "azm_garage_mec";
    movingenable = false;
    enablesimulation = true;
    onLoad = "uiNamespace setVariable ['azm_garage_mec',_this select 0]";
    class controlsBackground
    {
        class header : RscText
        {
            idc = -1;
            text = "Made by Alezm";
            x = 0.313020833333333 * safezoneW + safezoneX;
            y = 0.273481012658228 * safezoneH + safezoneY;
            h = 0.0253159688412853 * safezoneH;
            w = 0.400520833333333 * safezoneW;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.7};
        };
    };
    class controls
    {
        
        class lista_veicolo_garage : RscListBox
        {
            x = 0.313020833333333 * safezoneW + safezoneX;
            y = 0.301801363193768 * safezoneH + safezoneY;
            w = 0.400520833333333 * safezoneW;
            h = 0.303846153846154 * safezoneH;
            idc = 1001;
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
            colorBackground[] = AZM_ROSSO;
            colorBackgroundActive[] = AZM_ROSSO_DARK;
            colorFocused[] = AZM_ROSSO;
        };
        class bottone_spawn : RscButton
        {
            text = "Ritira";
            x = 0.395 * safezoneW + safezoneX;
            y = 0.608358325219085 * safezoneH + safezoneY;
            w = 0.0786458333333333 * safezoneW;
            h = 0.0264239688412853 * safezoneH;
            idc = 1003;
            tooltip = "Spawna il veicolo selezionato";
            action = "[] call azm_fnc_VehSpawnGarage;closedialog 0;";
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
        };
        class bottone_depo : RscButton
        {
            text = "Deposita";
            x = 0.476 * safezoneW + safezoneX;
            y = 0.608358325219085 * safezoneH + safezoneY;
            w = 0.0786458333333333 * safezoneW;
            h = 0.0264239688412853 * safezoneH;
            idc = 1004;
            tooltip = "Deposita il veicolo";
            action = "[] call azm_fnc_VehdepoGarage;closedialog 0;";
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
        };
    };
};
