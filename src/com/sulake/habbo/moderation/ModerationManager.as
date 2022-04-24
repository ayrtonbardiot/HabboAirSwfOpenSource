// by nota

//com.sulake.habbo.moderation.ModerationManager

package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.navigator._SafeStr_1696;
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.friendbar.IHabboFriendBar;
    import _-V1k._SafeStr_1652;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.iid.IIDHabboFriendBar;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.configuration.enum.HabboComponentFlags;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.utils.HabboWebTools;
    import _-v1p._SafeStr_1638;

    public class ModerationManager extends _SafeStr_20 implements IHabboModeration 
    {

        private var _windowManager:_SafeStr_1695;
        private var _communication:IHabboCommunicationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _navigator:_SafeStr_1696;
        private var _soundManager:_SafeStr_2088;
        private var _tracking:_SafeStr_1704;
        private var _friendBar:IHabboFriendBar;
        private var _SafeStr_3790:ModerationMessageHandler;
        private var _SafeStr_3789:IssueManager;
        private var _SafeStr_3788:StartPanelCtrl;
        private var _SafeStr_3791:WindowTracker;
        private var _initMsg:_SafeStr_1652;
        private var _SafeStr_3792:int;

        public function ModerationManager(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:_SafeStr_21=null)
        {
            super(_arg_1, _arg_2, _arg_3);
            _SafeStr_3788 = new StartPanelCtrl(this);
            _SafeStr_3791 = new WindowTracker();
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:IHabboCommunicationManager):void
            {
                _communication = _arg_1;
            }), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }), new ComponentDependency(new IIDHabboNavigator(), function (_arg_1:_SafeStr_1696):void
            {
                _navigator = _arg_1;
            }), new ComponentDependency(new IIDHabboSoundManager(), function (_arg_1:_SafeStr_2088):void
            {
                _soundManager = _arg_1;
            }), new ComponentDependency(new IIDHabboTracking(), function (_arg_1:_SafeStr_1704):void
            {
                _tracking = _arg_1;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _SafeStr_3225.setLocalizationManager(_arg_1);
            }), new ComponentDependency(new IIDHabboFriendBar(), function (_arg_1:IHabboFriendBar):void
            {
                _friendBar = _arg_1;
            })]));
        }

        override protected function initComponent():void
        {
            if (HabboComponentFlags.isRoomViewerMode(flags))
            {
                return;
            };
            _SafeStr_3790 = new ModerationMessageHandler(this);
            _SafeStr_3789 = new IssueManager(this);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_SafeStr_3788 != null)
            {
                _SafeStr_3788.dispose();
                _SafeStr_3788 = null;
            };
            super.dispose();
        }

        public function userSelected(_arg_1:int, _arg_2:String):void
        {
            _SafeStr_14.log(((("USER SELECTED: " + _arg_1) + ", ") + _arg_2));
            this._SafeStr_3788.userSelected(_arg_1, _arg_2);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }

        public function get issueManager():IssueManager
        {
            return (_SafeStr_3789);
        }

        public function get connection():IConnection
        {
            return (_communication.connection);
        }

        public function get startPanel():StartPanelCtrl
        {
            return (_SafeStr_3788);
        }

        public function get initMsg():_SafeStr_1652
        {
            return (_initMsg);
        }

        public function get messageHandler():ModerationMessageHandler
        {
            return (_SafeStr_3790);
        }

        public function get windowTracker():WindowTracker
        {
            return (_SafeStr_3791);
        }

        public function get currentFlatId():int
        {
            return (_SafeStr_3792);
        }

        public function get soundManager():_SafeStr_2088
        {
            return (_soundManager);
        }

        public function set initMsg(_arg_1:_SafeStr_1652):void
        {
            _initMsg = _arg_1;
        }

        public function set currentFlatId(_arg_1:int):void
        {
            _SafeStr_3792 = _arg_1;
        }

        public function get isModerator():Boolean
        {
            return (_sessionDataManager.hasSecurity(5));
        }

        public function getXmlWindow(_arg_1:String, _arg_2:String="_xml", _arg_3:int=1):_SafeStr_3109
        {
            var _local_6:* = null;
            var _local_4:* = null;
            var _local_5:_SafeStr_3109;
            try
            {
                _local_6 = assets.getAssetByName((_arg_1 + _arg_2));
                _local_4 = XmlAsset(_local_6);
                _local_5 = _windowManager.buildFromXML(XML(_local_4.content), _arg_3);
            }
            catch(e:Error)
            {
            };
            return (_local_5);
        }

        public function openHkPage(_arg_1:String, _arg_2:String):void
        {
            var _local_4:String = getProperty(_arg_1);
            var _local_5:String = (_local_4 + _arg_2);
            var _local_3:String = "housekeeping";
            HabboWebTools.navigateToURL(_local_5, _local_3);
        }

        public function goToRoom(_arg_1:int):void
        {
            _navigator.goToPrivateRoom(_arg_1);
        }

        public function openThread(_arg_1:int, _arg_2:int):void
        {
            context.createLinkEvent(((("groupforum/" + _arg_1) + "/") + _arg_2));
        }

        public function openThreadMessage(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            context.createLinkEvent(((((("groupforum/" + _arg_1) + "/") + _arg_2) + "/") + _arg_3));
        }

        internal function logEvent(_arg_1:String, _arg_2:String):void
        {
            if (_tracking != null)
            {
                _tracking.trackEventLog("Moderation", _arg_2, _arg_1);
            };
        }

        internal function trackGoogle(_arg_1:String, _arg_2:int=-1):void
        {
            if (_tracking != null)
            {
                _tracking.trackGoogle("moderationManager", _arg_1, _arg_2);
            };
        }

        public function set cfhTopics(_arg_1:Vector.<_SafeStr_1638>):void
        {
            _SafeStr_3789.setCfhTopics(_arg_1);
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1638 = "_-Q16" (String#5254, DoABC#4)
// _SafeStr_1652 = "_-Mv" (String#18944, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3225 = "_-11F" (String#10141, DoABC#4)
// _SafeStr_3788 = "_-M1D" (String#8506, DoABC#4)
// _SafeStr_3789 = "_-310" (String#2581, DoABC#4)
// _SafeStr_3790 = "_-e1E" (String#16564, DoABC#4)
// _SafeStr_3791 = "_-u1n" (String#20691, DoABC#4)
// _SafeStr_3792 = "_-81c" (String#19777, DoABC#4)


