// by nota

//com.sulake.habbo.nux.HabboNuxDialogs

package com.sulake.habbo.nux
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.navigator._SafeStr_1696;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.core.communication.connection.IConnection;
    import flash.utils.Timer;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import __AS3__.vec.Vector;
    import _-Y12._SafeStr_287;
    import _-Y12._SafeStr_656;
    import _-T7._SafeStr_435;
    import com.sulake.habbo.window.utils._SafeStr_3198;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-IS._SafeStr_188;
    import _-IS._SafeStr_1153;
    import _-rS._SafeStr_1138;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.core.runtime._SafeStr_19;
    import _-Y12._SafeStr_1606;
    import _-qv._SafeStr_895;
    import flash.events.TimerEvent;

    public class HabboNuxDialogs extends Component implements ILinkEventTracker 
    {

        protected var _communicationManager:IHabboCommunicationManager;
        protected var _navigator:_SafeStr_1696;
        protected var _windowManager:_SafeStr_1695;
        protected var _localizationManager:_SafeStr_18;
        protected var _catalog:IHabboCatalog;
        protected var _sessionDataManager:ISessionDataManager;
        protected var _roomSessionManager:IRoomSessionManager;
        private var _connection:IConnection;
        private var _SafeStr_5127:NuxOfferOldUserView;
        private var _SafeStr_5128:NuxGiftSelectionView;
        private var _SafeStr_5129:NuxNoobRoomOfferView;
        private var _SafeStr_5126:Timer;

        public function HabboNuxDialogs(_arg_1:_SafeStr_31, _arg_2:uint, _arg_3:IAssetLibrary)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:IHabboCommunicationManager):void
            {
                _communicationManager = _arg_1;
            }, true), new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDHabboNavigator(), function (_arg_1:_SafeStr_1696):void
            {
                _navigator = _arg_1;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localizationManager = _arg_1;
            }), new ComponentDependency(new IIDHabboCatalog(), function (_arg_1:IHabboCatalog):void
            {
                _catalog = _arg_1;
            }), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (_arg_1:IRoomSessionManager):void
            {
                _roomSessionManager = _arg_1;
            }, false, [{
                "type":"RSE_STARTED",
                "callback":onRoomSessionEvent
            }, {
                "type":"RSE_ENDED",
                "callback":onRoomSessionEvent
            }])]));
        }

        override public function dispose():void
        {
            context.removeLinkEventTracker(this);
            if (_windowManager)
            {
                _windowManager = null;
            };
            destroyGiftSelectionView();
            destroyNoobRoomOfferView();
            destroyNuxOfferView();
            super.dispose();
        }

        override protected function initComponent():void
        {
            _connection = _communicationManager.connection;
            if (_connection)
            {
                _connection.addMessageEvent(new _SafeStr_287(onNewUserExperienceNotCompleteMessage));
                _connection.addMessageEvent(new _SafeStr_656(onNewUserExperienceGiftOfferMessage));
            };
            context.addLinkEventTracker(this);
        }

        public function get linkPattern():String
        {
            return ("nux/");
        }

        public function linkReceived(_arg_1:String):void
        {
            var _local_2:Array = _arg_1.split("/");
            if (_local_2.length < 2)
            {
                return;
            };
            switch (_local_2[1])
            {
                case "lobbyoffer":
                    if (((_local_2.length > 2) && (_local_2[2] == "show")))
                    {
                        createNoobRoomOfferView();
                    }
                    else
                    {
                        destroyNoobRoomOfferView();
                    };
                    return;
                default:
                    _SafeStr_14.log(("HabboNuxDialogs unknown link-type received: " + _local_2[1]));
                    return;
            };
        }

        public function onVerify():void
        {
            _connection.send(new _SafeStr_435(0));
        }

        public function onReject():void
        {
            _windowManager.confirm("${phone.number.never.again.confirm.title}", "${phone.number.never.again.confirm.text}", 0, onNeverAgainConfirmClose);
        }

        private function onNeverAgainConfirmClose(_arg_1:_SafeStr_3198, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
            if (((_arg_2.type == "WE_OK") && (_connection)))
            {
                destroyNuxOfferView();
                _connection.send(new _SafeStr_435(2));
            };
        }

        public function onSendGetGifts(_arg_1:Vector.<_SafeStr_1153>):void
        {
            destroyGiftSelectionView();
            _connection.send(new _SafeStr_188(_arg_1));
        }

        private function onNewUserExperienceNotCompleteMessage(_arg_1:_SafeStr_287):void
        {
            createNuxOfferView();
        }

        private function onNewUserExperienceGiftOfferMessage(_arg_1:_SafeStr_656):void
        {
            var _local_2:_SafeStr_1138 = _arg_1.getParser();
            createGiftSelectionView(_local_2.giftOptions);
        }

        private function onRoomSessionEvent(_arg_1:RoomSessionEvent):void
        {
            var _local_2:uint;
            if (((!(getBoolean("nux.lobbies.enabled"))) || (!(_sessionDataManager.isRealNoob))))
            {
                return;
            };
            if ((((_arg_1.type == "RSE_STARTED") && (_arg_1.session)) && (_arg_1.session.roomId == _navigator.homeRoomId)))
            {
                _local_2 = (getInteger("nux.noob.lobby.popup.delay", 70) * 1000);
                _SafeStr_5126 = new Timer(_local_2, 1);
                _SafeStr_5126.addEventListener("timer", createNoobRoomOfferView);
                _SafeStr_5126.start();
            }
            else
            {
                destroyNoobRoomOfferView();
            };
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get localizationManager():_SafeStr_18
        {
            return (_localizationManager);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }

        public function get configuration():_SafeStr_19
        {
            return (this);
        }

        public function get catalog():IHabboCatalog
        {
            return (_catalog);
        }

        private function createNuxOfferView():void
        {
            destroyNuxOfferView();
            _SafeStr_5127 = new NuxOfferOldUserView(this);
        }

        public function destroyNuxOfferView():void
        {
            if (_SafeStr_5127)
            {
                _SafeStr_5127.dispose();
                _SafeStr_5127 = null;
            };
        }

        private function createGiftSelectionView(_arg_1:Vector.<_SafeStr_1606>):void
        {
            destroyGiftSelectionView();
            _SafeStr_5128 = new NuxGiftSelectionView(this, _arg_1);
        }

        private function destroyGiftSelectionView():void
        {
            if (_SafeStr_5128)
            {
                _SafeStr_5128.dispose();
                _SafeStr_5128 = null;
            };
        }

        private function startNoobRoomOfferTimer():void
        {
        }

        private function createNoobRoomOfferView(_arg_1:TimerEvent=null):void
        {
            if (((!(getBoolean("nux.lobbies.enabled"))) || (!(_sessionDataManager.isRealNoob))))
            {
                return;
            };
            destroyNoobRoomOfferView();
            _SafeStr_5129 = new NuxNoobRoomOfferView(this);
            _connection.send(new _SafeStr_895("NewNavigator", "nux.offer.lobby", "nux.offer.lobby"));
        }

        public function destroyNoobRoomOfferView():void
        {
            if (_SafeStr_5126)
            {
                _SafeStr_5126.reset();
                _SafeStr_5126 = null;
            };
            if (_SafeStr_5129)
            {
                _SafeStr_5129.dispose();
                _SafeStr_5129 = null;
            };
        }


    }
}//package com.sulake.habbo.nux

// _SafeStr_1138 = "_-Mj" (String#39844, DoABC#4)
// _SafeStr_1153 = "_-o1v" (String#12467, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1606 = "_-22U" (String#14962, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_188 = "_-3y" (String#28997, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_287 = "_-T1o" (String#26085, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3198 = "_-S1O" (String#2743, DoABC#4)
// _SafeStr_435 = "_-dd" (String#12040, DoABC#4)
// _SafeStr_5126 = "_-UT" (String#4274, DoABC#4)
// _SafeStr_5127 = "_-22l" (String#10843, DoABC#4)
// _SafeStr_5128 = "_-i1J" (String#10701, DoABC#4)
// _SafeStr_5129 = "_-IE" (String#11382, DoABC#4)
// _SafeStr_656 = "_-2m" (String#24371, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)


