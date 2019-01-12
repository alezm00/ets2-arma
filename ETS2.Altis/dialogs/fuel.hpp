
class azm_fuel_gui {
    idd = 99735;
    name = "azm_fuel_gui";
    movingenable = false;
    enablesimulation = true;
    class controlsBackground
    {
        class header : RscText
        {
            idc = -1;
            x = 0.330729166666667 * safezoneW + safezoneX;
            y = 0.259191333982473 * safezoneH + safezoneY;
            h = 0.0253159688412853 * safezoneH;
            w = 0.3453125 * safezoneW;
            text = "Made by Alezm";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.7};
        };
    };
    class controls
    {
        
        class listaveicoli : RscListBox
        {
            x = 0.330729166666667 * safezoneW + safezoneX;
            y = 0.283300876338851 * safezoneH + safezoneY;
            w = 0.165625 * safezoneW;
            h = 0.214264849074976 * safezoneH;
            idc = 1001;
            onLBSelChanged = "call azm_fuel_text";
            colorbackground[] = {0,0,0,0.7};
        };
        class chiudi : RscButton
        {
            x = 0.330729166666667 * safezoneW + safezoneX;
            y = 0.500353051606621 * safezoneH + safezoneY;
            w = 0.065625 * safezoneW;
            h = 0.0322662278481013 * safezoneH;
            idc = 1002;
            text = "Chiudi";
            action = "closedialog 0;";
            colorBackground[] = AZM_ROSSO;
            colorBackgroundActive[] = AZM_ROSSO_DARK;
            colorFocused[] = AZM_ROSSO;
        };
        class testo : RscStructuredText
        {
            idc = 1003;
            x = 0.496875 * safezoneW + safezoneX;
            y = 0.283300876338851 * safezoneH + safezoneY;
            h = 0.214264849074976 * safezoneH;
            w = 0.179166666666667 * safezoneW;
            colorbackground[] = {0,0,0,0.7};
        };
        class conferma : RscButton
        {
            x = 0.3984375 * safezoneW + safezoneX;
            y = 0.500353051606621 * safezoneH + safezoneY;
            w = 0.065625 * safezoneW;
            h = 0.0322662278481013 * safezoneH;
            idc = 1004;
            text = "Rifornimento";
            action = "[] spawn azm_avvia_rifornimento";
            colorBackground[] = AZM_VERDE;
            colorBackgroundActive[] = AZM_VERDE_DARK;
            colorFocused[] = AZM_VERDE;
        };
    };
};
