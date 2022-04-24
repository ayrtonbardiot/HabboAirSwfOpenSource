// by nota

//com.sulake.habbo.messenger.HabboMessenger

package com.sulake.habbo.messenger
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.friendlist._SafeStr_1874;
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.help.IHabboHelp;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDHabboHelp;
    import _-JS._SafeStr_726;
    import _-R7._SafeStr_214;
    import _-W1K._SafeStr_785;
    import _-JS._SafeStr_713;
    import _-JS._SafeStr_299;
    import com.sulake.habbo.messenger.events.MiniMailMessageEvent;
    import _-wm._SafeStr_1203;
    import _-IR._SafeStr_913;
    import _-JS._SafeStr_575;
    import _-JS._SafeStr_429;
    import _-JS._SafeStr_189;
    import com.sulake.core.communication.messages.IMessageComposer;
    import _-wm._SafeStr_1405;
    import _-wm._SafeStr_1112;
    import _-wm._SafeStr_1291;
    import com.sulake.habbo.messenger.events.ActiveConversationEvent;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendlist._SafeStr_3173;

    public class HabboMessenger extends Component implements _SafeStr_1700 
    {

        private var _windowManager:_SafeStr_1695;
        private var _communication:IHabboCommunicationManager;
        private var _localization:_SafeStr_18;
        private var _friendList:_SafeStr_1874;
        private var _soundManager:_SafeStr_2088;
        private var _tracking:_SafeStr_1704;
        private var _SafeStr_3759:int = 0;
        private var _sessionDataManager:ISessionDataManager;
        private var _help:IHabboHelp;
        private var _SafeStr_3761:MainView;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _SafeStr_3760:Boolean = false;
        private var _followingToGroupRoom:Boolean = false;

        public function HabboMessenger(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDHabboSoundManager(), function (_arg_1:_SafeStr_2088):void
            {
                _soundManager = _arg_1;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:IHabboCommunicationManager):void
            {
                _communication = _arg_1;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localization = _arg_1;
            }), new ComponentDependency(new IIDHabboFriendList(), function (_arg_1:_SafeStr_1874):void
            {
                _friendList = _arg_1;
            }), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }), new ComponentDependency(new IIDHabboTracking(), function (_arg_1:_SafeStr_1704):void
            {
                _tracking = _arg_1;
            }), new ComponentDependency(new IIDHabboHelp(), function (_arg_1:IHabboHelp):void
            {
                _help = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            _messageEvents = new Vector.<IMessageEvent>(0);
            addMessageEvent(new _SafeStr_726(onMessengerInit));
            addMessageEvent(new _SafeStr_214(onAccountPreferences));
            addMessageEvent(new _SafeStr_785(onHabboGroupDetails));
            if (getBoolean("client.minimail.embed.enabled"))
            {
                addMessageEvent(new _SafeStr_713(onMiniMailMessage));
                addMessageEvent(new _SafeStr_299(onMiniMailUnreadCount));
            };
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
            if (((!(_messageEvents == null)) && (!(_communication == null))))
            {
                for each (var _local_1:IMessageEvent in _messageEvents)
                {
                    _communication.removeHabboConnectionMessageEvent(_local_1);
                };
            };
            super.dispose();
        }

        private function onMiniMailMessage(_arg_1:IMessageEvent):void
        {
            _SafeStr_3759++;
            playMessageReceivedSound();
            events.dispatchEvent(new MiniMailMessageEvent("MMME_new", _SafeStr_3759));
        }

        private function onMiniMailUnreadCount(_arg_1:IMessageEvent):void
        {
            _SafeStr_3759 = (_arg_1.parser as _SafeStr_1203).unreadMessageCount;
            events.dispatchEvent(new MiniMailMessageEvent("MMME_unread", _SafeStr_3759));
        }

        private function onAccountPreferences(_arg_1:_SafeStr_214):void
        {
            _SafeStr_3760 = _arg_1.getParser().roomInvitesIgnored;
        }

        private function onHabboGroupDetails(_arg_1:_SafeStr_785):void
        {
            if (_followingToGroupRoom)
            {
                _followingToGroupRoom = false;
                send(new _SafeStr_913(_arg_1.data.roomId));
            };
        }

        public function getRoomInvitesIgnored():Boolean
        {
            return (_SafeStr_3760);
        }

        public function setRoomInvitesIgnored(_arg_1:Boolean):void
        {
            _SafeStr_3760 = _arg_1;
        }

        private function onMessengerInit(_arg_1:IMessageEvent):void
        {
            _SafeStr_3761 = new MainView(this);
            addMessageEvent(new _SafeStr_575(onNewConsoleMessage));
            addMessageEvent(new _SafeStr_429(onInstantMessageError));
            addMessageEvent(new _SafeStr_189(onRoomInvite));
        }

        public function startConversation(_arg_1:int):void
        {
            if (_SafeStr_3761 != null)
            {
                _SafeStr_3761.startConversation(_arg_1);
                _SafeStr_3761.show();
            };
        }

        public function getUnseenMiniMailMessageCount():int
        {
            return (_SafeStr_3759);
        }

        public function setFollowingAllowed(_arg_1:int, _arg_2:Boolean):void
        {
            if (_SafeStr_3761 != null)
            {
                _SafeStr_3761.setFollowingAllowed(_arg_1, _arg_2);
            };
        }

        public function setOnlineStatus(_arg_1:int, _arg_2:Boolean):void
        {
            if (_SafeStr_3761 != null)
            {
                _SafeStr_3761.setOnlineStatus(_arg_1, _arg_2);
            };
        }

        public function send(_arg_1:IMessageComposer):void
        {
            _communication.connection.send(_arg_1);
        }

        public function playSendSound():void
        {
            if (_soundManager != null)
            {
                _soundManager.playSound("HBST_message_sent");
            };
        }

        public function isOpen():Boolean
        {
            return ((!(_SafeStr_3761 == null)) && (_SafeStr_3761.isOpen));
        }

        public function toggleMessenger():void
        {
            if (_SafeStr_3761 != null)
            {
                _SafeStr_3761.toggle();
            };
        }

        public function getText(_arg_1:String):String
        {
            return (_localization.getLocalization(_arg_1, _arg_1));
        }

        private function onNewConsoleMessage(_arg_1:_SafeStr_575):void
        {
            var _local_2:_SafeStr_1405 = _arg_1.getParser();
            _SafeStr_14.log(((("Received console msg: " + _local_2.messageText) + ", ") + _local_2.senderId));
            if (_SafeStr_3761 != null)
            {
                _SafeStr_3761.addConsoleMessage(_local_2.senderId, _local_2.messageText, _local_2.secondsSinceSent, _local_2.extraData);
                if (!_SafeStr_3761.isOpen)
                {
                    playMessageReceivedSound();
                };
            };
        }

        private function onRoomInvite(_arg_1:_SafeStr_189):void
        {
            var _local_2:_SafeStr_1112 = _arg_1.getParser();
            if (_SafeStr_3761 != null)
            {
                _SafeStr_3761.addRoomInvite(_local_2.senderId, _local_2.messageText);
                if (!_SafeStr_3761.isOpen)
                {
                    playMessageReceivedSound();
                };
            };
        }

        private function playMessageReceivedSound():void
        {
            if (_soundManager != null)
            {
                _soundManager.playSound("HBST_message_received");
            };
        }

        private function onInstantMessageError(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1291 = (_arg_1 as _SafeStr_429).getParser();
            if (_SafeStr_3761 != null)
            {
                _SafeStr_3761.onInstantMessageError(_local_2.userId, _local_2.errorCode, _local_2.message);
            };
        }

        public function conversationCountUpdated(_arg_1:int):void
        {
            events.dispatchEvent(new ActiveConversationEvent("ACCE_changed", _arg_1));
        }

        public function getXmlWindow(_arg_1:String):_SafeStr_3109
        {
            var _local_3:IAsset = assets.getAssetByName((_arg_1 + "_xml"));
            var _local_2:XmlAsset = XmlAsset(_local_3);
            return (_windowManager.buildFromXML(XML(_local_2.content)));
        }

        public function trackGoogle(_arg_1:String, _arg_2:String, _arg_3:int=-1):void
        {
            if (_tracking)
            {
                _tracking.trackGoogle(_arg_1, _arg_2, _arg_3);
            };
        }

        internal function getFriend(_arg_1:int):_SafeStr_3173
        {
            return (_friendList.getFriend(_arg_1));
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }

        public function get localization():_SafeStr_18
        {
            return (_localization);
        }

        internal function reportUser(_arg_1:int):void
        {
            _help.reportUserFromIM(_arg_1);
        }

        public function set followingToGroupRoom(_arg_1:Boolean):void
        {
            _followingToGroupRoom = _arg_1;
        }

        public function closeConversation(_arg_1:int):void
        {
            _SafeStr_3761.hideConversation(_arg_1);
        }

        public function get hasfriendsListInitialized():Boolean
        {
            return (_friendList.hasfriendsListInitialized);
        }


    }
}//package com.sulake.habbo.messenger

// _SafeStr_1112 = "_-y1" (String#24596, DoABC#4)
// _SafeStr_1203 = "_-Qh" (String#39290, DoABC#4)
// _SafeStr_1291 = "_-RU" (String#39253, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1405 = "_-mr" (String#23614, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1700 = "_-eD" (String#3930, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_189 = "_-Uo" (String#7898, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_214 = "_-h1u" (String#5767, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_299 = "_-g1q" (String#30089, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3173 = "_-o3" (String#6682, DoABC#4)
// _SafeStr_3759 = "_-u1P" (String#7933, DoABC#4)
// _SafeStr_3760 = "_-h3" (String#13815, DoABC#4)
// _SafeStr_3761 = "_-11L" (String#982, DoABC#4)
// _SafeStr_429 = "_-D19" (String#27271, DoABC#4)
// _SafeStr_575 = "_-m1T" (String#8185, DoABC#4)
// _SafeStr_713 = "_-S9" (String#28852, DoABC#4)
// _SafeStr_726 = "_-3t" (String#11001, DoABC#4)
// _SafeStr_785 = "_-K10" (String#4948, DoABC#4)
// _SafeStr_913 = "_-02x" (String#10196, DoABC#4)


