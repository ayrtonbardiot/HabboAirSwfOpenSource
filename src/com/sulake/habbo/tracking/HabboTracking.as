// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.tracking.HabboTracking

package com.sulake.habbo.tracking
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.communication._SafeStr_25;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.room.IRoomEngine;
    import flash.utils.Timer;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.utils.ErrorReportStorage;
    import flash.system.Capabilities;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDHabboInventory;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.iid.IIDHabboAdManager;
    import com.sulake.iid.IIDHabboToolbar;
    import _-yL._SafeStr_459;
    import _-Ol._SafeStr_484;
    import _-EK._SafeStr_201;
    import _-b1B._SafeStr_834;
    import flash.events.IEventDispatcher;
    import flash.events.Event;
    import com.sulake.core.runtime.events.ErrorEvent;
    import com.sulake.core.runtime.exceptions.Exception;
    import flash.system.System;
    import _-28._SafeStr_1189;
    import com.sulake.habbo.catalog.navigation.events.CatalogPageOpenedEvent;
    import _-61T._SafeStr_1254;
    import com.sulake.habbo.advertisement.events.AdEvent;
    import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import flash.events.TimerEvent;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import flash.external.ExternalInterface;
    import _-qv._SafeStr_895;
    import flash.utils.getTimer;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.iid.*;

    public class HabboTracking extends _SafeStr_20 implements _SafeStr_1704, _SafeStr_41 
    {

        private static const ERROR_DATA_FLAG_COUNT:uint = 11;

        private static var _SafeStr_3793:HabboTracking;

        private var _communication:_SafeStr_25;
        private var _SafeStr_3794:Array;
        private var _SafeStr_3515:Boolean = false;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _SafeStr_3797:PerformanceTracker = null;
        private var _SafeStr_3799:FramerateTracker = null;
        private var _SafeStr_3795:LatencyTracker = null;
        private var _SafeStr_3803:LagWarningLogger = null;
        private var _SafeStr_3802:ToolbarClickTracker = null;
        private var _roomEngine:IRoomEngine = null;
        private var _SafeStr_3798:Boolean = false;
        private var _currentTime:int = -1;
        private var _SafeStr_3804:int = 0;
        private var _SafeStr_3805:int = 0;
        private var _SafeStr_3796:Timer;
        private var _SafeStr_3801:int = 0;
        private var _SafeStr_3800:int = -1;
        private var onceTrackedEvents:Vector.<String> = new Vector.<String>(0);

        public function HabboTracking(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            var _local_5:uint;
            if (_SafeStr_3793 == null)
            {
                _SafeStr_3793 = this;
            };
            _SafeStr_3794 = new Array(11);
            _local_5 = 0;
            while (_local_5 < 11)
            {
                _SafeStr_3794[_local_5] = 0;
                _local_5++;
            };
            super(_arg_1, _arg_2, _arg_3);
            var _local_6:String = "WIN63-202203291339-356770471";
            var _local_4:_SafeStr_31 = _arg_1.root;
            if (_local_4 != null)
            {
                _local_4.events.addEventListener("COMPONENT_EVENT_ERROR", onError);
                ErrorReportStorage.setParameter("start_time", new Date().getTime().toString());
                ErrorReportStorage.setParameter("agent", _local_6);
                ErrorReportStorage.setParameter("system", Capabilities.serverString);
                ErrorReportStorage.setParameter("in_room", "false");
                ErrorReportStorage.setParameter("last_room", "0");
            };
            registerUpdateReceiver(this, 1);
        }

        public static function getInstance():HabboTracking
        {
            return (_SafeStr_3793);
        }


        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:_SafeStr_25):void
            {
                _communication = _arg_1;
            }), new ComponentDependency(new IIDHabboConfigurationManager(), function (_arg_1:_SafeStr_19):void
            {
                if (_arg_1 != null)
                {
                    setErrorContextFlag(1, 0);
                };
            }, false, [{
                "type":"complete",
                "callback":onConfigurationComplete
            }]), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                if (_arg_1 != null)
                {
                    setErrorContextFlag(1, 1);
                };
            }, false), new ComponentDependency(new IIDHabboWindowManager(), null, false, [{
                "type":"HABBO_WINDOW_TRACKING_EVENT_INPUT",
                "callback":onWindowTrackingEvent
            }, {
                "type":"HABBO_WINDOW_TRACKING_EVENT_RENDER",
                "callback":onWindowTrackingEvent
            }, {
                "type":"HABBO_WINDOW_TRACKING_EVENT_SLEEP",
                "callback":onWindowTrackingEvent
            }]), new ComponentDependency(new IIDHabboNavigator(), null, false, [{
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_CLOSED",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_ME",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH",
                "callback":onNavigatorTrackingEvent
            }, {
                "type":"HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED",
                "callback":onRoomSettingsTrackingEvent
            }, {
                "type":"HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT",
                "callback":onRoomSettingsTrackingEvent
            }, {
                "type":"HABBO_ROOM_SETTINGS_TRACKING_EVENT_ADVANCED",
                "callback":onRoomSettingsTrackingEvent
            }, {
                "type":"HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS",
                "callback":onRoomSettingsTrackingEvent
            }, {
                "type":"HTIE_ICON_ZOOM",
                "callback":onZoomToggle
            }]), new ComponentDependency(new IIDHabboCatalog(), null, false, [{
                "type":"CATALOG_PAGE_OPENED",
                "callback":onCatalogPageOpened
            }, {
                "type":"HABBO_CATALOG_TRACKING_EVENT_OPEN",
                "callback":onCatalogTrackingEvent
            }, {
                "type":"HABBO_CATALOG_TRACKING_EVENT_CLOSE",
                "callback":onCatalogTrackingEvent
            }, {
                "type":"CATALOG_FURNI_PURCHASE",
                "callback":onCatalogTrackingEvent
            }]), new ComponentDependency(new IIDHabboInventory(), null, false, [{
                "type":"HABBO_INVENTORY_TRACKING_EVENT_CLOSED",
                "callback":onInventoryTrackingEvent
            }, {
                "type":"HABBO_INVENTORY_TRACKING_EVENT_FURNI",
                "callback":onInventoryTrackingEvent
            }, {
                "type":"HABBO_INVENTORY_TRACKING_EVENT_POSTERS",
                "callback":onInventoryTrackingEvent
            }, {
                "type":"HABBO_INVENTORY_TRACKING_EVENT_BADGES",
                "callback":onInventoryTrackingEvent
            }, {
                "type":"HABBO_INVENTORY_TRACKING_EVENT_ACHIEVEMENTS",
                "callback":onInventoryTrackingEvent
            }, {
                "type":"HABBO_INVENTORY_TRACKING_EVENT_TRADING",
                "callback":onInventoryTrackingEvent
            }]), new ComponentDependency(new IIDHabboFriendList(), null, false, [{
                "type":"HABBO_FRIENDLIST_TRACKING_EVENT_CLOSED",
                "callback":onFriendlistTrackingEvent
            }, {
                "type":"HABBO_FRIENDLIST_TRACKING_EVENT_FRIENDS",
                "callback":onFriendlistTrackingEvent
            }, {
                "type":"HABBO_FRIENDLIST_TRACKING_EVENT_SEARCH",
                "callback":onFriendlistTrackingEvent
            }, {
                "type":"HABBO_FRIENDLIST_TRACKING_EVENT_REQUEST",
                "callback":onFriendlistTrackingEvent
            }, {
                "type":"HABBO_FRIENDLIST_TRACKING_EVENT_MINIMZED",
                "callback":onFriendlistTrackingEvent
            }]), new ComponentDependency(new IIDHabboHelp(), null, false, [{
                "type":"HABBO_HELP_TRACKING_EVENT_CLOSED",
                "callback":onHelpTrackingEvent
            }, {
                "type":"HABBO_HELP_TRACKING_EVENT_DEFAULT",
                "callback":onHelpTrackingEvent
            }]), new ComponentDependency(new IIDRoomEngine(), function (_arg_1:IRoomEngine):void
            {
                _roomEngine = _arg_1;
            }, false, [{
                "type":"RORAE_ROOM_AD_FURNI_CLICK",
                "callback":onRoomAdClick
            }, {
                "type":"REE_INITIALIZED",
                "callback":onRoomAction
            }, {
                "type":"REE_DISPOSED",
                "callback":onRoomAction
            }]), new ComponentDependency(new IIDHabboAdManager(), null, false, [{
                "type":"AE_ROOM_AD_SHOW",
                "callback":onRoomAdLoad
            }]), new ComponentDependency(new IIDHabboToolbar(), null, false, [{
                "type":"HTE_TOOLBAR_CLICK",
                "callback":onToolbarClick
            }])]));
        }

        override protected function initComponent():void
        {
            _SafeStr_3795 = new LatencyTracker(this);
            _SafeStr_3797 = new PerformanceTracker(this);
            _SafeStr_3799 = new FramerateTracker(this);
            _SafeStr_3803 = new LagWarningLogger(this);
            _SafeStr_3802 = new ToolbarClickTracker(this);
            _messageEvents = new Vector.<IMessageEvent>(0);
            addMessageEvent(new _SafeStr_459(onAuthOK));
            addMessageEvent(new _SafeStr_484(onRoomEnter));
            addMessageEvent(new _SafeStr_201(onAchievementNotification));
            addMessageEvent(new _SafeStr_834(onPingResponse));
            var _local_1:IEventDispatcher = _SafeStr_20(context).events;
            _local_1.addEventListener("HABBO_CONNECTION_EVENT_INIT", onConnectionEvent);
            _local_1.addEventListener("HABBO_CONNECTION_EVENT_ESTABLISHED", onConnectionEvent);
            _local_1.addEventListener("HABBO_CONNECTION_EVENT_HANDSHAKING", onConnectionEvent);
            _local_1.addEventListener("HABBO_CONNECTION_EVENT_HANDSHAKED", onConnectionEvent);
            _local_1.addEventListener("HABBO_CONNECTION_EVENT_HANDSHAKE_FAIL", onConnectionEvent);
            _local_1.addEventListener("HABBO_CONNECTION_EVENT_AUTHENTICATED", onConnectionEvent);
            _local_1.addEventListener("HHVE_START_LOAD", onHotelViewEvent);
            _local_1.addEventListener("HHVE_ERROR", onHotelViewEvent);
            _local_1.addEventListener("HHVE_LOADED", onHotelViewEvent);
        }

        private function addMessageEvent(_arg_1:IMessageEvent):void
        {
            _messageEvents.push(_communication.addHabboConnectionMessageEvent(_arg_1));
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_SafeStr_3793 == this)
            {
                _SafeStr_3793 = null;
            };
            removeUpdateReceiver(this);
            if (((!(_messageEvents == null)) && (!(_communication == null))))
            {
                for each (var _local_1:IMessageEvent in _messageEvents)
                {
                    _communication.removeHabboConnectionMessageEvent(_local_1);
                };
            };
            _SafeStr_3797 = null;
            _SafeStr_3799 = null;
            _SafeStr_3802 = null;
            if (_SafeStr_3795 != null)
            {
                _SafeStr_3795.dispose();
                _SafeStr_3795 = null;
            };
            if (_SafeStr_3796)
            {
                _SafeStr_3796.stop();
                _SafeStr_3796.removeEventListener("timer", onRoomActionTimerEvent);
                _SafeStr_3796 = null;
            };
            super.dispose();
        }

        private function setErrorContextFlag(_arg_1:uint, _arg_2:uint):void
        {
            _SafeStr_3794[_arg_2] = _arg_1;
        }

        private function onHotelViewEvent(_arg_1:Event):void
        {
            switch (_arg_1.type)
            {
                case "HHVE_START_LOAD":
                    trackLoginStep("client.init.hotelview.start");
                    return;
                case "HHVE_LOADED":
                    trackLoginStep("client.init.hotelview.ok");
                    return;
                case "HHVE_ERROR":
                    trackLoginStep("client.init.hotelview.fail");
                    return;
            };
        }

        private function onConnectionEvent(_arg_1:Event):void
        {
            switch (_arg_1.type)
            {
                case "HABBO_CONNECTION_EVENT_INIT":
                    trackLoginStep("client.init.socket.init");
                    break;
                case "HABBO_CONNECTION_EVENT_ESTABLISHED":
                    trackLoginStep("client.init.socket.ok", _communication.port);
                    break;
                case "HABBO_CONNECTION_EVENT_HANDSHAKING":
                    trackLoginStep("client.init.handshake.start");
                    break;
                case "HABBO_CONNECTION_EVENT_HANDSHAKE_FAIL":
                    trackLoginStep("client.init.handshake.fail");
                    break;
                case "HABBO_CONNECTION_EVENT_HANDSHAKED":
                    setErrorContextFlag(2, 0);
                    trackLoginStep("client.init.handshake.ok");
                    break;
                case "HABBO_CONNECTION_EVENT_AUTHENTICATED":
                    setErrorContextFlag(3, 0);
                    loadConversionTrackingFrame();
                    trackLoginStep("client.init.auth.ok");
            };
            _SafeStr_20(context).events.removeEventListener(_arg_1.type, onConnectionEvent);
        }

        private function onWindowTrackingEvent(_arg_1:Event):void
        {
            switch (_arg_1.type)
            {
                case "HABBO_WINDOW_TRACKING_EVENT_SLEEP":
                    setErrorContextFlag(0, 3);
                    return;
                case "HABBO_WINDOW_TRACKING_EVENT_RENDER":
                    setErrorContextFlag(1, 3);
                    return;
                case "HABBO_WINDOW_TRACKING_EVENT_INPUT":
                    setErrorContextFlag(2, 3);
                    return;
            };
        }

        private function onError(_arg_1:ErrorEvent):void
        {
            storeErrorDetails(_arg_1);
            if (_arg_1.critical)
            {
                _SafeStr_3515 = true;
            };
            logError(context.root.getLastErrorMessage());
        }

        private function storeErrorDetails(_arg_1:ErrorEvent):void
        {
            var _local_3:* = null;
            ErrorReportStorage.setParameter("is_fatal", _arg_1.critical.toString());
            ErrorReportStorage.setParameter("crash_time", new Date().getTime().toString());
            var _local_4:String = "";
            for each (var _local_2:uint in _SafeStr_3794)
            {
                _local_4 = (_local_4 + _local_2);
            };
            ErrorReportStorage.setParameter("error_ctx", _local_4);
            if (_SafeStr_3797 != null)
            {
                ErrorReportStorage.setParameter("flash_version", _SafeStr_3797.flashVersion);
                ErrorReportStorage.setParameter("avg_update", _SafeStr_3797.averageUpdateInterval);
            };
            ErrorReportStorage.setParameter("error_desc", _arg_1.message);
            ErrorReportStorage.setParameter("error_cat", _arg_1.category);
            if (_arg_1.error != null)
            {
                _local_3 = Exception.getChainedStackTrace(_arg_1.error);
                if (_local_3 != null)
                {
                    ErrorReportStorage.setParameter("error_data", _local_3);
                };
            };
            _communication.setMessageQueueErrorDebugData();
            ErrorReportStorage.addDebugData("Flash memory usage", (("Memory usage: " + Math.round((System.totalMemory / 0x100000))) + " MB"));
        }

        private function onNavigatorTrackingEvent(_arg_1:Event):void
        {
            switch (_arg_1.type)
            {
                case "HABBO_NAVIGATOR_TRACKING_EVENT_CLOSED":
                    setErrorContextFlag(0, 4);
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS":
                    setErrorContextFlag(1, 4);
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS":
                    setErrorContextFlag(2, 4);
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_ME":
                    setErrorContextFlag(3, 4);
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL":
                    setErrorContextFlag(4, 4);
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH":
                    setErrorContextFlag(5, 4);
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES":
                    legacyTrackGoogle("navigator", "my_favorites");
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS":
                    legacyTrackGoogle("navigator", "my_friends_rooms");
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY":
                    legacyTrackGoogle("navigator", "my_history");
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS":
                    legacyTrackGoogle("navigator", "my_rooms");
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS":
                    legacyTrackGoogle("navigator", "official_rooms");
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS":
                    legacyTrackGoogle("navigator", "popular_rooms");
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE":
                    legacyTrackGoogle("navigator", "rooms_where_my_friends_are");
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE":
                    legacyTrackGoogle("navigator", "highest_score");
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH":
                    legacyTrackGoogle("navigator", "tag_search");
                    return;
                case "HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH":
                    legacyTrackGoogle("navigator", "text_search");
                    return;
            };
        }

        private function onRoomSettingsTrackingEvent(_arg_1:Event):void
        {
            switch (_arg_1.type)
            {
                case "HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED":
                    setErrorContextFlag(0, 7);
                    return;
                case "HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT":
                    setErrorContextFlag(1, 7);
                    return;
                case "HABBO_ROOM_SETTINGS_TRACKING_EVENT_ADVANCED":
                    setErrorContextFlag(2, 7);
                    return;
            };
        }

        private function onInventoryTrackingEvent(_arg_1:Event):void
        {
            switch (_arg_1.type)
            {
                case "HABBO_INVENTORY_TRACKING_EVENT_CLOSED":
                    setErrorContextFlag(0, 5);
                    return;
                case "HABBO_INVENTORY_TRACKING_EVENT_FURNI":
                    setErrorContextFlag(1, 5);
                    return;
                case "HABBO_INVENTORY_TRACKING_EVENT_POSTERS":
                    setErrorContextFlag(2, 5);
                    return;
                case "HABBO_INVENTORY_TRACKING_EVENT_BADGES":
                    setErrorContextFlag(3, 5);
                    return;
                case "HABBO_INVENTORY_TRACKING_EVENT_ACHIEVEMENTS":
                    setErrorContextFlag(4, 5);
                    return;
                case "HABBO_INVENTORY_TRACKING_EVENT_TRADING":
                    setErrorContextFlag(5, 5);
                    return;
            };
        }

        private function onAchievementNotification(_arg_1:_SafeStr_201):void
        {
            var _local_2:_SafeStr_1189 = _arg_1.getParser();
            legacyTrackGoogle("achievement", "achievement", [_local_2.data.badgeCode]);
        }

        private function onCatalogPageOpened(_arg_1:CatalogPageOpenedEvent):void
        {
            legacyTrackGoogle("catalogue", "page", [_arg_1.pageLocalization]);
        }

        private function onCatalogTrackingEvent(_arg_1:Event):void
        {
            switch (_arg_1.type)
            {
                case "HABBO_CATALOG_TRACKING_EVENT_OPEN":
                    setErrorContextFlag(1, 9);
                    return;
                case "HABBO_CATALOG_TRACKING_EVENT_CLOSE":
                    setErrorContextFlag(0, 9);
                    return;
            };
        }

        private function onFriendlistTrackingEvent(_arg_1:Event):void
        {
            switch (_arg_1.type)
            {
                case "HABBO_FRIENDLIST_TRACKING_EVENT_CLOSED":
                    setErrorContextFlag(0, 6);
                    return;
                case "HABBO_FRIENDLIST_TRACKING_EVENT_FRIENDS":
                    setErrorContextFlag(1, 6);
                    return;
                case "HABBO_FRIENDLIST_TRACKING_EVENT_SEARCH":
                    setErrorContextFlag(2, 6);
                    return;
                case "HABBO_FRIENDLIST_TRACKING_EVENT_REQUEST":
                    setErrorContextFlag(3, 6);
                    return;
                case "HABBO_FRIENDLIST_TRACKING_EVENT_MINIMZED":
                    setErrorContextFlag(4, 6);
                    return;
            };
        }

        private function onHelpTrackingEvent(_arg_1:Event):void
        {
            switch (_arg_1.type)
            {
                case "HABBO_HELP_TRACKING_EVENT_CLOSED":
                    setErrorContextFlag(0, 10);
                    return;
                case "HABBO_HELP_TRACKING_EVENT_DEFAULT":
                    setErrorContextFlag(1, 10);
                    return;
            };
        }

        private function onAuthOK(_arg_1:IMessageEvent):void
        {
            legacyTrackGoogle("authentication", "authok");
        }

        private function onPingResponse(_arg_1:_SafeStr_834):void
        {
            if (_SafeStr_3795 != null)
            {
                _SafeStr_3795.onPingResponse(_arg_1);
            };
        }

        private function onRoomEnter(_arg_1:IMessageEvent):void
        {
            if (!_SafeStr_3798)
            {
                trackLoginStep("client.init.room.enter");
                _SafeStr_3798 = true;
            };
            var _local_2:_SafeStr_1254 = _SafeStr_484(_arg_1).getParser();
            ErrorReportStorage.setParameter("last_room", _local_2.guestRoomId);
            ErrorReportStorage.setParameter("in_room", "true");
            legacyTrackGoogle("navigator", "private", [_local_2.guestRoomId]);
        }

        private function onConfigurationComplete(_arg_1:Event):void
        {
            if (_SafeStr_3795 != null)
            {
                _SafeStr_3795.init();
            };
        }

        private function onRoomAdLoad(_arg_1:AdEvent):void
        {
            legacyTrackGoogle("room_ad", "show", [getAliasFromAdTechUrl(_arg_1.clickUrl)]);
        }

        private function onRoomAdClick(_arg_1:RoomObjectRoomAdEvent):void
        {
            legacyTrackGoogle("room_ad", "click", [getAliasFromAdTechUrl(_arg_1.clickUrl)]);
        }

        private function getAliasFromAdTechUrl(_arg_1:String):String
        {
            var _local_2:Array = _arg_1.match(/;alias=([^;]+)/);
            if (((!(_local_2 == null)) && (_local_2.length > 1)))
            {
                return (_local_2[1]);
            };
            return ("unknown");
        }

        private function onRoomAction(_arg_1:RoomEngineEvent):void
        {
            if (_arg_1.type == "REE_INITIALIZED")
            {
                if (!_SafeStr_3796)
                {
                    _SafeStr_3800 = _arg_1.roomId;
                    _SafeStr_3796 = new Timer(60000, 1);
                    _SafeStr_3796.addEventListener("timer", onRoomActionTimerEvent);
                    _SafeStr_3796.start();
                };
            }
            else
            {
                if (_arg_1.type == "REE_DISPOSED")
                {
                    if (_SafeStr_3796)
                    {
                        _SafeStr_3796.removeEventListener("timer", onRoomActionTimerEvent);
                        _SafeStr_3796.stop();
                        _SafeStr_3796 = null;
                        _SafeStr_3800 = -1;
                    };
                };
            };
        }

        private function onRoomActionTimerEvent(_arg_1:TimerEvent):void
        {
            var _local_2:* = null;
            var _local_3:int;
            var _local_4:int;
            if (((((!(disposed)) && (!(_SafeStr_3515))) && (!(_communication == null))) && (_SafeStr_3799)))
            {
                _local_2 = null;
                if (_roomEngine != null)
                {
                    _local_3 = _roomEngine.getRoomObjectCount(_roomEngine.activeRoomId, 100);
                    _local_4 = (_roomEngine.getRoomObjectCount(_roomEngine.activeRoomId, 10) + _roomEngine.getRoomObjectCount(_roomEngine.activeRoomId, 20));
                    _local_2 = ((("Avatars: " + _local_3) + ", Objects: ") + _local_4);
                };
                trackEventLog("ClientPerformance", _SafeStr_3799.frameRate, "fps", _local_2, _SafeStr_3800);
                _SafeStr_3801++;
            };
        }

        private function onToolbarClick(_arg_1:HabboToolbarEvent):void
        {
            if (_SafeStr_3802)
            {
                _SafeStr_3802.track(_arg_1.iconName);
            };
        }

        private function onZoomToggle(_arg_1:HabboToolbarEvent):void
        {
            if (_SafeStr_3802)
            {
                _SafeStr_3802.track(_arg_1.type);
            };
        }

        public function legacyTrackGoogle(_arg_1:String, _arg_2:String, _arg_3:Array=null):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.legacyTrack", _arg_1, _arg_2, ((_arg_3 == null) ? [] : _arg_3));
                }
                else
                {
                    _SafeStr_14.log("ExternalInterface is not available, tracking is disabled");
                };
            }
            catch(e:Error)
            {
            };
        }

        public function trackGoogle(_arg_1:String, _arg_2:String, _arg_3:int=-1):void
        {
            _SafeStr_14.log((((((("trackGoogle(" + _arg_1) + ", ") + _arg_2) + ", ") + _arg_3) + ")"));
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.track", _arg_1, _arg_2, _arg_3);
                }
                else
                {
                    _SafeStr_14.log("ExternalInterface is not available, tracking is disabled");
                };
            }
            catch(e:Error)
            {
            };
        }

        private function loadConversionTrackingFrame():void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.loadConversionTrackingFrame");
                }
                else
                {
                    _SafeStr_14.log("ExternalInterface is not available!");
                };
            }
            catch(e:Error)
            {
            };
        }

        public function trackLoginStep(_arg_1:String, _arg_2:String=null):void
        {
            _SafeStr_14.log(("* Track Login Step: " + _arg_1));
            if (!getBoolean("processlog.enabled"))
            {
                return;
            };
            try
            {
                if (ExternalInterface.available)
                {
                    if (_arg_2 != null)
                    {
                        ExternalInterface.call("FlashExternalInterface.logLoginStep", _arg_1, _arg_2);
                    }
                    else
                    {
                        ExternalInterface.call("FlashExternalInterface.logLoginStep", _arg_1);
                    };
                }
                else
                {
                    _SafeStr_14.log("ExternalInterface is not available, tracking is disabled");
                };
            }
            catch(e:Error)
            {
            };
        }

        public function trackEventLog(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String="", _arg_5:int=0):void
        {
            if ((((!(_communication == null)) && (!(_communication.connection == null))) && (_communication.connection.connected)))
            {
                _communication.connection.send(new _SafeStr_895(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5));
            };
        }

        public function trackEventLogOncePerSession(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String="", _arg_5:int=0):void
        {
            var _local_7:uint;
            var _local_8:String = ((_arg_1 + _arg_2) + _arg_3);
            var _local_6:Boolean;
            _local_7 = 0;
            while (_local_7 < onceTrackedEvents.length)
            {
                if (onceTrackedEvents[_local_7] == _local_8)
                {
                    _local_6 = true;
                    break;
                };
                _local_7++;
            };
            if (!_local_6)
            {
                trackEventLog(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
                onceTrackedEvents.push(_local_8);
            };
        }

        public function trackTalentTrackOpen(_arg_1:String, _arg_2:String):void
        {
            trackEventLog("Talent", _arg_1, "talent.open", _arg_2);
        }

        public function logError(_arg_1:String):void
        {
            _SafeStr_14.log((("logError(" + _arg_1) + ")"));
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call("FlashExternalInterface.logError", _arg_1);
                }
                else
                {
                    _SafeStr_14.log("ExternalInterface is not available, tracking is disabled");
                };
            }
            catch(e:Error)
            {
            };
        }

        public function chatLagDetected(_arg_1:int):void
        {
            _SafeStr_3803.chatLagDetected(_arg_1);
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:int = getTimer();
            if (((_currentTime > -1) && (_local_2 < _currentTime)))
            {
                _SafeStr_3804++;
                ErrorReportStorage.addDebugData("Invalid time counter", ("Invalid times: " + _SafeStr_3804));
            };
            if (((_currentTime > -1) && ((_local_2 - _currentTime) > 15000)))
            {
                _SafeStr_3805++;
                ErrorReportStorage.addDebugData("Time leap counter", ("Time leaps: " + _SafeStr_3805));
            };
            _currentTime = _local_2;
            if (_SafeStr_3797 != null)
            {
                _SafeStr_3797.update(_arg_1, _currentTime);
            };
            if (_SafeStr_3795 != null)
            {
                _SafeStr_3795.update(_arg_1, _currentTime);
            };
            if (_SafeStr_3799 != null)
            {
                _SafeStr_3799.trackUpdate(_arg_1, _currentTime);
            };
            if (_SafeStr_3803 != null)
            {
                _SafeStr_3803.update(_currentTime);
            };
        }

        public function get communication():_SafeStr_25
        {
            return (_communication);
        }

        public function send(_arg_1:IMessageComposer):void
        {
            if ((((!(_communication == null)) && (!(_communication.connection == null))) && (_communication.connection.connected)))
            {
                _communication.connection.send(_arg_1);
            };
        }


    }
}//package com.sulake.habbo.tracking

// _SafeStr_1189 = "_-9l" (String#22603, DoABC#4)
// _SafeStr_1254 = "_-i1B" (String#10192, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_201 = "_-w1t" (String#4981, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3515 = "_-d1V" (String#16242, DoABC#4)
// _SafeStr_3793 = "_-z1c" (String#5439, DoABC#4)
// _SafeStr_3794 = "_-j1C" (String#12106, DoABC#4)
// _SafeStr_3795 = "_-LX" (String#5623, DoABC#4)
// _SafeStr_3796 = "_-yS" (String#4677, DoABC#4)
// _SafeStr_3797 = "_-c1D" (String#7773, DoABC#4)
// _SafeStr_3798 = "_-k1j" (String#17827, DoABC#4)
// _SafeStr_3799 = "_-v8" (String#8629, DoABC#4)
// _SafeStr_3800 = "_-lW" (String#13596, DoABC#4)
// _SafeStr_3801 = "_-q1h" (String#21198, DoABC#4)
// _SafeStr_3802 = "_-Nx" (String#7928, DoABC#4)
// _SafeStr_3803 = "_-n1F" (String#12113, DoABC#4)
// _SafeStr_3804 = "_-Lp" (String#13862, DoABC#4)
// _SafeStr_3805 = "_-qW" (String#15694, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_459 = "_-y9" (String#18590, DoABC#4)
// _SafeStr_484 = "_-4N" (String#2464, DoABC#4)
// _SafeStr_834 = "_-l14" (String#21611, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)


