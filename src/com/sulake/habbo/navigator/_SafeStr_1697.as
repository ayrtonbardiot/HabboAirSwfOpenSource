// by nota

//com.sulake.habbo.navigator._SafeStr_1697

package com.sulake.habbo.navigator
{
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import com.sulake.habbo.navigator.mainview.ITransitionalMainViewCtrl;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.habbo.navigator.inroom.RoomInfoViewCtrl;
    import com.sulake.habbo.navigator.roomsettings.RoomCreateViewCtrl;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.navigator.inroom.RoomEventViewCtrl;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.navigator.mainview.OfficialRoomEntryManager;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.navigator.inroom.RoomEventInfoCtrl;
    import com.sulake.habbo.navigator.roomsettings.RoomFilterCtrl;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.navigator.roomsettings.EnforceCategoryCtrl;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.BitmapData;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import flash.utils.Dictionary;

    public /*dynamic*/ interface _SafeStr_1697 extends _SafeStr_1696 
    {

        function get assets():_SafeStr_21;
        function get windowManager():_SafeStr_1695;
        function get data():NavigatorData;
        function get mainViewCtrl():ITransitionalMainViewCtrl;
        function get tabs():Tabs;
        function get roomInfoViewCtrl():RoomInfoViewCtrl;
        function get roomCreateViewCtrl():RoomCreateViewCtrl;
        function get communication():IHabboCommunicationManager;
        function get roomSettingsCtrl():RoomSettingsCtrl;
        function get sessionData():ISessionDataManager;
        function get passwordInput():GuestRoomPasswordInput;
        function get doorbell():GuestRoomDoorbell;
        function get roomEventViewCtrl():RoomEventViewCtrl;
        function get localization():_SafeStr_18;
        function get officialRoomEntryManager():OfficialRoomEntryManager;
        function get toolbar():IHabboToolbar;
        function get habboHelp():IHabboHelp;
        function get roomEventInfoCtrl():RoomEventInfoCtrl;
        function get roomFilterCtrl():RoomFilterCtrl;
        function get roomSessionManager():IRoomSessionManager;
        function get enforceCategoryCtrl():EnforceCategoryCtrl;
        function send(_arg_1:IMessageComposer, _arg_2:Boolean=false):void;
        function getXmlWindow(_arg_1:String, _arg_2:uint=1):_SafeStr_3109;
        function getText(_arg_1:String):String;
        function registerParameter(_arg_1:String, _arg_2:String, _arg_3:String):String;
        function getButton(_arg_1:String, _arg_2:String, _arg_3:Function, _arg_4:int=0, _arg_5:int=0, _arg_6:int=0):_SafeStr_3264;
        function refreshButton(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:Boolean, _arg_4:Function, _arg_5:int, _arg_6:String=null):void;
        function getButtonImage(_arg_1:String, _arg_2:String="_png"):BitmapData;
        function openCatalogClubPage(_arg_1:String):void;
        function openCatalogRoomAdsPage():void;
        function openCatalogRoomAdsExtendPage(_arg_1:String, _arg_2:String, _arg_3:Date, _arg_4:int):void;
        function showFavouriteRooms():void;
        function showHistoryRooms():void;
        function showFrequentRooms():void;
        function get tracking():_SafeStr_1704;
        function goToMainView():void;
        function goToRoom(_arg_1:int, _arg_2:Boolean, _arg_3:String="", _arg_4:int=-1):void;
        function isPerkAllowed(_arg_1:String):Boolean;
        function trackGoogle(_arg_1:String, _arg_2:String, _arg_3:int=-1):void;
        function get isDoorModeOverriddenInCurrentRoom():Boolean;
        function trackNavigationDataPoint(_arg_1:String, _arg_2:String, _arg_3:String="", _arg_4:int=0):void;
        function getBoolean(_arg_1:String):Boolean;
        function getInteger(_arg_1:String, _arg_2:int):int;
        function getProperty(_arg_1:String, _arg_2:Dictionary=null):String;

    }
}//package com.sulake.habbo.navigator

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)


