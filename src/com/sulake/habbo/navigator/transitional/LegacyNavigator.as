// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.navigator.transitional.LegacyNavigator

package com.sulake.habbo.navigator.transitional
{
    import com.sulake.habbo.navigator._SafeStr_1697;
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.habbo.navigator.HabboNavigator;
    import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
    import com.sulake.habbo.navigator.inroom.RoomInfoViewCtrl;
    import com.sulake.habbo.navigator.roomsettings.RoomCreateViewCtrl;
    import com.sulake.habbo.navigator.GuestRoomPasswordInput;
    import com.sulake.habbo.navigator.GuestRoomDoorbell;
    import com.sulake.habbo.navigator.mainview.OfficialRoomEntryManager;
    import com.sulake.habbo.navigator.inroom.RoomEventViewCtrl;
    import com.sulake.habbo.navigator.inroom.RoomEventInfoCtrl;
    import com.sulake.habbo.navigator.roomsettings.RoomFilterCtrl;
    import com.sulake.habbo.navigator.roomsettings.EnforceCategoryCtrl;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.navigator.domain.NavigatorData;
    import com.sulake.habbo.navigator.mainview.ITransitionalMainViewCtrl;
    import com.sulake.habbo.navigator.domain.Tabs;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window._SafeStr_3133;
    import flash.display.BitmapData;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import flash.events.IEventDispatcher;
    import flash.geom.Point;
    import _-Ja._SafeStr_1569;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;
    import flash.utils.Dictionary;

    public class LegacyNavigator implements _SafeStr_1697 
    {

        private var _newNavigator:HabboNewNavigator;
        private var _SafeStr_3964:HabboNavigator;
        private var _SafeStr_5406:FakeMainViewCtrl;
        private var _SafeStr_3746:RoomSettingsCtrl;
        private var _SafeStr_3743:RoomInfoViewCtrl;
        private var _SafeStr_3744:RoomCreateViewCtrl;
        private var _passwordInput:GuestRoomPasswordInput;
        private var _SafeStr_3747:GuestRoomDoorbell;
        private var _officialRoomEntryManager:OfficialRoomEntryManager;
        private var _SafeStr_3748:RoomEventViewCtrl;
        private var _SafeStr_3749:RoomEventInfoCtrl;
        private var _SafeStr_3750:RoomFilterCtrl;
        private var _SafeStr_3751:EnforceCategoryCtrl;

        public function LegacyNavigator(_arg_1:HabboNewNavigator, _arg_2:HabboNavigator)
        {
            _newNavigator = _arg_1;
            _SafeStr_3964 = _arg_2;
            _SafeStr_5406 = new FakeMainViewCtrl(_newNavigator, _SafeStr_3964);
            _SafeStr_3746 = new RoomSettingsCtrl(this);
            _SafeStr_3743 = new RoomInfoViewCtrl(this);
            _SafeStr_3744 = new RoomCreateViewCtrl(this);
            _passwordInput = new GuestRoomPasswordInput(this);
            _SafeStr_3747 = new GuestRoomDoorbell(this);
            _officialRoomEntryManager = new OfficialRoomEntryManager(this);
            _SafeStr_3748 = new RoomEventViewCtrl(this);
            _SafeStr_3749 = new RoomEventInfoCtrl(this);
            _SafeStr_3750 = new RoomFilterCtrl(this);
            _SafeStr_3751 = new EnforceCategoryCtrl(this);
        }

        public function set oldNavigator(_arg_1:HabboNavigator):void
        {
            _SafeStr_3964 = _arg_1;
        }

        public function get assets():_SafeStr_21
        {
            return (_SafeStr_3964.assets);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_newNavigator.windowManager);
        }

        public function get data():NavigatorData
        {
            return (_SafeStr_3964.data);
        }

        public function get mainViewCtrl():ITransitionalMainViewCtrl
        {
            return (_SafeStr_5406);
        }

        public function get tabs():Tabs
        {
            return (_SafeStr_3964.tabs);
        }

        public function get roomInfoViewCtrl():RoomInfoViewCtrl
        {
            return (_SafeStr_3743);
        }

        public function get roomCreateViewCtrl():RoomCreateViewCtrl
        {
            return (_SafeStr_3744);
        }

        public function get communication():_SafeStr_25
        {
            return (_SafeStr_3964.communication);
        }

        public function get roomSettingsCtrl():RoomSettingsCtrl
        {
            return (_SafeStr_3746);
        }

        public function get sessionData():ISessionDataManager
        {
            return (_SafeStr_3964.sessionData);
        }

        public function get passwordInput():GuestRoomPasswordInput
        {
            return (_SafeStr_3964.passwordInput);
        }

        public function get doorbell():GuestRoomDoorbell
        {
            return (_SafeStr_3747);
        }

        public function get roomEventViewCtrl():RoomEventViewCtrl
        {
            return (_SafeStr_3748);
        }

        public function get localization():_SafeStr_18
        {
            return (_SafeStr_3964.localization);
        }

        public function get officialRoomEntryManager():OfficialRoomEntryManager
        {
            return (_SafeStr_3964.officialRoomEntryManager);
        }

        public function get toolbar():IHabboToolbar
        {
            return (_SafeStr_3964.toolbar);
        }

        public function get habboHelp():IHabboHelp
        {
            return (_SafeStr_3964.habboHelp);
        }

        public function get roomEventInfoCtrl():RoomEventInfoCtrl
        {
            return (_SafeStr_3749);
        }

        public function get roomFilterCtrl():RoomFilterCtrl
        {
            return (_SafeStr_3750);
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return (_SafeStr_3964.roomSessionManager);
        }

        public function get enforceCategoryCtrl():EnforceCategoryCtrl
        {
            return (_SafeStr_3751);
        }

        public function send(_arg_1:IMessageComposer, _arg_2:Boolean=false):void
        {
            return (_SafeStr_3964.send(_arg_1, _arg_2));
        }

        public function getXmlWindow(_arg_1:String, _arg_2:uint=1):_SafeStr_3109
        {
            return (_SafeStr_3964.getXmlWindow(_arg_1, _arg_2));
        }

        public function getText(_arg_1:String):String
        {
            return (_SafeStr_3964.getText(_arg_1));
        }

        public function registerParameter(_arg_1:String, _arg_2:String, _arg_3:String):String
        {
            return (_SafeStr_3964.registerParameter(_arg_1, _arg_2, _arg_3));
        }

        public function getButton(_arg_1:String, _arg_2:String, _arg_3:Function, _arg_4:int=0, _arg_5:int=0, _arg_6:int=0):_SafeStr_3264
        {
            return (_SafeStr_3964.getButton(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6));
        }

        public function refreshButton(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:Boolean, _arg_4:Function, _arg_5:int, _arg_6:String=null):void
        {
            return (_SafeStr_3964.refreshButton(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6));
        }

        public function getButtonImage(_arg_1:String, _arg_2:String="_png"):BitmapData
        {
            return (_SafeStr_3964.getButtonImage(_arg_1, _arg_2));
        }

        public function openCatalogClubPage(_arg_1:String):void
        {
            return (_SafeStr_3964.openCatalogClubPage(_arg_1));
        }

        public function openCatalogRoomAdsPage():void
        {
            return (_SafeStr_3964.openCatalogRoomAdsPage());
        }

        public function showFavouriteRooms():void
        {
            return (_newNavigator.performSearch("favorites"));
        }

        public function showHistoryRooms():void
        {
            return (_newNavigator.performSearch("history"));
        }

        public function showFrequentRooms():void
        {
            return (_newNavigator.performSearch("history_freq"));
        }

        public function get tracking():_SafeStr_1704
        {
            return (_SafeStr_3964.tracking);
        }

        public function goToMainView():void
        {
            _SafeStr_3744.hide();
        }

        public function reportRoomFromWeb(_arg_1:String, _arg_2:String=null):void
        {
            _SafeStr_3964.enterRoomWebRequest(_arg_1, true, _arg_2);
        }

        public function goToRoom(_arg_1:int, _arg_2:Boolean, _arg_3:String="", _arg_4:int=-1):void
        {
            _SafeStr_3964.goToRoom(_arg_1, false, _arg_3, _arg_4);
        }

        public function isPerkAllowed(_arg_1:String):Boolean
        {
            return (_SafeStr_3964.isPerkAllowed(_arg_1));
        }

        public function trackGoogle(_arg_1:String, _arg_2:String, _arg_3:int=-1):void
        {
            return (_SafeStr_3964.trackGoogle(_arg_1, _arg_2, _arg_3));
        }

        public function getBoolean(_arg_1:String):Boolean
        {
            return (_SafeStr_3964.getBoolean(_arg_1));
        }

        public function getInteger(_arg_1:String, _arg_2:int):int
        {
            return (_SafeStr_3964.getInteger(_arg_1, _arg_2));
        }

        public function get events():IEventDispatcher
        {
            return (_newNavigator.events);
        }

        public function goToHomeRoom():Boolean
        {
            _newNavigator.goToHomeRoom();
            return (true);
        }

        public function performTagSearch(_arg_1:String):void
        {
            return (_newNavigator.performTagSearch(_arg_1));
        }

        public function performTextSearch(_arg_1:String):void
        {
            return (_newNavigator.performTextSearch(_arg_1));
        }

        public function performGuildBaseSearch():void
        {
            return (_newNavigator.performSearch("groups"));
        }

        public function performCompetitionRoomsSearch(_arg_1:int, _arg_2:int):void
        {
            return (_newNavigator.performSearch("competition"));
        }

        public function showOwnRooms():void
        {
            return (_newNavigator.performSearch("myworld_view"));
        }

        public function goToPrivateRoom(_arg_1:int):void
        {
            _newNavigator.goToRoom(_arg_1);
        }

        public function hasRoomRightsButIsNotOwner(_arg_1:int):Boolean
        {
            return (_SafeStr_3964.hasRoomRightsButIsNotOwner(_arg_1));
        }

        public function removeRoomRights(_arg_1:int):void
        {
            return (_SafeStr_3964.removeRoomRights(_arg_1));
        }

        public function goToRoomNetwork(_arg_1:int, _arg_2:Boolean):void
        {
            return (goToRoomNetwork(_arg_1, _arg_2));
        }

        public function startRoomCreation():void
        {
            return (_newNavigator.createRoom());
        }

        public function openNavigator(_arg_1:Point=null):void
        {
            return (_newNavigator.open());
        }

        public function closeNavigator():void
        {
            return (_newNavigator.close());
        }

        public function get homeRoomId():int
        {
            return (_SafeStr_3964.homeRoomId);
        }

        public function get enteredGuestRoomData():_SafeStr_1569
        {
            return (_SafeStr_3964.enteredGuestRoomData);
        }

        public function showToolbarHover(_arg_1:Point):void
        {
        }

        public function hideToolbarHover(_arg_1:Boolean):void
        {
        }

        public function toggleRoomInfoVisibility():void
        {
            if (_SafeStr_3743)
            {
                _SafeStr_3743.toggle();
            };
        }

        public function canRateRoom():Boolean
        {
            return (_SafeStr_3964.canRateRoom());
        }

        public function queueInterface(_arg_1:IID, _arg_2:Function=null):IUnknown
        {
            return (_newNavigator.queueInterface(_arg_1, _arg_2));
        }

        public function release(_arg_1:IID):uint
        {
            return (_newNavigator.release(_arg_1));
        }

        public function dispose():void
        {
            _SafeStr_3746.dispose();
            _SafeStr_3743.dispose();
            _SafeStr_3744.dispose();
            _passwordInput.dispose();
            _SafeStr_3747.dispose();
            _officialRoomEntryManager.dispose();
            _SafeStr_3748.dispose();
            _SafeStr_3749.dispose();
            _SafeStr_3750.dispose();
            _SafeStr_3751 = null;
            _SafeStr_3964 = null;
            _newNavigator = null;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_3964 == null);
        }

        public function openCatalogRoomAdsExtendPage(_arg_1:String, _arg_2:String, _arg_3:Date, _arg_4:int):void
        {
            return (_SafeStr_3964.openCatalogRoomAdsExtendPage(_arg_1, _arg_2, _arg_3, _arg_4));
        }

        public function getProperty(_arg_1:String, _arg_2:Dictionary=null):String
        {
            return (_SafeStr_3964.getProperty(_arg_1, _arg_2));
        }

        public function get isDoorModeOverriddenInCurrentRoom():Boolean
        {
            return (_SafeStr_3964.isDoorModeOverriddenInCurrentRoom);
        }

        public function trackNavigationDataPoint(_arg_1:String, _arg_2:String, _arg_3:String="", _arg_4:int=0):void
        {
            return (_SafeStr_3964.trackNavigationDataPoint(_arg_1, _arg_2, _arg_3, _arg_4));
        }

        public function isRoomFavorite(_arg_1:int):Boolean
        {
            return (_SafeStr_3964.isRoomFavorite(_arg_1));
        }

        public function isRoomHome(_arg_1:int):Boolean
        {
            return (_SafeStr_3964.isRoomHome(_arg_1));
        }

        public function get visibleEventCategories():Array
        {
            return (_SafeStr_3964.data.visibleEventCategories);
        }

        public function get roomSettingsControl():RoomSettingsCtrl
        {
            return (_SafeStr_3964.roomSettingsCtrl);
        }


    }
}//package com.sulake.habbo.navigator.transitional

// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1697 = "_-bu" (String#1958, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3743 = "_-c1N" (String#3794, DoABC#4)
// _SafeStr_3744 = "_-Ev" (String#4514, DoABC#4)
// _SafeStr_3746 = "_-M1C" (String#5734, DoABC#4)
// _SafeStr_3747 = "_-V1" (String#3373, DoABC#4)
// _SafeStr_3748 = "_-Y10" (String#5769, DoABC#4)
// _SafeStr_3749 = "_-kv" (String#8574, DoABC#4)
// _SafeStr_3750 = "_-Cp" (String#5670, DoABC#4)
// _SafeStr_3751 = "_-eg" (String#7256, DoABC#4)
// _SafeStr_3964 = "_-5U" (String#1522, DoABC#4)
// _SafeStr_5406 = "_-91S" (String#19694, DoABC#4)


