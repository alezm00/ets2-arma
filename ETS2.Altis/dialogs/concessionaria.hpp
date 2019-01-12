class azm_conce_gui {
    idd = 10112;
    name = "azm_conce_gui";
    movingenable = false;
    enablesimulation = true;
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
            colorBackground[] = {0.28,0.28,0.28,0.70};
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
            text = "Compra";
            x = 0.40234375 * safezoneW + safezoneX;
            y = 0.608358325219085 * safezoneH + safezoneY;
            w = 0.0786458333333333 * safezoneW;
            h = 0.0264239688412853 * safezoneH;
            idc = 1003;
            tooltip = "Compra il veicolo selezionato";
            action = "[] call azm_fnc_VehSpawnConcessionario";
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
        };
    };
};