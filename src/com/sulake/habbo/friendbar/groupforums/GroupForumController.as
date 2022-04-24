// by nota

//com.sulake.habbo.friendbar.groupforums.GroupForumController

package com.sulake.habbo.friendbar.groupforums
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.notifications._SafeStr_2081;
    import com.sulake.habbo.sound._SafeStr_2088;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import _-Wi._SafeStr_1645;
    import flash.utils.Dictionary;
    import flash.utils.Timer;
    import com.sulake.core.runtime._SafeStr_31;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDHabboNotifications;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDHabboToolbar;
    import __AS3__.vec.Vector;
    import _-h12._SafeStr_542;
    import _-h12._SafeStr_275;
    import _-h12._SafeStr_291;
    import _-h12._SafeStr_324;
    import _-h12._SafeStr_735;
    import _-h12._SafeStr_925;
    import _-h12._SafeStr_590;
    import _-h12._SafeStr_329;
    import _-h12._SafeStr_470;
    import _-VM._SafeStr_859;
    import _-VM._SafeStr_512;
    import _-Wi._SafeStr_1461;
    import _-VM._SafeStr_938;
    import com.sulake.core.utils._SafeStr_24;
    import _-VM._SafeStr_152;
    import _-Wi._SafeStr_1346;
    import _-VM._SafeStr_949;
    import _-Wi._SafeStr_1414;
    import _-Wi._SafeStr_1633;
    import _-Wi._SafeStr_1560;
    import _-VM._SafeStr_683;
    import _-VM._SafeStr_449;
    import flash.utils.getTimer;
    import _-Wi._SafeStr_1387;
    import _-Wi._SafeStr_1388;
    import _-VM._SafeStr_970;
    import _-Wi._SafeStr_1644;
    import _-VM._SafeStr_538;
    import _-Wi._SafeStr_1198;
    import _-VM._SafeStr_614;
    import _-Wi._SafeStr_1521;
    import _-XO._SafeStr_313;
    import _-VM._SafeStr_580;
    import _-VM._SafeStr_168;
    import flash.events.TimerEvent;

    public class GroupForumController extends Component implements _SafeStr_3254, ILinkEventTracker 
    {

        public static const FORUMS_LIST_CODE_ACTIVE:int = 0;
        public static const FORUMS_LIST_CODE_POPULAR:int = 1;
        public static const FORUMS_LIST_CODE_MY_FORUMS:int = 2;
        public static const _SafeStr_8549:int = -1;

        private var _configurationManager:_SafeStr_19;
        private var _communicationManager:IHabboCommunicationManager;
        private var _windowManager:_SafeStr_1695;
        private var _localizationManager:_SafeStr_18;
        private var _help:IHabboHelp;
        private var _notifications:_SafeStr_2081;
        private var _soundManager:_SafeStr_2088;
        private var _habboTracking:_SafeStr_1704;
        private var _SafeStr_3761:GroupForumView;
        private var _SafeStr_5317:ComposeMessageView;
        private var _SafeStr_5318:ForumSettingsView;
        private var _SafeStr_5323:int = -1;
        private var _SafeStr_5325:int = -1;
        private var _SafeStr_5321:_SafeStr_1645;
        private var _SafeStr_5327:int;
        private var _SafeStr_5322:int = 0;
        private var _SafeStr_5324:ForumsListData;
        private var _SafeStr_5326:ThreadsListData;
        private var _SafeStr_5328:MessagesListData;
        private var _lastReadMessageIndexByThread:Dictionary = new Dictionary();
        private var _SafeStr_5330:int = -1;
        private var _SafeStr_5329:int;
        private var _lastPostTime:int = -30000;
        private var _SafeStr_5319:int = 0;
        private var _SafeStr_5320:Timer;

        public function GroupForumController(_arg_1:_SafeStr_31, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(_arg_1, _arg_2, _arg_3);
        }

        public function get composeMessageView():ComposeMessageView
        {
            return (_SafeStr_5317);
        }

        public function set composeMessageView(_arg_1:ComposeMessageView):void
        {
            _SafeStr_5317 = _arg_1;
        }

        public function get forumSettingsView():ForumSettingsView
        {
            return (_SafeStr_5318);
        }

        public function set forumSettingsView(_arg_1:ForumSettingsView):void
        {
            _SafeStr_5318 = _arg_1;
        }

        public function get notifications():_SafeStr_2081
        {
            return (_notifications);
        }

        public function get windowManager():_SafeStr_1695
        {
            return (_windowManager);
        }

        public function get localizationManager():_SafeStr_18
        {
            return (_localizationManager);
        }

        public function get lastPostTime():int
        {
            return (_lastPostTime);
        }

        public function get unreadForumsCount():int
        {
            return (_SafeStr_5319);
        }

        public function get tracking():_SafeStr_1704
        {
            return (_habboTracking);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboConfigurationManager(), function (_arg_1:_SafeStr_19):void
            {
                _configurationManager = _arg_1;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (_arg_1:IHabboCommunicationManager):void
            {
                _communicationManager = _arg_1;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (_arg_1:_SafeStr_18):void
            {
                _localizationManager = _arg_1;
            }), new ComponentDependency(new IIDHabboHelp(), function (_arg_1:IHabboHelp):void
            {
                _help = _arg_1;
            }), new ComponentDependency(new IIDHabboNotifications(), function (_arg_1:_SafeStr_2081):void
            {
                _notifications = _arg_1;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (_arg_1:_SafeStr_1695):void
            {
                _windowManager = _arg_1;
            }), new ComponentDependency(new IIDHabboSoundManager(), function (_arg_1:_SafeStr_2088):void
            {
                _soundManager = _arg_1;
            }), new ComponentDependency(new IIDHabboTracking(), function (_arg_1:_SafeStr_1704):void
            {
                _habboTracking = _arg_1;
            }), new ComponentDependency(new IIDHabboToolbar(), null)]));
        }

        override protected function initComponent():void
        {
            _communicationManager.addHabboConnectionMessageEvent(new _SafeStr_542(onThreadList));
            _communicationManager.addHabboConnectionMessageEvent(new _SafeStr_275(onThreadMessageList));
            _communicationManager.addHabboConnectionMessageEvent(new _SafeStr_291(onUpdateThread));
            _communicationManager.addHabboConnectionMessageEvent(new _SafeStr_324(onUpdateMessage));
            _communicationManager.addHabboConnectionMessageEvent(new _SafeStr_735(onPostThreadMessage));
            _communicationManager.addHabboConnectionMessageEvent(new _SafeStr_925(onPostMessageMessage));
            _communicationManager.addHabboConnectionMessageEvent(new _SafeStr_590(onUnreadForumsCountMessage));
            _communicationManager.addHabboConnectionMessageEvent(new _SafeStr_329(onForumsList));
            _communicationManager.addHabboConnectionMessageEvent(new _SafeStr_470(onForumData));
            context.addLinkEventTracker(this);
            startPollingForUnreadForumsCount();
        }

        override public function dispose():void
        {
            if (_SafeStr_5320 != null)
            {
                _SafeStr_5320.stop();
                _SafeStr_5320 = null;
            };
            super.dispose();
        }

        private function startPollingForUnreadForumsCount():void
        {
            var _local_1:int = _configurationManager.getInteger("groupforum.poll.period", 300);
            _SafeStr_5320 = new Timer((_local_1 * 1000), 0);
            _SafeStr_5320.addEventListener("timer", onUnreadForumsCountUpdateTimerEvent);
            _SafeStr_5320.start();
            onUnreadForumsCountUpdateTimerEvent(null);
        }

        public function openGroupForum(_arg_1:int):void
        {
            if (!_communicationManager)
            {
                return;
            };
            initForum(_arg_1);
            requestThreadList(_arg_1, 0);
        }

        public function get linkPattern():String
        {
            return ("groupforum/");
        }

        public function linkReceived(_arg_1:String):void
        {
            var _local_5:int;
            var _local_6:int;
            var _local_2:int;
            var _local_4:int;
            if (!_communicationManager)
            {
                return;
            };
            var _local_3:Array = _arg_1.split("/");
            if (_local_3.length < 2)
            {
                return;
            };
            if (_local_3[1] == "list")
            {
                if (_local_3.length == 3)
                {
                    switch (_local_3[2])
                    {
                        case "active":
                            _local_5 = 0;
                            break;
                        case "popular":
                            _local_5 = 1;
                            break;
                        case "my":
                            _local_5 = 2;
                            break;
                        default:
                            return;
                    };
                    openForumsList(_local_5);
                };
            }
            else
            {
                _local_6 = _local_3[1];
                if (_local_6 == 0)
                {
                    return;
                };
                _SafeStr_5324 = null;
                if (_local_3.length == 2)
                {
                    openGroupForum(_local_6);
                }
                else
                {
                    _local_2 = _local_3[2];
                    _local_4 = 0;
                    if (_local_3.length > 3)
                    {
                        _local_4 = _local_3[3];
                    };
                    initForum(_local_6);
                    _communicationManager.connection.send(new _SafeStr_859(_local_6, _local_2));
                    goToMessageIndex(_local_6, _local_2, _local_4);
                };
            };
        }

        public function openForumsList(_arg_1:int, _arg_2:int=0):void
        {
            markForumAsRead();
            _SafeStr_5323 = _arg_1;
            _SafeStr_5325 = -1;
            _communicationManager.connection.send(new _SafeStr_512(_arg_1, _arg_2, 20));
        }

        private function onForumsList(_arg_1:_SafeStr_329):void
        {
            var _local_3:_SafeStr_1461 = _arg_1.getParser();
            var _local_2:ForumsListData = new ForumsListData(_local_3);
            if (((!(_SafeStr_5321 == null)) && (_SafeStr_5322 > 0)))
            {
                _local_2.updateUnreadMessages(_SafeStr_5321, _SafeStr_5322);
            };
            if (_local_2.listCode == 2)
            {
                updateUnreadForumsCount(_local_2.unreadForumsCount);
            };
            if (_SafeStr_5323 != _local_2.listCode)
            {
                return;
            };
            _SafeStr_5324 = _local_2;
            if (!_SafeStr_3761)
            {
                _SafeStr_3761 = new GroupForumView(this);
            };
            _SafeStr_3761.openForumsList(_SafeStr_5324);
        }

        private function initForum(_arg_1:int):void
        {
            markForumAsRead();
            _SafeStr_5323 = -1;
            _SafeStr_5325 = _arg_1;
            _SafeStr_5322 = 0;
            _communicationManager.connection.send(new _SafeStr_938(_arg_1));
        }

        private function onForumData(_arg_1:_SafeStr_470):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:_SafeStr_1645 = _arg_1.getParser().forumData;
            if (_SafeStr_5325 != _local_4.groupId)
            {
                return;
            };
            if (!_local_4.canRead)
            {
                if (_SafeStr_3761 != null)
                {
                    _SafeStr_3761.dispose();
                };
                _SafeStr_5321 = null;
                _SafeStr_5325 = 0;
                _local_2 = new _SafeStr_24();
                _local_3 = localizationManager.getLocalization("groupforum.view.error.operation_read");
                _local_2.add("message", localizationManager.getLocalizationWithParams(("groupforum.view.error." + _local_4.readPermissionError), "", "operation", _local_3));
                notifications.showNotification("forums.error.access_denied", _local_2);
                return;
            };
            _SafeStr_5321 = _local_4;
            _SafeStr_5322 = _local_4.lastReadMessageId;
        }

        public function requestThreadList(_arg_1:int, _arg_2:int):void
        {
            if (_communicationManager)
            {
                _communicationManager.connection.send(new _SafeStr_152(_arg_1, _arg_2, 20));
            };
        }

        private function onThreadList(_arg_1:_SafeStr_542):void
        {
            var _local_2:_SafeStr_1346 = _arg_1.getParser();
            if (((_SafeStr_5321 == null) || (!(_SafeStr_5321.groupId == _local_2.groupId))))
            {
                return;
            };
            _SafeStr_5326 = new ThreadsListData(_SafeStr_5321.totalThreads, _local_2.startIndex, _local_2.threads);
            if (!_SafeStr_3761)
            {
                _SafeStr_3761 = new GroupForumView(this);
            };
            _SafeStr_3761.openThreadList(_SafeStr_5324, _SafeStr_5321, _SafeStr_5326);
        }

        public function requestThreadMessageList(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            if (_communicationManager)
            {
                _communicationManager.connection.send(new _SafeStr_949(_arg_1, _arg_2, _arg_3, 20));
            };
        }

        private function onThreadMessageList(_arg_1:_SafeStr_275):void
        {
            var _local_6:* = null;
            var _local_3:_SafeStr_1414 = _arg_1.getParser();
            if ((((_SafeStr_5321 == null) || (!(_SafeStr_5321.groupId == _local_3.groupId))) || (_SafeStr_5326 == null)))
            {
                return;
            };
            _SafeStr_5327 = _local_3.threadId;
            var _local_2:_SafeStr_1633 = _SafeStr_5326.threadsById[_SafeStr_5327];
            if (_local_2 == null)
            {
                return;
            };
            var _local_4:int = _local_3.startIndex;
            var _local_5:int = _local_2.nMessages;
            _SafeStr_5328 = new MessagesListData(_SafeStr_5327, _local_5, _local_4, _local_3.messages);
            if (!_SafeStr_3761)
            {
                _SafeStr_3761 = new GroupForumView(this);
            };
            _SafeStr_3761.openMessagesList(_SafeStr_5324, _SafeStr_5321, _SafeStr_5326, _SafeStr_5328);
            if (_local_3.messages.length > 0)
            {
                _local_6 = _SafeStr_1560(_local_3.messages[(_local_3.messages.length - 1)]);
                if (_local_6)
                {
                    updateUnreadMessageCounts(_local_6.messageId, _local_6.threadId, _local_6.messageIndex);
                };
            };
        }

        public function updateForumSettings(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            if (_communicationManager)
            {
                _communicationManager.connection.send(new _SafeStr_683(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5));
            };
        }

        public function postNewThread(_arg_1:int, _arg_2:String, _arg_3:String):void
        {
            if (_communicationManager)
            {
                _communicationManager.connection.send(new _SafeStr_449(_arg_1, 0, _arg_2, _arg_3));
                _lastPostTime = getTimer();
            };
        }

        private function onPostThreadMessage(_arg_1:_SafeStr_735):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_1387 = _SafeStr_1387(_arg_1.getParser());
            if (_SafeStr_5317)
            {
                _SafeStr_5317.dispose();
            };
            if (((!(_SafeStr_5321 == null)) && (_SafeStr_5321.groupId == _local_2.groupId)))
            {
                updateUnreadMessageCounts(_local_2.thread.lastMessageId, _local_2.thread.threadId, (_local_2.thread.nMessages - 1));
            };
            if (_SafeStr_5324 != null)
            {
                _local_3 = _SafeStr_5324.getForumData(_local_2.groupId);
                if (_local_3 != null)
                {
                    _local_3.addNewThread(_local_2.thread);
                };
            };
            if (_SafeStr_3761 == null)
            {
                return;
            };
            if (((_SafeStr_5321 == null) || (!(_local_2.groupId == _SafeStr_5321.groupId))))
            {
                return;
            };
            requestThreadList(_SafeStr_5321.groupId, 0);
        }

        public function postNewMessage(_arg_1:int, _arg_2:int, _arg_3:String):void
        {
            if (_communicationManager)
            {
                _communicationManager.connection.send(new _SafeStr_449(_arg_1, _arg_2, "", _arg_3));
                _lastPostTime = getTimer();
            };
        }

        private function onPostMessageMessage(_arg_1:_SafeStr_925):void
        {
            if (_SafeStr_5317)
            {
                _SafeStr_5317.dispose();
            };
            if (_SafeStr_3761 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1388 = _SafeStr_1388(_arg_1.getParser());
            if ((((_SafeStr_5321 == null) || (!(_local_2.groupId == _SafeStr_5321.groupId))) || (!(_local_2.threadId == _SafeStr_5327))))
            {
                return;
            };
            var _local_3:int = (_local_2.message.messageIndex - (_local_2.message.messageIndex % 20));
            requestThreadMessageList(_SafeStr_5321.groupId, _SafeStr_5327, _local_3);
        }

        public function deleteThread(_arg_1:_SafeStr_1645, _arg_2:int):void
        {
            var _local_3:int;
            if (_communicationManager)
            {
                if (_arg_1.canModerate)
                {
                    _local_3 = 10;
                };
                if (_arg_1.isStaff)
                {
                    _local_3 = 20;
                };
                _communicationManager.connection.send(new _SafeStr_970(_arg_1.groupId, _arg_2, _local_3));
            };
        }

        public function unDeleteThread(_arg_1:_SafeStr_1644, _arg_2:int):void
        {
            if (_communicationManager)
            {
                _communicationManager.connection.send(new _SafeStr_970(_arg_1.groupId, _arg_2, 1));
            };
        }

        public function lockThread(_arg_1:_SafeStr_1644, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            if (_communicationManager)
            {
                _communicationManager.connection.send(new _SafeStr_538(_arg_1.groupId, _arg_2, _arg_3, _arg_4));
            };
        }

        public function stickThread(_arg_1:_SafeStr_1644, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean):void
        {
            if (_communicationManager)
            {
                _communicationManager.connection.send(new _SafeStr_538(_arg_1.groupId, _arg_2, _arg_3, _arg_4));
            };
        }

        public function reportThread(_arg_1:_SafeStr_1644, _arg_2:int):void
        {
            if (_help)
            {
                _help.reportThread(_arg_1.groupId, _arg_2);
            };
        }

        private function onUpdateThread(_arg_1:_SafeStr_291):void
        {
            var _local_2:_SafeStr_1198 = _arg_1.getParser();
            if (((_SafeStr_5321 == null) || (!(_SafeStr_5321.groupId == _local_2.groupId))))
            {
                return;
            };
            var _local_3:_SafeStr_1633 = _local_2.thread;
            if (((_SafeStr_5326) && (_SafeStr_3761)))
            {
                if (_SafeStr_5326.updateThread(_local_3))
                {
                    _SafeStr_3761.updateThread(_local_3);
                    return;
                };
            };
            _SafeStr_5326 = new ThreadsListData(1, 0, [_local_3]);
        }

        public function deleteMessage(_arg_1:_SafeStr_1645, _arg_2:int, _arg_3:int):void
        {
            var _local_4:int;
            if (_communicationManager)
            {
                _local_4 = 10;
                if (_arg_1.isStaff)
                {
                    _local_4 = 20;
                };
                _communicationManager.connection.send(new _SafeStr_614(_SafeStr_5321.groupId, _arg_2, _arg_3, _local_4));
            };
        }

        public function unDeleteMessage(_arg_1:_SafeStr_1644, _arg_2:int, _arg_3:int):void
        {
            if (_communicationManager)
            {
                _communicationManager.connection.send(new _SafeStr_614(_arg_1.groupId, _arg_2, _arg_3, 1));
            };
        }

        public function reportMessage(_arg_1:_SafeStr_1644, _arg_2:int, _arg_3:int):void
        {
            if (_help)
            {
                _help.reportMessage(_arg_1.groupId, _arg_2, _arg_3);
            };
        }

        private function onUpdateMessage(_arg_1:_SafeStr_324):void
        {
            var _local_5:int;
            var _local_6:* = null;
            var _local_3:_SafeStr_1521 = _arg_1.getParser();
            if ((((_SafeStr_5321 == null) || (!(_SafeStr_5321.groupId == _local_3.groupId))) || (!(_SafeStr_5327 == _local_3.threadId))))
            {
                return;
            };
            var _local_2:_SafeStr_1560 = _local_3.message;
            var _local_4:Array = _SafeStr_5328["messages"];
            _local_5 = 0;
            while (_local_5 < _local_4.length)
            {
                _local_6 = _local_4[_local_5];
                if (_local_6.messageId == _local_2.messageId)
                {
                    _local_4[_local_5] = _local_2;
                    if (_SafeStr_3761)
                    {
                        _SafeStr_3761.updateMessage(_local_2);
                    };
                    return;
                };
                _local_5++;
            };
        }

        public function goToMessageIndex(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            _SafeStr_5330 = _arg_2;
            var _local_4:int = int(Math.floor((_arg_3 / 20)));
            _SafeStr_5329 = (_arg_3 % 20);
            requestThreadMessageList(_arg_1, _arg_2, (_local_4 * 20));
        }

        public function getUserInfo(_arg_1:int):void
        {
            if (_communicationManager)
            {
                _communicationManager.connection.send(new _SafeStr_313(_arg_1));
            };
        }

        public function closeMainView():void
        {
            markForumAsRead();
            _SafeStr_3761 = null;
            _SafeStr_5321 = null;
            _SafeStr_5323 = -1;
            _SafeStr_5325 = -1;
        }

        public function markForumAsRead(_arg_1:Boolean=false):void
        {
            var _local_2:* = null;
            if (((_communicationManager) && (_SafeStr_5321)))
            {
                if (((_arg_1) || (_SafeStr_5322 > _SafeStr_5321.lastReadMessageId)))
                {
                    _local_2 = new _SafeStr_580();
                    if (_arg_1)
                    {
                        _local_2.add(_SafeStr_5321.groupId, Math.max(_SafeStr_5321.totalMessages, _SafeStr_5322), (_SafeStr_5322 == 0));
                    }
                    else
                    {
                        _local_2.add(_SafeStr_5321.groupId, _SafeStr_5322, false);
                    };
                    _communicationManager.connection.send(_local_2);
                };
            };
            _SafeStr_5322 = 0;
            _lastReadMessageIndexByThread = new Dictionary();
        }

        public function markForumsAsRead():void
        {
            var _local_1:* = null;
            if (((_communicationManager) && (_SafeStr_5324)))
            {
                _local_1 = new _SafeStr_580();
                for each (var _local_2:_SafeStr_1644 in _SafeStr_5324.forums)
                {
                    if (_local_2.unreadMessages > 0)
                    {
                        _local_1.add(_local_2.groupId, _local_2.totalMessages, true);
                    };
                };
                if (_local_1.size > 0)
                {
                    _communicationManager.connection.send(_local_1);
                    updateUnreadForumsCount(0);
                };
            };
        }

        public function getThreadLastReadMessageIndex(_arg_1:int):int
        {
            var _local_3:* = null;
            var _local_2:* = _lastReadMessageIndexByThread[_arg_1];
            if (_local_2 != null)
            {
                return (_local_2);
            };
            if (_SafeStr_5326)
            {
                _local_3 = _SafeStr_5326.threadsById[_arg_1];
                if (_local_3)
                {
                    return ((_local_3.nMessages - _local_3.nUnreadMessages) - 1);
                };
            };
            return (-1);
        }

        public function updateUnreadMessageCounts(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            if (_arg_1 > _SafeStr_5322)
            {
                _SafeStr_5322 = _arg_1;
                if (_SafeStr_5324)
                {
                    _SafeStr_5324.updateUnreadMessages(_SafeStr_5321, _arg_1);
                    if (_SafeStr_5324.listCode == 2)
                    {
                        updateUnreadForumsCount(_SafeStr_5324.unreadForumsCount);
                    };
                };
            };
            _lastReadMessageIndexByThread[_arg_2] = _arg_3;
        }

        public function getGoToMessageIndex():int
        {
            return (_SafeStr_5329);
        }

        public function getGoToThreadId():int
        {
            return (_SafeStr_5330);
        }

        public function resetGoTo():void
        {
            _SafeStr_5330 = -1;
            _SafeStr_5329 = -1;
        }

        public function updateUnreadForumsCount(_arg_1:int):void
        {
            if (_SafeStr_5319 == _arg_1)
            {
                return;
            };
            if (_arg_1 > _SafeStr_5319)
            {
                if (_soundManager != null)
                {
                };
            };
            _SafeStr_5319 = _arg_1;
            events.dispatchEvent(new UnseenForumsCountUpdatedEvent("UNSEEN_FORUMS_COUNT", _arg_1));
            if (_SafeStr_3761 != null)
            {
                _SafeStr_3761.updateUnreadForumsCount(_arg_1);
            };
        }

        private function onUnreadForumsCountUpdateTimerEvent(_arg_1:TimerEvent):void
        {
            if (_SafeStr_3761 != null)
            {
                _communicationManager.connection.send(new _SafeStr_512(2, 0, 20));
            }
            else
            {
                _communicationManager.connection.send(new _SafeStr_168());
            };
        }

        private function onUnreadForumsCountMessage(_arg_1:_SafeStr_590):void
        {
            updateUnreadForumsCount(_arg_1.getParser().unreadForumsCount);
        }


    }
}//package com.sulake.habbo.friendbar.groupforums

// _SafeStr_1198 = "_-AN" (String#39731, DoABC#4)
// _SafeStr_1346 = "_-P5" (String#39222, DoABC#4)
// _SafeStr_1387 = "_-b1" (String#31284, DoABC#4)
// _SafeStr_1388 = "_-cY" (String#30288, DoABC#4)
// _SafeStr_1414 = "_-c1g" (String#37585, DoABC#4)
// _SafeStr_1461 = "_-I1M" (String#31548, DoABC#4)
// _SafeStr_152 = "_-R1T" (String#28695, DoABC#4)
// _SafeStr_1521 = "_-Y" (String#40069, DoABC#4)
// _SafeStr_1560 = "_-x4" (String#4460, DoABC#4)
// _SafeStr_1633 = "_-XN" (String#3408, DoABC#4)
// _SafeStr_1644 = "_-mW" (String#4106, DoABC#4)
// _SafeStr_1645 = "_-oc" (String#5516, DoABC#4)
// _SafeStr_168 = "_-A10" (String#29684, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_2081 = "_-TA" (String#4559, DoABC#4)
// _SafeStr_2088 = "_-BR" (String#2091, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_25 = "_-G19" (String#757, DoABC#4)
// _SafeStr_275 = "_-DY" (String#23822, DoABC#4)
// _SafeStr_291 = "_-z1f" (String#23067, DoABC#4)
// _SafeStr_31 = "_-Ee" (String#1238, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_324 = "_-21l" (String#24174, DoABC#4)
// _SafeStr_3254 = "_-1i" (String#22420, DoABC#4)
// _SafeStr_329 = "_-Oo" (String#23650, DoABC#4)
// _SafeStr_3761 = "_-11L" (String#982, DoABC#4)
// _SafeStr_449 = "_-H1z" (String#22540, DoABC#4)
// _SafeStr_470 = "_-22o" (String#24113, DoABC#4)
// _SafeStr_512 = "_-JT" (String#22143, DoABC#4)
// _SafeStr_5317 = "_-v1e" (String#9009, DoABC#4)
// _SafeStr_5318 = "_-9i" (String#22223, DoABC#4)
// _SafeStr_5319 = "_-Dh" (String#13343, DoABC#4)
// _SafeStr_5320 = "_-Ge" (String#8394, DoABC#4)
// _SafeStr_5321 = "_-p1M" (String#856, DoABC#4)
// _SafeStr_5322 = "_-Q1b" (String#4875, DoABC#4)
// _SafeStr_5323 = "_-p1F" (String#8907, DoABC#4)
// _SafeStr_5324 = "_-k18" (String#2523, DoABC#4)
// _SafeStr_5325 = "_-2e" (String#7104, DoABC#4)
// _SafeStr_5326 = "_-E5" (String#2507, DoABC#4)
// _SafeStr_5327 = "_-U1z" (String#9555, DoABC#4)
// _SafeStr_5328 = "_-u4" (String#3671, DoABC#4)
// _SafeStr_5329 = "_-Vz" (String#11935, DoABC#4)
// _SafeStr_5330 = "_-e1B" (String#13496, DoABC#4)
// _SafeStr_538 = "_-e1l" (String#17666, DoABC#4)
// _SafeStr_542 = "_-r1r" (String#23747, DoABC#4)
// _SafeStr_580 = "_-Nu" (String#13305, DoABC#4)
// _SafeStr_590 = "_-615" (String#23604, DoABC#4)
// _SafeStr_614 = "_-9V" (String#12896, DoABC#4)
// _SafeStr_683 = "_-1Q" (String#29123, DoABC#4)
// _SafeStr_735 = "_-s1V" (String#22940, DoABC#4)
// _SafeStr_8549 = "_-3k" (String#38474, DoABC#4)
// _SafeStr_859 = "_-02B" (String#28602, DoABC#4)
// _SafeStr_925 = "_-KO" (String#23760, DoABC#4)
// _SafeStr_938 = "_-01Y" (String#28590, DoABC#4)
// _SafeStr_949 = "_-M1f" (String#29118, DoABC#4)
// _SafeStr_970 = "_-P1R" (String#12209, DoABC#4)


