//10 cutRsc ["azm_vmenu","PLAIN"];
//10 cutText ["","PLAIN"];
class azm_vmenu {
    idd = 10115;
    name = "azm_vmenu";
    movingenable = false;
    enablesimulation = true;
    duration = 9999999999999;
    onLoad = "uiNamespace setVariable ['azm_vmenu',_this select 0]";
    class controlsBackground
    {
    };
    class controls
    {
        class sfondo : RscBackground
        {
            idc = -1;
            x = 0.00364583333333333 * safezoneW + safezoneX;
            y = 0.391407010710808 * safezoneH + safezoneY;
            w = 0.171354166666667 * safezoneW;
            h = 0.216187925998053 * safezoneH;
            colorbackground[] = {0,0,0,0.5};
        };
        class header : RscText
        {
            idc = -1;
            text = "Made by Alezm";
            x = 0.00364583333333333 * safezoneW + safezoneX;
            y = 0.367088607594937 * safezoneH + safezoneY;
            h = 0.0253159688412853 * safezoneH;
            w = 0.171354166666667 * safezoneW;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",0.7};
        };
        class text : RscStructuredText
        {
            idc = 1000;
            x = 0.00885416666666667 * safezoneW + safezoneX;
            y = 0.401195228821811 * safezoneH + safezoneY;
            h = 0.199583739045764 * safezoneH;
            w = 0.160416666666667 * safezoneW;
            //colorbackground[] = {0,0,0,0.5};
            text = ".";
        };
    };
};


