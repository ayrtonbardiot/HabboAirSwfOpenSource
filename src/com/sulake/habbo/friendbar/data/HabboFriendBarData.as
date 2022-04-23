// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.data.HabboFriendBarData

package com.sulake.habbo.friendbar.data
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.habbo.communication._SafeStr_25;
    import com.sulake.habbo.friendlist._SafeStr_1874;
    import com.sulake.habbo.messenger._SafeStr_1700;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDHabboMessenger;
    import com.sulake.iid.IIDHabboTracking;
    import __AS3__.vec.Vector;
    import _-JS._SafeStr_575;
    import _-JS._SafeStr_576;
    import _-JS._SafeStr_726;
    import _-JS._SafeStr_230;
    import _-JS._SafeStr_189;
    import _-JS._SafeStr_373;
    import _-JS._SafeStr_955;
    import _-JS._SafeStr_826;
    import _-JS._SafeStr_404;
    import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
    import _-XO._SafeStr_313;
    import _-XO._SafeStr_197;
    import _-XO._SafeStr_982;
    import com.sulake.habbo.friendbar.events.FriendRequestUpdateEvent;
    import _-Po._SafeStr_428;
    import _-qv._SafeStr_895;
    import com.sulake.habbo.friendbar.events.NewMessageEvent;
    import _-Po._SafeStr_394;
    import com.sulake.habbo.utils.WindowToggle;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-wm._SafeStr_1097;
    import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
    import _-JS._SafeStr_1649;
    import com.sulake.habbo.friendlist.events.FriendRequestEvent;
    import _-wm._SafeStr_1405;
    import com.sulake.habbo.friendbar.events.ActiveConversationsCountEvent;
    import com.sulake.habbo.messenger.events.ActiveConversationEvent;
    import _-wm._SafeStr_1112;
    import _-wm._SafeStr_1330;
    import com.sulake.habbo.friendbar.events.NotificationEvent;
    import _-JS._SafeStr_1600;

    public class HabboFriendBarData extends _SafeStr_20 implements _SafeStr_3134 
    {

        private static const SHOW_OFFLINE_FRIENDS:Boolean = false;
        private static const SORT_ALPHABETICALLY:Boolean = false;
        private static const TRACKING_EVENT_CATEGORY:String = "Navigation";
        private static const TRACKING_EVENT_TYPE:String = "Friend Bar";
        private static const TRACKING_EVENT_ACTION_VISIT:String = "go.friendbar";
        private static const TRACKING_EVENT_ACTION_CHAT:String = "chat_btn_click";
        private static const TRACKING_EVENT_ACTION_FIND_FRIENDS:String = "find_friends_btn_click";
        public static const TRACKING_EVENT_ACTION_PLAY_SNOWSTORM_TAB:String = "play_snowstorm_tab_click";
        public static const TRACKING_EVENT_ACTION_PLAY_SNOWSTORM_BUTTON:String = "play_snowstorm_btn_click";
        private static const _SafeStr_8544:String = "Toolbar";
        private static const _SafeStr_8545:String = "open";
        private static const _SafeStr_8546:String = "close";
        private static const LEGACY_TRACKING_EVENT_TYPE_FRIENDLIST:String = "FRIENDLIST";
        private static const LEGACY_TRACKING_EVENT_TYPE_MESSENGER:String = "MESSENGER";

        private var _habboCommunicationManager:_SafeStr_25;
        private var _habboFriendListComponent:_SafeStr_1874;
        private var _habboMessengerComponent:_SafeStr_1700;
        private var _tracking:_SafeStr_1704;
        private var _SafeStr_4208:Array;
        private var _SafeStr_4207:_SafeStr_24;
        private var _SafeStr_3926:Array;
        private var _SafeStr_4209:int;

        public function HabboFriendBarData(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_4208 = [];
            _SafeStr_4207 = new _SafeStr_24();
            _SafeStr_3926 = [];
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboConfigurationManager(), null), new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:_SafeStr_25):void
            {
                _habboCommunicationManager = _arg_1;
            }), new ComponentDependency(new IIDHabboFriendList(), function (_arg_1:_SafeStr_1874):void
            {
                _habboFriendListComponent = _arg_1;
            }), new ComponentDependency(new IIDHabboMessenger(), function (_arg_1:_SafeStr_1700):void
            {
                _habboMessengerComponent = _arg_1;
            }), new ComponentDependency(new IIDHabboTracking(), function (_arg_1:_SafeStr_1704):void
            {
                _tracking = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            _habboCommunicationManager.addHabboConnectionMessageEvent(new _SafeStr_575(onNewConsoleMessage));
            _habboCommunicationManager.addHabboConnectionMessageEvent(new _SafeStr_576(onFindFriendProcessResult));
            _habboCommunicationManager.addHabboConnectionMessageEvent(new _SafeStr_726(onMessengerInitialized));
            _habboCommunicationManager.addHabboConnectionMessageEvent(new _SafeStr_230(onNewFriendRequest));
            _habboCommunicationManager.addHabboConnectionMessageEvent(new _SafeStr_189(onRoomInvite));
            _habboCommunicationManager.addHabboConnectionMessageEvent(new _SafeStr_373(onFriendsListFragment));
            _habboCommunicationManager.addHabboConnectionMessageEvent(new _SafeStr_955(onFriendNotification));
            _habboCommunicationManager.addHabboConnectionMessageEvent(new _SafeStr_826(onFriendRequestList));
            _habboCommunicationManager.addHabboConnectionMessageEvent(new _SafeStr_404(onFriendListUpdate));
            _habboFriendListComponent.events.addEventListener("FRE_ACCEPTED", onFriendRequestEvent);
            _habboFriendListComponent.events.addEventListener("FRE_DECLINED", onFriendRequestEvent);
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (((!(_habboFriendListComponent == null)) && (!(_habboFriendListComponent.disposed))))
                {
                    _habboFriendListComponent.events.removeEventListener("FRE_ACCEPTED", onFriendRequestEvent);
                    _habboFriendListComponent.events.removeEventListener("FRE_DECLINED", onFriendRequestEvent);
                };
                _SafeStr_4208 = null;
                _SafeStr_4207.dispose();
                _SafeStr_4207 = null;
                _SafeStr_3926 = null;
                super.dispose();
            };
        }

        public function get numFriends():int
        {
            return (_SafeStr_4208.length);
        }

        public function getFriendAt(_arg_1:int):_SafeStr_3377
        {
            return (_SafeStr_4208[_arg_1]);
        }

        public function getFriendByID(_arg_1:int):_SafeStr_3377
        {
            return (_SafeStr_4207.getValue(_arg_1));
        }

        public function getFriendByName(_arg_1:String):_SafeStr_3377
        {
            for each (var _local_2:FriendEntity in _SafeStr_4208)
            {
                if (_local_2.name == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function setFriendAt(_arg_1:_SafeStr_3377, _arg_2:int):void
        {
            var _local_3:int = _SafeStr_4208.indexOf(_arg_1);
            if (((_local_3 > -1) && (!(_local_3 == _arg_2))))
            {
                _SafeStr_4208.splice(_local_3, 1);
                _SafeStr_4208.splice(_arg_2, 0, _arg_1);
                events.dispatchEvent(new FriendBarUpdateEvent());
            };
        }

        public function get numFriendRequests():int
        {
            return ((_SafeStr_3926) ? _SafeStr_3926.length : 0);
        }

        public function getFriendRequestAt(_arg_1:int):_SafeStr_3367
        {
            return ((_SafeStr_3926) ? _SafeStr_3926[_arg_1] : null);
        }

        public function getFriendRequestByID(_arg_1:int):_SafeStr_3367
        {
            if (_SafeStr_3926)
            {
                for each (var _local_2:_SafeStr_3367 in _SafeStr_3926)
                {
                    if (_local_2.id == _arg_1)
                    {
                        return (_local_2);
                    };
                };
            };
            return (null);
        }

        public function getFriendRequestByName(_arg_1:String):_SafeStr_3367
        {
            if (_SafeStr_3926)
            {
                for each (var _local_2:_SafeStr_3367 in _SafeStr_3926)
                {
                    if (_local_2.name == _arg_1)
                    {
                        return (_local_2);
                    };
                };
            };
            return (null);
        }

        public function getFriendRequestList():Array
        {
            return (_SafeStr_3926);
        }

        public function acceptFriendRequest(_arg_1:int):void
        {
            removeFriendRequest(_arg_1);
            if (_habboFriendListComponent)
            {
                if (!_habboFriendListComponent.disposed)
                {
                    _habboFriendListComponent.acceptFriendRequest(_arg_1);
                };
            };
        }

        public function showProfile(_arg_1:int):void
        {
            if (_habboCommunicationManager)
            {
                if (_arg_1 > 0)
                {
                    _habboCommunicationManager.connection.send(new _SafeStr_313(_arg_1));
                }
                else
                {
                    _habboCommunicationManager.connection.send(new _SafeStr_197(Math.abs(_arg_1), true));
                };
            };
        }

        public function showProfileByName(_arg_1:String):void
        {
            if (_habboCommunicationManager)
            {
                _habboCommunicationManager.connection.send(new _SafeStr_982(_arg_1));
            };
        }

        public function acceptAllFriendRequests():void
        {
            _SafeStr_3926 = [];
            _habboFriendListComponent.acceptAllFriendRequests();
            events.dispatchEvent(new FriendRequestUpdateEvent());
        }

        public function declineFriendRequest(_arg_1:int):void
        {
            removeFriendRequest(_arg_1);
            if (_habboFriendListComponent)
            {
                if (!_habboFriendListComponent.disposed)
                {
                    _habboFriendListComponent.declineFriendRequest(_arg_1);
                };
            };
        }

        public function declineAllFriendRequests():void
        {
            _SafeStr_3926 = [];
            _habboFriendListComponent.declineAllFriendRequests();
            events.dispatchEvent(new FriendRequestUpdateEvent());
        }

        private function removeFriendRequest(_arg_1:int):void
        {
            if (_SafeStr_3926)
            {
                for each (var _local_2:FriendRequest in _SafeStr_3926)
                {
                    if (_local_2.id == _arg_1)
                    {
                        _SafeStr_3926.splice(_SafeStr_3926.indexOf(_local_2), 1);
                        events.dispatchEvent(new FriendRequestUpdateEvent());
                        return;
                    };
                };
            };
        }

        public function followToRoom(_arg_1:int):void
        {
            if (_habboCommunicationManager)
            {
                _habboCommunicationManager.connection.send(new _SafeStr_428(_arg_1));
                _habboCommunicationManager.connection.send(new _SafeStr_895("Navigation", "Friend Bar", "go.friendbar"));
            };
        }

        public function startConversation(_arg_1:int):void
        {
            if (_habboMessengerComponent)
            {
                _habboMessengerComponent.startConversation(_arg_1);
                events.dispatchEvent(new NewMessageEvent(false, _arg_1));
                if (_habboCommunicationManager)
                {
                    _habboCommunicationManager.connection.send(new _SafeStr_895("Navigation", "Friend Bar", "chat_btn_click"));
                };
            };
        }

        public function findNewFriends():void
        {
            if (_habboCommunicationManager)
            {
                _habboCommunicationManager.connection.send(new _SafeStr_394());
                _habboCommunicationManager.connection.send(new _SafeStr_895("Navigation", "Friend Bar", "find_friends_btn_click"));
            };
        }

        public function openUserTextSearch():void
        {
            if (_habboFriendListComponent.currentTabId() != 3)
            {
                _habboFriendListComponent.openFriendSearch();
            }
            else
            {
                _habboFriendListComponent.close();
            };
        }

        public function sendGameTabTracking(_arg_1:String):void
        {
            sendEventLogTracking("play_snowstorm_tab_click", _arg_1);
        }

        public function sendGameButtonTracking(_arg_1:String):void
        {
            sendEventLogTracking("play_snowstorm_btn_click", _arg_1);
        }

        private function sendEventLogTracking(_arg_1:String, _arg_2:String):void
        {
            if (_habboCommunicationManager)
            {
                _habboCommunicationManager.connection.send(new _SafeStr_895("Navigation", "Friend Bar", _arg_1, _arg_2, numFriends));
            };
        }

        public function toggleFriendList():void
        {
            var _local_1:* = null;
            if (_habboFriendListComponent)
            {
                if (!_habboFriendListComponent.disposed)
                {
                    if (!_habboFriendListComponent.isOpen())
                    {
                        if (_SafeStr_3926.length > 0)
                        {
                            _habboFriendListComponent.openFriendRequests();
                        }
                        else
                        {
                            _habboFriendListComponent.openFriendList();
                        };
                    }
                    else
                    {
                        _local_1 = _habboFriendListComponent.mainWindow;
                        if (((!(_local_1 == null)) && (WindowToggle.isHiddenByOtherWindows(_local_1))))
                        {
                            _local_1.activate();
                            return;
                        };
                        _habboFriendListComponent.close();
                    };
                    if (_habboCommunicationManager)
                    {
                        _habboCommunicationManager.connection.send(new _SafeStr_895("Toolbar", "FRIENDLIST", ((_habboFriendListComponent.isOpen()) ? "open" : "close")));
                    };
                };
            };
        }

        public function toggleMessenger():void
        {
            if (_habboMessengerComponent)
            {
                if (!_habboMessengerComponent.disposed)
                {
                    _habboMessengerComponent.toggleMessenger();
                    if (_habboCommunicationManager)
                    {
                        _habboCommunicationManager.connection.send(new _SafeStr_895("Toolbar", "MESSENGER", ((_habboMessengerComponent.isOpen()) ? "open" : "close")));
                    };
                };
            };
        }

        private function onMessengerInitialized(_arg_1:IMessageEvent):void
        {
            if (_habboMessengerComponent)
            {
                _habboMessengerComponent.events.addEventListener("ACCE_changed", onUpdateActiveConversationCount);
            };
        }

        private function onFriendsListFragment(_arg_1:IMessageEvent):void
        {
            buildFriendList(_SafeStr_373(_arg_1).getParser().friendFragment);
        }

        private function onFriendListUpdate(_arg_1:IMessageEvent):void
        {
            var _local_2:* = null;
            var _local_6:* = null;
            var _local_4:_SafeStr_1097 = _SafeStr_404(_arg_1).getParser();
            var _local_3:Array = _local_4.removedFriendIds;
            var _local_8:Array = _local_4.updatedFriends;
            var _local_5:Array = _local_4.addedFriends;
            for each (var _local_7:int in _local_3)
            {
                _local_2 = _SafeStr_4207.getValue(_local_7);
                if (_local_2)
                {
                    _SafeStr_4207.remove(_local_7);
                    _SafeStr_4208.splice(_SafeStr_4208.indexOf(_local_2), 1);
                    _habboMessengerComponent.closeConversation(_local_7);
                };
            };
            for each (_local_6 in _local_8)
            {
                _local_2 = _SafeStr_4207.getValue(_local_6.id);
                if (_local_2)
                {
                    if (((_local_6.online) || (false)))
                    {
                        _local_2.name = _local_6.name;
                        _local_2.realName = _local_6.realName;
                        _local_2.motto = _local_6.motto;
                        _local_2.gender = _local_6.gender;
                        _local_2.online = _local_6.online;
                        _local_2.allowFollow = _local_6.followingAllowed;
                        _local_2.figure = _local_6.figure;
                        _local_2.categoryId = _local_6.categoryId;
                        _local_2.lastAccess = _local_6.lastAccess;
                    }
                    else
                    {
                        _SafeStr_4207.remove(_local_6.id);
                        _SafeStr_4208.splice(_SafeStr_4208.indexOf(_local_2), 1);
                    };
                }
                else
                {
                    if (((_local_6.online) || (false)))
                    {
                        _local_2 = new FriendEntity(_local_6.id, _local_6.name, _local_6.realName, _local_6.motto, _local_6.gender, _local_6.online, _local_6.followingAllowed, _local_6.figure, _local_6.categoryId, _local_6.lastAccess);
                        _SafeStr_4208.splice(0, 0, _local_2);
                        _SafeStr_4207.add(_local_2.id, _local_2);
                    };
                };
            };
            for each (_local_6 in _local_5)
            {
                if (((_local_6.online) || (false)))
                {
                    if (_SafeStr_4207.getValue(_local_6.id) == null)
                    {
                        _local_2 = new FriendEntity(_local_6.id, _local_6.name, _local_6.realName, _local_6.motto, _local_6.gender, _local_6.online, _local_6.followingAllowed, _local_6.figure, _local_6.categoryId, _local_6.lastAccess);
                        _SafeStr_4208.push(_local_2);
                        _SafeStr_4207.add(_local_2.id, _local_2);
                    };
                };
                removeFriendRequest(_local_6.id);
            };
            if (((_local_5.length > 0) || (_local_8.length > 0)))
            {
                _SafeStr_4208 = sortByName(_SafeStr_4208);
            };
            events.dispatchEvent(new FriendBarUpdateEvent());
        }

        private function onFindFriendProcessResult(_arg_1:_SafeStr_576):void
        {
            events.dispatchEvent(new FindFriendsNotificationEvent(_arg_1.success));
        }

        private function onNewFriendRequest(_arg_1:_SafeStr_230):void
        {
            var _local_2:* = null;
            if (showFriendRequests)
            {
                _local_2 = _arg_1.getParser().req;
                _SafeStr_3926.push(new FriendRequest(_local_2.requestId, _local_2.requesterName, _local_2.figureString));
                events.dispatchEvent(new FriendRequestUpdateEvent());
            };
        }

        private function onFriendRequestList(_arg_1:_SafeStr_826):void
        {
            var _local_3:* = null;
            if (showFriendRequests)
            {
                _local_3 = _arg_1.getParser().reqs;
                for each (var _local_2:_SafeStr_1649 in _local_3)
                {
                    _SafeStr_3926.push(new FriendRequest(_local_2.requestId, _local_2.requesterName, _local_2.figureString));
                };
                events.dispatchEvent(new FriendRequestUpdateEvent());
            };
        }

        private function onFriendRequestEvent(_arg_1:FriendRequestEvent):void
        {
            removeFriendRequest(_arg_1.requestId);
        }

        private function onNewConsoleMessage(_arg_1:_SafeStr_575):void
        {
            var _local_2:_SafeStr_1405 = _arg_1.getParser();
            _SafeStr_4209 = _local_2.senderId;
            var _local_3:Boolean = true;
            if (_habboMessengerComponent)
            {
                if (_habboMessengerComponent.isOpen())
                {
                    _local_3 = false;
                };
            };
            if (_habboFriendListComponent.hasfriendsListInitialized)
            {
                events.dispatchEvent(new NewMessageEvent(_local_3, _SafeStr_4209));
            };
            if (_local_3)
            {
                makeNotification(_SafeStr_4209, -1, null, false, false);
            };
        }

        private function onUpdateActiveConversationCount(_arg_1:ActiveConversationEvent):void
        {
            events.dispatchEvent(new ActiveConversationsCountEvent(_arg_1.activeConversationsCount));
        }

        private function onRoomInvite(_arg_1:_SafeStr_189):void
        {
            var _local_2:_SafeStr_1112 = _arg_1.getParser();
            _SafeStr_4209 = _local_2.senderId;
            if (((_habboMessengerComponent) && (!(_habboMessengerComponent.isOpen()))))
            {
                events.dispatchEvent(new NewMessageEvent(true, _SafeStr_4209));
                makeNotification(_SafeStr_4209, -1, null, true, false);
            };
        }

        private function onFriendNotification(_arg_1:_SafeStr_955):void
        {
            var _local_4:_SafeStr_1330 = _arg_1.getParser();
            var _local_2:* = (!(_local_4.typeCode == 3));
            var _local_5:* = (!(_local_4.typeCode == 4));
            var _local_3:* = (!(_local_4.typeCode == 3));
            makeNotification(_local_4.avatarId, _local_4.typeCode, _local_4.message, _local_2, _local_5, _local_3);
        }

        private function makeNotification(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean=true):void
        {
            var _local_7:* = null;
            var _local_8:* = null;
            var _local_9:*;
            if (showFriendNotifications)
            {
                _local_7 = getFriendByID(parseInt(_arg_1));
                if (_local_7)
                {
                    _local_9 = _local_7.notifications;
                    for each (_local_8 in _local_9)
                    {
                        if (_local_8.typeCode == _arg_2)
                        {
                            _local_8.message = _arg_3;
                            _local_8.viewOnce = _arg_4;
                            break;
                        };
                        _local_8 = null;
                    };
                    if (!_local_8)
                    {
                        _local_8 = new FriendNotification(_arg_2, _arg_3, _arg_4);
                        _local_9.push(_local_8);
                    }
                    else
                    {
                        if (!_arg_6)
                        {
                            return;
                        };
                    };
                    events.dispatchEvent(new NotificationEvent(_local_7.id, _local_8));
                    if (_arg_5)
                    {
                        setFriendAt(_local_7, 0);
                    };
                    if (_local_7.logEventId < 0)
                    {
                        _local_7.logEventId = _local_7.getNextLogEventId();
                    };
                    if (_tracking)
                    {
                        _tracking.trackEventLog("FriendBar", FriendNotification.typeCodeToString(_arg_2), "notified", "", ((_local_7.logEventId > 0) ? _local_7.logEventId : 0));
                    };
                };
            };
        }

        private function buildFriendList(_arg_1:Array):void
        {
            var _local_2:* = null;
            for each (var _local_3:_SafeStr_1600 in _arg_1)
            {
                if (((_local_3.online) || (false)))
                {
                    _local_2 = new FriendEntity(_local_3.id, _local_3.name, _local_3.realName, _local_3.motto, _local_3.gender, _local_3.online, _local_3.followingAllowed, _local_3.figure, _local_3.categoryId, _local_3.lastAccess);
                    _SafeStr_4208.push(_local_2);
                    _SafeStr_4207.add(_local_2.id, _local_2);
                };
            };
            _SafeStr_4208 = sortByName(_SafeStr_4208);
            events.dispatchEvent(new FriendBarUpdateEvent());
        }

        private function sortByName(_arg_1:Array):Array
        {
            return (_arg_1);
        }

        private function sortByNameAndOnlineStatus(_arg_1:Array):Array
        {
            var _local_5:* = null;
            var _local_2:Array = [];
            var _local_3:Array = [];
            var _local_4:int = _arg_1.length;
            while (_local_4-- > 0)
            {
                _local_5 = _arg_1[_local_4];
                if (_local_5.online)
                {
                    _local_2.push(_local_5);
                }
                else
                {
                    _local_3.push(_local_5);
                };
            };
            _local_4 = _local_3.length;
            while (_local_4-- > 0)
            {
                _local_2.push(_local_3.pop());
            };
            return (_local_2);
        }

        public function get showFriendNotifications():Boolean
        {
            return (getBoolean("friendbar.notifications.enabled"));
        }

        public function get showFriendRequests():Boolean
        {
            return (getBoolean("friendbar.requests.enabled"));
        }


    }
}//package com.sulake.habbo.friendbar.data

// _SafeStr_1097 = "_-RI" (String#22937, DoABC#4)
// _SafeStr_1112 = "_-y1" (String#24596, DoABC#4)
// _SafeStr_1330 = "_-SS" (String#39551, DoABC#4)
// _SafeStr_1405 = "_-mr" (String#23614, DoABC#4)
// _SafeStr_1600 = "_-Cu" (String#6879, DoABC#4)
// _SafeStr_1649 = "_-v1E" (String#15412, DoABC#4)
// _SafeStr_1700 = "_-eD" (String#3930, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_189 = "_-Uo" (String#7898, DoABC#4)
// _SafeStr_197 = "_-G1o" (String#2651, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_230 = "_-SR" (String#7982, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3134 = "_-Jw" (String#11081, DoABC#4)
// _SafeStr_3367 = "_-41n" (String#5091, DoABC#4)
// _SafeStr_3377 = "_-1d" (String#2910, DoABC#4)
// _SafeStr_373 = "_-U1c" (String#6702, DoABC#4)
// _SafeStr_3926 = "_-Mk" (String#2364, DoABC#4)
// _SafeStr_394 = "_-K1A" (String#29760, DoABC#4)
// _SafeStr_404 = "_-M1U" (String#6652, DoABC#4)
// _SafeStr_4207 = "_-oV" (String#4920, DoABC#4)
// _SafeStr_4208 = "_-Np" (String#3096, DoABC#4)
// _SafeStr_4209 = "_-iV" (String#8582, DoABC#4)
// _SafeStr_428 = "_-5Z" (String#7229, DoABC#4)
// _SafeStr_575 = "_-m1T" (String#8185, DoABC#4)
// _SafeStr_576 = "_-eM" (String#23877, DoABC#4)
// _SafeStr_726 = "_-3t" (String#11001, DoABC#4)
// _SafeStr_826 = "_-u1m" (String#11868, DoABC#4)
// _SafeStr_8544 = "_-O1H" (String#40989, DoABC#4)
// _SafeStr_8545 = "_-32N" (String#32603, DoABC#4)
// _SafeStr_8546 = "_-A1T" (String#33932, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)
// _SafeStr_955 = "_-H15" (String#28155, DoABC#4)
// _SafeStr_982 = "_-IY" (String#18855, DoABC#4)


