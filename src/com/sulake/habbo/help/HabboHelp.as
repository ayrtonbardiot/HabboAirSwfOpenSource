// by nota

//com.sulake.habbo.help.HabboHelp

package com.sulake.habbo.help
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.navigator._SafeStr_1696;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.habbo.friendlist._SafeStr_1874;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.help.cfh.registry.chat.ChatEventHandler;
    import com.sulake.habbo.help.cfh.registry.instantmessage.InstantMessageEventHandler;
    import com.sulake.habbo.help.cfh.registry.user.UserRegistry;
    import com.sulake.habbo.help.cfh.registry.chat.ChatRegistry;
    import com.sulake.habbo.help.cfh.registry.instantmessage.InstantMessageRegistry;
    import com.sulake.habbo.help.namechange.NameChangeController;
    import com.sulake.core.communication.messages.IMessageComposer;
    import _-v1p._SafeStr_1638;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDHabboFriendList;
    import _-Ja._SafeStr_843;
    import _-v1p._SafeStr_607;
    import _-d1i._SafeStr_483;
    import _-Ol._SafeStr_530;
    import _-y1x._SafeStr_844;
    import _-K1h._SafeStr_642;
    import _-d1i._SafeStr_121;
    import _-d1i._SafeStr_178;
    import _-d1i._SafeStr_893;
    import _-v1p._SafeStr_173;
    import _-Ol._SafeStr_484;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.window.utils.IModalDialog;
    import _-51c._SafeStr_504;
    import _-f1P._SafeStr_604;
    import _-51c._SafeStr_533;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1151;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1228;
    import _-XO._SafeStr_792;
    import _-Po._SafeStr_234;
    import _-61T._SafeStr_1248;
    import _-sq._SafeStr_1321;
    import _-kg.HumanGameObjectData;
    import _-l1n._SafeStr_1131;
    import _-31H._SafeStr_1082;
    import _-61T._SafeStr_1254;
    import _-Y1i._SafeStr_1165;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import _-51c._SafeStr_269;
    import com.sulake.habbo.utils.StringUtil;
    import flash.net.navigateToURL;
    import flash.net.URLRequest;

    public class HabboHelp extends Component implements IHabboHelp, ILinkEventTracker 
    {

        public static const REPORT_TYPE_EMERGENCY:int = 1;
        public static const REPORT_TYPE_GUIDE:int = 2;
        public static const REPORT_TYPE_IM:int = 3;
        public static const REPORT_TYPE_ROOM:int = 4;
        public static const REPORT_TYPE_BULLY:int = 6;
        public static const REPORT_TYPE_THREAD:int = 7;
        public static const REPORT_TYPE_MESSAGE:int = 8;
        public static const REPORT_TYPE_PHOTO:int = 9;

        private var _toolbar:IHabboToolbar;
        private var _windowManager:_SafeStr_1695;
        private var _communicationManager:IHabboCommunicationManager;
        private var _localizationManager:_SafeStr_18;
        private var _roomSessionManager:IRoomSessionManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _navigator:_SafeStr_1696;
        private var _tracking:_SafeStr_1704;
        private var _soundManager:_SafeStr_2088;
        private var _friendList:_SafeStr_1874;
        private var _messageEvents:Vector.<IMessageEvent>;
        private var _SafeStr_3775:ChatEventHandler;
        private var _SafeStr_8628:InstantMessageEventHandler;
        private var _SafeStr_3892:GuideHelpManager;
        private var _userRegistry:UserRegistry = new UserRegistry();
        private var _chatRegistry:ChatRegistry = new ChatRegistry();
        private var _instantMessageRegistry:InstantMessageRegistry = new InstantMessageRegistry();
        private var _SafeStr_3896:NameChangeController;
        private var _SafeStr_3893:CallForHelpManager;
        private var _SafeStr_3897:WelcomeScreenController;
        private var _SafeStr_3898:HabboWayController;
        private var _SafeStr_3900:HabboWayQuizController;
        private var _SafeStr_3899:SafetyBookletController;
        private var _outsideRoom:Boolean;
        private var _SafeStr_3901:int;
        private var _reportMessage:IMessageComposer;
        private var _SafeStr_4312:int = -1;
        private var _SafeStr_3894:int;
        private var _SafeStr_3902:Vector.<_SafeStr_1638>;
        private var _SafeStr_3895:TopicsFlowHelpController;
        private var _sanctionInfo:SanctionInfo;

        public function HabboHelp(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public function get localization():_SafeStr_18
        {
            return (_localizationManager);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get toolbar():IHabboToolbar
        {
            return (_toolbar);
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return (_roomSessionManager);
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return (_sessionDataManager);
        }

        public function get communicationManager():IHabboCommunicationManager
        {
            return (_communicationManager);
        }

        public function get navigator():_SafeStr_1696
        {
            return (_navigator);
        }

        public function get tracking():_SafeStr_1704
        {
            return (_tracking);
        }

        public function get soundManager():_SafeStr_2088
        {
            return (_soundManager);
        }

        public function get newUserTourEnabled():Boolean
        {
            return (getBoolean("guide.help.new.user.tour.enabled"));
        }

        public function get newIdentity():Boolean
        {
            return (getInteger("new.identity", 0) > 0);
        }

        public function get citizenshipEnabled():Boolean
        {
            return (getBoolean("talent.track.citizenship.enabled"));
        }

        public function get safetyQuizDisabled():Boolean
        {
            return (getBoolean("safety_quiz.disabled"));
        }

        public function requestGuide():void
        {
            if (getBoolean("guides.enabled"))
            {
                _SafeStr_3892.createHelpRequest(0);
            };
        }

        public function reportBully(_arg_1:int):void
        {
            if (_SafeStr_3893 != null)
            {
                _SafeStr_3893.reportBully(_arg_1, _SafeStr_3894);
            };
        }

        public function startPhotoReportingInNewCfhFlow(_arg_1:int, _arg_2:String, _arg_3:String, _arg_4:int):void
        {
            if (_SafeStr_3893 != null)
            {
                _SafeStr_3893.reportedRoomId = _SafeStr_3894;
                _SafeStr_3893.reportedUserId = _arg_1;
                _SafeStr_3893.reportedUserName = _arg_2;
                _SafeStr_3893.reportedRoomObjectId = _arg_4;
                _SafeStr_3893.reportedExtraDataId = _arg_3;
                _SafeStr_3895.openReportingContentReasonCategory(9);
            };
        }

        public function reportUser(_arg_1:int, _arg_2:int, _arg_3:String):void
        {
            _SafeStr_3893.reportedUserId = _arg_1;
            _SafeStr_3895.openReportingChatLineSelection();
        }

        public function reportUserName(_arg_1:int, _arg_2:String):void
        {
            _SafeStr_3893.reportedUserId = _arg_1;
            _SafeStr_3893.reportedUserName = _arg_2;
            _SafeStr_3893.reportedRoomId = -1;
            _SafeStr_3895.openReportingUserName();
        }

        public function reportUserFromIM(_arg_1:int):void
        {
            if (_SafeStr_3893 != null)
            {
                _SafeStr_3893.reportedUserId = _arg_1;
                _SafeStr_3895.openReportingIMSelection();
            };
        }

        public function reportRoom(_arg_1:int, _arg_2:String, _arg_3:String):void
        {
            if (_SafeStr_3893 != null)
            {
                _SafeStr_3893.reportedRoomId = _arg_1;
                _SafeStr_3893.reportedRoomName = _arg_2;
                _SafeStr_3893.reportedUserId = -1;
                _SafeStr_3893.reportedUserName = "";
                _SafeStr_3895.openReportingContentReasonCategory(4);
            };
        }

        public function reportThread(_arg_1:int, _arg_2:int):void
        {
            if (_SafeStr_3893 != null)
            {
                _SafeStr_3893.reportedGroupId = _arg_1;
                _SafeStr_3893.reportedThreadId = _arg_2;
                _SafeStr_3895.openReportingContentReasonCategory(7);
            };
        }

        public function reportSelfie(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int):Boolean
        {
            if (_SafeStr_3893 != null)
            {
                if (_arg_2.length < getInteger("help.cfh.length.minimum", 15))
                {
                    windowManager.alert("${generic.alert.title}", "${help.cfh.error.msgtooshort}", 0, null);
                    return (false);
                };
                _SafeStr_3893.reportSelfie(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
                return (true);
            };
            return (false);
        }

        public function reportPhoto(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):Boolean
        {
            if (_SafeStr_3893 != null)
            {
                if (_arg_2 == 0)
                {
                    windowManager.alert("${generic.alert.title}", "${help.cfh.error.notopic}", 0, null);
                    return (false);
                };
                _SafeStr_3893.reportPhoto(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
                return (true);
            };
            return (false);
        }

        public function reportMessage(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            if (_SafeStr_3893 != null)
            {
                _SafeStr_3893.reportedGroupId = _arg_1;
                _SafeStr_3893.reportedThreadId = _arg_2;
                _SafeStr_3893.reportedMessageId = _arg_3;
                _SafeStr_3895.openReportingContentReasonCategory(8);
            };
        }

        public function startNameChange():void
        {
            if (_SafeStr_3896 != null)
            {
                _SafeStr_3896.showView();
            };
        }

        public function startEmergencyRequest():void
        {
            if (_SafeStr_3893 != null)
            {
                _SafeStr_3893.openEmergencyHelpRequest();
            };
        }

        public function showWelcomeScreen(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:String=null):void
        {
            if (((_SafeStr_3897 == null) || (_SafeStr_3897.disposed)))
            {
                _SafeStr_3897 = new WelcomeScreenController(this);
            };
            _SafeStr_3897.showWelcomeScreen(_arg_1, _arg_2, _arg_3, _arg_4);
        }

        public function showHabboWay():void
        {
            if (!_SafeStr_3898)
            {
                _SafeStr_3898 = new HabboWayController(this);
            };
            _SafeStr_3898.showHabboWay();
        }

        public function closeHabboWay():void
        {
            if (_SafeStr_3898 != null)
            {
                _SafeStr_3898.closeWindow();
            };
        }

        public function showSafetyBooklet():void
        {
            if (!_SafeStr_3899)
            {
                _SafeStr_3899 = new SafetyBookletController(this);
            };
            _SafeStr_3899.openSafetyBooklet();
        }

        public function closeSafetyBooklet():void
        {
            if (_SafeStr_3899 != null)
            {
                _SafeStr_3899.closeWindow();
            };
        }

        public function showHabboWayQuiz():void
        {
            if (((_SafeStr_3900 == null) || (_SafeStr_3900.disposed)))
            {
                _SafeStr_3900 = new HabboWayQuizController(this);
            };
            _SafeStr_3900.showHabboWayQuiz();
        }

        public function showSafetyQuiz():void
        {
            if (((_SafeStr_3900 == null) || (_SafeStr_3900.disposed)))
            {
                _SafeStr_3900 = new HabboWayQuizController(this);
            };
            _SafeStr_3900.showSafetyQuiz();
        }

        public function showTourPopup():void
        {
            _SafeStr_3892.openTourPopup();
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDSessionDataManager(), function (_arg_1:ISessionDataManager):void
            {
                _sessionDataManager = _arg_1;
            }, false), new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:IHabboCommunicationManager):void
            {
                _communicationManager = _arg_1;
            }), new ComponentDependency(new IIDHabboToolbar(), function (_arg_1:IHabboToolbar):void
            {
                _toolbar = _arg_1;
            }, true, [{
                "type":"HTE_TOOLBAR_CLICK",
                "callback":onHabboToolbarEvent
            }, {
                "type":"HTE_GROUP_ROOM_INFO_CLICK",
                "callback":onHabboToolbarEvent
            }, {
                "type":"HTE_RESIZED",
                "callback":onHabboToolbarEvent
            }]), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localizationManager = _arg_1;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (_arg_1:IRoomSessionManager):void
            {
                _roomSessionManager = _arg_1;
            }, true), new ComponentDependency(new IIDHabboNavigator(), function (_arg_1:_SafeStr_1696):void
            {
                _navigator = _arg_1;
            }, false), new ComponentDependency(new IIDHabboTracking(), function (_arg_1:_SafeStr_1704):void
            {
                _tracking = _arg_1;
            }, false), new ComponentDependency(new IIDHabboSoundManager(), function (_arg_1:_SafeStr_2088):void
            {
                _soundManager = _arg_1;
            }, false), new ComponentDependency(new IIDHabboFriendList(), function (_arg_1:_SafeStr_1874):void
            {
                _friendList = _arg_1;
            }, false)]));
        }

        override protected function initComponent():void
        {
            _messageEvents = new Vector.<IMessageEvent>(0);
            addMessageEvent(new _SafeStr_843(onGuestRoomResult));
            addMessageEvent(new _SafeStr_607(onSanctionStatusEvent));
            addMessageEvent(new _SafeStr_483(onGuideReportingStatus));
            addMessageEvent(new _SafeStr_530(onUsers));
            addMessageEvent(new _SafeStr_844(onRoomReady));
            addMessageEvent(new _SafeStr_642(onGameStageStarting));
            addMessageEvent(new _SafeStr_121(onPendingCallsForHelp));
            addMessageEvent(new _SafeStr_178(onCallForHelpDisabledNotify));
            addMessageEvent(new _SafeStr_893(onPendingCallsForHelpDeleted));
            addMessageEvent(new _SafeStr_173(onCfhTopics));
            addMessageEvent(new _SafeStr_484(onRoomEnter));
            _SafeStr_3775 = new ChatEventHandler(this);
            _SafeStr_3892 = new GuideHelpManager(this);
            _SafeStr_3893 = new CallForHelpManager(this);
            _SafeStr_3896 = new NameChangeController(this);
            _SafeStr_8628 = new InstantMessageEventHandler(this);
            _SafeStr_3895 = new TopicsFlowHelpController(this);
            _sanctionInfo = new SanctionInfo(this);
            context.addLinkEventTracker(this);
            if (((getBoolean("show.sanction.info.on.login")) && (Math.random() < 0.2)))
            {
                requestSanctionInfo(true);
            };
        }

        public function addMessageEvent(_arg_1:IMessageEvent):void
        {
            _messageEvents.push(_communicationManager.addHabboConnectionMessageEvent(_arg_1));
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (((!(_messageEvents == null)) && (!(_communicationManager == null))))
            {
                for each (var _local_1:IMessageEvent in _messageEvents)
                {
                    _communicationManager.removeHabboConnectionMessageEvent(_local_1);
                };
            };
            if (_SafeStr_3899 != null)
            {
                _SafeStr_3899.dispose();
                _SafeStr_3899 = null;
            };
            if (_SafeStr_3898 != null)
            {
                _SafeStr_3898.dispose();
                _SafeStr_3898 = null;
            };
            if (_SafeStr_3897 != null)
            {
                _SafeStr_3897.dispose();
                _SafeStr_3897 = null;
            };
            if (_SafeStr_3896 != null)
            {
                _SafeStr_3896.dispose();
                _SafeStr_3896 = null;
            };
            if (_SafeStr_3892)
            {
                _SafeStr_3892.dispose();
                _SafeStr_3892 = null;
            };
            if (_SafeStr_3893)
            {
                _SafeStr_3893.dispose();
                _SafeStr_3893 = null;
            };
            if (_SafeStr_3900)
            {
                _SafeStr_3900.dispose();
                _SafeStr_3900 = null;
            };
            if (_SafeStr_3895)
            {
                _SafeStr_3895.dispose();
                _SafeStr_3895 = null;
            };
            if (_sanctionInfo)
            {
                _sanctionInfo.dispose();
                _sanctionInfo = null;
            };
            super.dispose();
        }

        public function getXmlWindow(_arg_1:String, _arg_2:uint=1):_SafeStr_3109
        {
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_4:_SafeStr_3109;
            try
            {
                _local_5 = assets.getAssetByName((_arg_1 + "_xml"));
                _local_3 = XmlAsset(_local_5);
                _local_4 = _windowManager.buildFromXML(XML(_local_3.content), _arg_2);
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("HabboNavigator", (((((("Failed to build window " + _arg_1) + "_xml, ") + _local_5) + ", ") + _windowManager) + "!"));
                throw (e);
            };
            return (_local_4);
        }

        public function getModalXmlWindow(_arg_1:String):IModalDialog
        {
            var _local_4:* = null;
            var _local_2:* = null;
            var _local_3:IModalDialog;
            try
            {
                _local_4 = assets.getAssetByName((_arg_1 + "_xml"));
                _local_2 = XmlAsset(_local_4);
                _local_3 = _windowManager.buildModalDialogFromXML(XML(_local_2.content));
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("HabboNavigator", (((((("Failed to build window " + _arg_1) + "_xml, ") + _local_4) + ", ") + _windowManager) + "!"));
                throw (e);
            };
            return (_local_3);
        }

        public function trackGoogle(_arg_1:String, _arg_2:String, _arg_3:int=-1):void
        {
            if (_tracking)
            {
                _tracking.trackGoogle(_arg_1, _arg_2, _arg_3);
            };
        }

        public function setReportMessage(_arg_1:IMessageComposer):void
        {
            _reportMessage = _arg_1;
        }

        public function sendMessage(_arg_1:IMessageComposer):void
        {
            if (((!(_communicationManager == null)) && (!(_arg_1 == null))))
            {
                _communicationManager.connection.send(_arg_1);
            };
        }

        public function get ownUserName():String
        {
            return (_SafeStr_3896.ownUserName);
        }

        public function get ownUserId():int
        {
            return (_SafeStr_3896.ownUserId);
        }

        public function get outsideRoom():Boolean
        {
            return (_outsideRoom);
        }

        public function set outsideRoom(_arg_1:Boolean):void
        {
            _outsideRoom = _arg_1;
        }

        public function queryForPendingCallsForHelp(_arg_1:int):void
        {
            _SafeStr_3901 = _arg_1;
            sendMessage(new _SafeStr_504());
        }

        public function queryForGuideReportingStatus(_arg_1:int):void
        {
            _SafeStr_4312 = _arg_1;
            sendMessage(new _SafeStr_604());
            sendMessage(new _SafeStr_533());
        }

        private function onPendingCallsForHelp(_arg_1:IMessageEvent):void
        {
            var _local_4:* = null;
            var _local_3:int;
            var _local_2:_SafeStr_1151 = _SafeStr_121(_arg_1).getParser();
            if (((_local_2.callCount == 0) || ((_SafeStr_3901 == 9) && (_local_2.callCount < 3))))
            {
                proceedWithReporting();
            }
            else
            {
                _local_4 = "";
                _local_3 = 0;
                while (((_local_3 < _local_2.callArray.length) && (_local_3 < 10)))
                {
                    _local_4 = (_local_4 + _local_2.callArray[_local_3].message);
                    if (((_local_3 < (_local_2.callArray.length - 1)) && (_local_3 < 9)))
                    {
                        _local_4 = (_local_4 + "\n");
                    };
                    _local_3++;
                };
                _SafeStr_3893.showPendingRequest(_local_4);
            };
        }

        private function onPendingCallsForHelpDeleted(_arg_1:IMessageEvent):void
        {
            _SafeStr_3895.submitCallForHelp(false);
        }

        private function onGuideReportingStatus(_arg_1:_SafeStr_483):void
        {
            var _local_2:_SafeStr_1228 = _arg_1.getParser();
            switch (_local_2.statusCode)
            {
                case 0:
                    toggleNewHelpWindow();
                    return;
                case 1:
                    _SafeStr_3892.showPendingTicket(_local_2.pendingTicket);
                    return;
                default:
                    _SafeStr_3892.showFeedback(_local_2.localizationCode);
            };
        }

        private function proceedWithReporting():void
        {
            switch (_SafeStr_3901)
            {
                case 1:
                case 3:
                case 4:
                case 7:
                case 8:
                    _SafeStr_3893.showEmergencyHelpRequest(_SafeStr_3901);
                    break;
                case 2:
                    _SafeStr_3892.openReportWindow();
                    break;
                case 9:
                    if (_reportMessage != null)
                    {
                        sendMessage(_reportMessage);
                        _reportMessage = null;
                    };
                default:
            };
            _SafeStr_3901 = 0;
        }

        private function onCallForHelpDisabledNotify(_arg_1:_SafeStr_178):void
        {
            _windowManager.simpleAlert("${help.emergency.global_mute.caption}", "${help.emergency.global_mute.subtitle}", "${help.emergency.global_mute.message}", "${help.emergency.global_mute.link}", _arg_1.getParser().infoUrl);
        }

        public function get friendList():_SafeStr_1874
        {
            return (_friendList);
        }

        public function ignoreAndUnfriendReportedUser():void
        {
            var _local_1:* = null;
            if (_SafeStr_3893.reportedUserId > 0)
            {
                sendMessage(new _SafeStr_792(_SafeStr_3893.reportedUserId));
                if (_friendList.getFriend(_SafeStr_3893.reportedUserId) != null)
                {
                    _local_1 = new _SafeStr_234();
                    _local_1.addRemovedFriend(_SafeStr_3893.reportedUserId);
                    sendMessage(_local_1);
                };
            };
        }

        private function onUsers(_arg_1:IMessageEvent):void
        {
            var _local_3:int;
            var _local_4:* = null;
            var _local_2:_SafeStr_1248 = _SafeStr_530(_arg_1).getParser();
            _local_3 = 0;
            while (_local_3 < _local_2.getUserCount())
            {
                _local_4 = _local_2.getUser(_local_3);
                if (((!(_local_4.webID == ownUserId)) && (_local_4.userType == 1)))
                {
                    _userRegistry.registerUser(_local_4.webID, _local_4.name, _local_4.figure);
                };
                _local_3++;
            };
        }

        private function onGameStageStarting(_arg_1:_SafeStr_642):void
        {
            var _local_6:* = null;
            var _local_2:_SafeStr_1321 = _arg_1.getParser();
            var _local_5:Array = _local_2.gameObjects.gameObjects;
            var _local_4:int = _userRegistry.roomId;
            var _local_3:String = _userRegistry.roomName;
            _userRegistry.registerRoom(-1, "SnowStorm");
            for each (var _local_7:Object in _local_5)
            {
                _local_6 = (_local_7 as HumanGameObjectData);
                if (((!(_local_6 == null)) && (!(_local_6.userId == ownUserId))))
                {
                    _userRegistry.registerUser(_local_6.userId, _local_6.name, _local_6.figure);
                };
            };
            _userRegistry.registerRoom(_local_4, _local_3);
        }

        private function onRoomReady(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1131 = _SafeStr_844(_arg_1).getParser();
            _userRegistry.registerRoom(_local_2.roomId, "");
        }

        private function onGuestRoomResult(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1082 = _SafeStr_843(_arg_1).getParser();
            _userRegistry.registerRoom(_local_2.data.flatId, _local_2.data.roomName);
        }

        public function get userRegistry():UserRegistry
        {
            return (_userRegistry);
        }

        public function get chatRegistry():ChatRegistry
        {
            return (_chatRegistry);
        }

        public function get instantMessageRegistry():InstantMessageRegistry
        {
            return (_instantMessageRegistry);
        }

        private function onRoomEnter(_arg_1:_SafeStr_484):void
        {
            var _local_2:_SafeStr_1254 = _SafeStr_484(_arg_1).getParser();
            _SafeStr_3894 = _local_2.guestRoomId;
        }

        private function onCfhTopics(_arg_1:_SafeStr_173):void
        {
            var _local_2:_SafeStr_1165 = _arg_1.getParser();
            _SafeStr_3902 = _local_2.callForHelpCategories;
        }

        public function get callForHelpCategories():Vector.<_SafeStr_1638>
        {
            return (_SafeStr_3902);
        }

        public function get guardiansEnabled():Boolean
        {
            return (getBoolean("guardians.enabled"));
        }

        public function get linkPattern():String
        {
            return ("help/");
        }

        public function get reportedUserId():int
        {
            return (_SafeStr_3893.reportedUserId);
        }

        public function get reportedUserName():String
        {
            return (_SafeStr_3893.reportedUserName);
        }

        public function get reportedRoomId():int
        {
            return (_SafeStr_3893.reportedRoomId);
        }

        public function get reportedExtraDataId():String
        {
            return (_SafeStr_3893.reportedExtraDataId);
        }

        public function get reportedRoomObjectId():int
        {
            return (_SafeStr_3893.reportedRoomObjectId);
        }

        public function set reportedUserId(_arg_1:int):void
        {
            _SafeStr_3893.reportedUserId = _arg_1;
        }

        public function set reportedRoomId(_arg_1:int):void
        {
            _SafeStr_3893.reportedRoomId = _arg_1;
        }

        public function linkReceived(_arg_1:String):void
        {
            var _local_2:* = null;
            var _local_3:int;
            var _local_4:* = null;
            if (_arg_1 == "help/tour")
            {
                requestGuide();
            };
            if (_arg_1.indexOf("help/report/room/") == 0)
            {
                _local_2 = _arg_1.split("/");
                if (_local_2.length >= 5)
                {
                    _local_3 = parseInt(_local_2[3]);
                    _local_4 = unescape(_local_2.splice(4).join("/"));
                    reportRoom(_local_3, _local_4, "");
                };
            };
        }

        private function onHabboToolbarEvent(_arg_1:HabboToolbarEvent):void
        {
            if (_SafeStr_3897 != null)
            {
                _SafeStr_3897.onHabboToolbarEvent(_arg_1);
            };
            if (_SafeStr_3892 != null)
            {
                _SafeStr_3892.onHabboToolbarEvent(_arg_1);
            };
        }

        public function get callForHelpManager():CallForHelpManager
        {
            return (_SafeStr_3893);
        }

        public function toggleNewHelpWindow():void
        {
            _SafeStr_3895.toggleWindow();
        }

        public function requestSanctionInfo(_arg_1:Boolean):void
        {
            sendMessage(new _SafeStr_269(_arg_1));
        }

        private function onSanctionStatusEvent(_arg_1:_SafeStr_607):void
        {
            _sanctionInfo.openWindow(_arg_1);
        }

        public function openCfhFaq():void
        {
            var _local_1:String = context.configuration.getProperty("cfh.faq.url");
            if (!StringUtil.isEmpty(_local_1))
            {
                (navigateToURL(new URLRequest(_local_1)));
            };
        }

        public function get guideHelpManager():GuideHelpManager
        {
            return (_SafeStr_3892);
        }


    }
}//package com.sulake.habbo.help

// _SafeStr_1082 = "_-51j" (String#11299, DoABC#4)
// _SafeStr_1131 = "_-k1c" (String#17697, DoABC#4)
// _SafeStr_1151 = "_-c1r" (String#37634, DoABC#4)
// _SafeStr_1165 = "_-32h" (String#30257, DoABC#4)
// _SafeStr_121 = "_-3r" (String#24728, DoABC#4)
// _SafeStr_1228 = "_-UC" (String#39566, DoABC#4)
// _SafeStr_1248 = "_-mE" (String#24740, DoABC#4)
// _SafeStr_1254 = "_-i1B" (String#10192, DoABC#4)
// _SafeStr_1321 = "_-e1s" (String#29040, DoABC#4)
// _SafeStr_1562 = "_-d1I" (String#24717, DoABC#4)
// _SafeStr_1638 = "_-Q16" (String#5254, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1696 = "_-11U" (String#2010, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_173 = "_-k1C" (String#12708, DoABC#4)
// _SafeStr_178 = "_-i1H" (String#23263, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1874 = "_-41C" (String#2525, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_234 = "_-W11" (String#12306, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_269 = "_-NA" (String#29813, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3775 = "_-a1c" (String#6846, DoABC#4)
// _SafeStr_3892 = "_-y1r" (String#5093, DoABC#4)
// _SafeStr_3893 = "_-aj" (String#1743, DoABC#4)
// _SafeStr_3894 = "_-O9" (String#1104, DoABC#4)
// _SafeStr_3895 = "_-Y1F" (String#4850, DoABC#4)
// _SafeStr_3896 = "_-I1j" (String#6985, DoABC#4)
// _SafeStr_3897 = "_-6B" (String#6104, DoABC#4)
// _SafeStr_3898 = "_-31q" (String#6684, DoABC#4)
// _SafeStr_3899 = "_-R1Y" (String#6820, DoABC#4)
// _SafeStr_3900 = "_-J0" (String#4945, DoABC#4)
// _SafeStr_3901 = "_-K1j" (String#2996, DoABC#4)
// _SafeStr_3902 = "_-y19" (String#19991, DoABC#4)
// _SafeStr_4312 = "_-Y1J" (String#4374, DoABC#4)
// _SafeStr_483 = "_-f1k" (String#24663, DoABC#4)
// _SafeStr_484 = "_-4N" (String#2464, DoABC#4)
// _SafeStr_504 = "_-d1B" (String#30965, DoABC#4)
// _SafeStr_530 = "_-sr" (String#6833, DoABC#4)
// _SafeStr_533 = "_-51p" (String#28432, DoABC#4)
// _SafeStr_604 = "_-K1K" (String#13444, DoABC#4)
// _SafeStr_607 = "_-Rr" (String#18691, DoABC#4)
// _SafeStr_642 = "_-kN" (String#13461, DoABC#4)
// _SafeStr_792 = "_-A1E" (String#12364, DoABC#4)
// _SafeStr_843 = "_-W1I" (String#3535, DoABC#4)
// _SafeStr_844 = "_-9H" (String#4703, DoABC#4)
// _SafeStr_8628 = "_-5B" (String#24748, DoABC#4)
// _SafeStr_893 = "_-12g" (String#30948, DoABC#4)


