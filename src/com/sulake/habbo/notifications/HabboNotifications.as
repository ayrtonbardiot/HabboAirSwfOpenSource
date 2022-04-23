// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.notifications.HabboNotifications

package com.sulake.habbo.notifications
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.inventory._SafeStr_1708;
    import com.sulake.habbo.friendlist._SafeStr_1874;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.notifications.utils.ProductImageUtility;
    import com.sulake.habbo.notifications.utils.PetImageUtility;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.notifications.feed.NotificationController;
    import com.sulake.habbo.notifications.singular.SingularNotificationController;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboInventory;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.iid.IIDHabboHelp;
    import __AS3__.vec.Vector;
    import _-XO._SafeStr_341;
    import com.sulake.core.utils._SafeStr_24;
    import adobe.serialization.json.JSONDecoder;
    import com.sulake.habbo.catalog.event.CatalogEvent;

    public class HabboNotifications extends _SafeStr_20 implements _SafeStr_2081 
    {

        private var _communication:_SafeStr_25;
        private var _sessionDataManager:ISessionDataManager;
        private var _windowManager:_SafeStr_1695;
        private var _localization:_SafeStr_18;
        private var _inventory:_SafeStr_1708;
        private var _friendList:_SafeStr_1874;
        private var _roomEngine:IRoomEngine;
        private var _catalog:IHabboCatalog;
        private var _toolBar:IHabboToolbar;
        private var _SafeStr_3961:ProductImageUtility;
        private var _SafeStr_3962:PetImageUtility;
        private var _roomSessionManager:IRoomSessionManager;
        private var _habboHelp:IHabboHelp;
        private var _SafeStr_3959:NotificationController;
        private var _SafeStr_3958:SingularNotificationController;
        private var _SafeStr_3963:_SafeStr_3118;
        private var _SafeStr_3960:Boolean;

        public function HabboNotifications(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_3960 = false;
        }

        public function get assetLibrary():_SafeStr_21
        {
            return (assets);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get localization():_SafeStr_18
        {
            return (_localization);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return (_roomSessionManager);
        }

        public function get catalog():IHabboCatalog
        {
            return (_catalog);
        }

        public function get toolBar():IHabboToolbar
        {
            return (_toolBar);
        }

        public function get habboHelp():IHabboHelp
        {
            return (_habboHelp);
        }

        public function get singularController():SingularNotificationController
        {
            return (_SafeStr_3958);
        }

        public function get feedController():NotificationController
        {
            return (_SafeStr_3959);
        }

        public function get disabled():Boolean
        {
            return (_SafeStr_3960);
        }

        public function set disabled(_arg_1:Boolean):void
        {
            _SafeStr_3960 = _arg_1;
        }

        public function get productImageUtility():ProductImageUtility
        {
            if (((_roomEngine == null) || (_inventory == null)))
            {
                return (null);
            };
            if (_SafeStr_3961 == null)
            {
                _SafeStr_3961 = new ProductImageUtility(_roomEngine, _inventory);
            };
            return (_SafeStr_3961);
        }

        public function get petImageUtility():PetImageUtility
        {
            if (_roomEngine == null)
            {
                return (null);
            };
            if (_SafeStr_3962 == null)
            {
                _SafeStr_3962 = new PetImageUtility(_roomEngine);
            };
            return (_SafeStr_3962);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboInventory(), function (_arg_1:_SafeStr_1708):void
            {
                _inventory = _arg_1;
            }, false), new ComponentDependency(new IIDHabboFriendList(), function (_arg_1:_SafeStr_1874):void
            {
                _friendList = _arg_1;
            }, false), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:_SafeStr_25):void
            {
                _communication = _arg_1;
            }), new ComponentDependency(new IIDRoomEngine(), function (_arg_1:IRoomEngine):void
            {
                _roomEngine = _arg_1;
            }, false), new ComponentDependency(new IIDHabboCatalog(), function (_arg_1:IHabboCatalog):void
            {
                _catalog = _arg_1;
            }, false, [{
                "type":"CATALOG_BUILDER_MEMBERSHIP_EXPIRED",
                "callback":onBuilderMembershipExpired
            }, {
                "type":"CATALOG_BUILDER_MEMBERSHIP_IN_GRACE",
                "callback":onBuilderMembershipInGrace
            }]), new ComponentDependency(new IIDHabboToolbar(), function (_arg_1:IHabboToolbar):void
            {
                _toolBar = _arg_1;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localization = _arg_1;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (_arg_1:IRoomSessionManager):void
            {
                _roomSessionManager = _arg_1;
            }, false), new ComponentDependency(new IIDHabboHelp(), function (_arg_1:IHabboHelp):void
            {
                _habboHelp = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            _SafeStr_3958 = new SingularNotificationController(this);
            _SafeStr_3963 = new _SafeStr_3118(this, _communication);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_SafeStr_3963 != null)
            {
                _SafeStr_3963.dispose();
                _SafeStr_3963 = null;
            };
            if (_SafeStr_3959 != null)
            {
                _SafeStr_3959.dispose();
                _SafeStr_3959 = null;
            };
            if (_SafeStr_3962 != null)
            {
                _SafeStr_3962.dispose();
                _SafeStr_3962 = null;
            };
            if (_SafeStr_3961 != null)
            {
                _SafeStr_3961.dispose();
                _SafeStr_3961 = null;
            };
            super.dispose();
        }

        public function activate():void
        {
            if (_SafeStr_3959 != null)
            {
                _SafeStr_3959.setFeedEnabled(true);
            };
            _communication.connection.send(new _SafeStr_341());
        }

        public function addSongPlayingNotification(_arg_1:String, _arg_2:String):void
        {
            _SafeStr_3958.addSongPlayingNotification(_arg_1, _arg_2);
        }

        public function showNotification(_arg_1:String, _arg_2:_SafeStr_24=null):void
        {
            var _local_7:* = null;
            var _local_9:* = null;
            var _local_6:* = null;
            var _local_3:Boolean;
            var _local_5:* = null;
            if (_arg_2 == null)
            {
                _arg_2 = new _SafeStr_24();
            };
            var _local_4:String = ("notification." + _arg_1);
            if (propertyExists(_local_4))
            {
                _local_7 = new JSONDecoder(getProperty(_local_4), true).getValue();
                for (var _local_8:String in _local_7)
                {
                    _arg_2[_local_8] = _local_7[_local_8];
                };
            };
            if (_arg_2["display"] == "BUBBLE")
            {
                _local_9 = getNotificationPart(_arg_2, _arg_1, "message", true);
                _local_6 = getNotificationPart(_arg_2, _arg_1, "linkUrl", false);
                _local_3 = ((!(_local_6 == null)) && (_local_6.substr(0, 6) == "event:"));
                _local_5 = getNotificationImageUrl(_arg_2, _arg_1);
                _SafeStr_3958.addItem(_local_9, "info", null, _local_5, null, ((_local_3) ? _local_6.substr(6) : _local_6));
            }
            else
            {
                new NotificationPopup(this, _arg_1, _arg_2);
            };
        }

        public function getNotificationPart(_arg_1:_SafeStr_24, _arg_2:String, _arg_3:String, _arg_4:Boolean):String
        {
            var _local_5:* = null;
            if (_arg_1.hasKey(_arg_3))
            {
                return (_arg_1.getValue(_arg_3));
            };
            _local_5 = ["notification", _arg_2, _arg_3].join(".");
            if (((localization.hasLocalization(_local_5)) || (_arg_4)))
            {
                return (localization.getLocalizationWithParamMap(_local_5, _local_5, _arg_1));
            };
            return (null);
        }

        public function getNotificationImageUrl(_arg_1:_SafeStr_24, _arg_2:String):String
        {
            var _local_3:String = _arg_1.getValue("image");
            if (_local_3 == null)
            {
                _local_3 = (("${image.library.url}notifications/" + _arg_2.replace(/\./g, "_")) + ".png");
            };
            return (_local_3);
        }

        private function onBuilderMembershipInGrace(_arg_1:CatalogEvent):void
        {
            showNotification("builders_club.membership_in_grace", null);
        }

        private function onBuilderMembershipExpired(_arg_1:CatalogEvent):void
        {
            showNotification("builders_club.membership_expired", null);
        }

        public function createLinkEvent(_arg_1:String):void
        {
            context.createLinkEvent(_arg_1);
        }


    }
}//package com.sulake.habbo.notifications

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1708 = "_-Nb" (String#2308, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_2081 = "_-TA" (String#4559, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3118 = "_-wi" (String#2138, DoABC#4)
// _SafeStr_341 = "_-Z1U" (String#31179, DoABC#4)
// _SafeStr_3958 = "_-78" (String#12836, DoABC#4)
// _SafeStr_3959 = "_-ML" (String#9122, DoABC#4)
// _SafeStr_3960 = "_-h1m" (String#4565, DoABC#4)
// _SafeStr_3961 = "_-11t" (String#7923, DoABC#4)
// _SafeStr_3962 = "_-PY" (String#7938, DoABC#4)
// _SafeStr_3963 = "_-C15" (String#11146, DoABC#4)


