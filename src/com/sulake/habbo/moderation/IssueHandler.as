// by nota

//com.sulake.habbo.moderation.IssueHandler

package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime._SafeStr_41;
    import _-V1k._SafeStr_1616;
    import com.sulake.core.window.components._SafeStr_3263;
    import __AS3__.vec.Vector;
    import _-v1p._SafeStr_1638;
    import com.sulake.core.window.components._SafeStr_3269;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.utils.getTimer;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3158;
    import _-2s._SafeStr_967;
    import _-2s._SafeStr_539;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components.ITextWindow;
    import _-v1p._SafeStr_1680;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class IssueHandler implements ITrackedWindow, IIssueHandler, _SafeStr_41 
    {

        private static const USELESS_REPORTS_TOPIC_ID:int = 27;
        private static const AUTO_TOPIC_ID:int = 28;
        private static const _SafeStr_8645:int = 1;
        private static const AUTO_TRIGGERED_CATEGORY_ID:int = 3;

        private var _moderationManager:ModerationManager;
        private var _SafeStr_6081:IssueBundle;
        private var _SafeStr_6084:_SafeStr_1616;
        private var _window:_SafeStr_3263;
        private var _SafeStr_6088:Vector.<_SafeStr_1638>;
        private var _SafeStr_6012:Array;
        private var _topicDropdown:_SafeStr_3269;
        private var _callerUserInfo:UserInfoCtrl;
        private var _reportedUserInfo:UserInfoCtrl;
        private var _disposed:Boolean;
        private var _SafeStr_6085:int;
        private var _SafeStr_6086:ChatlogCtrl;
        private var _chatFrame:_SafeStr_3133;
        private var _SafeStr_4680:IItemListWindow;
        private var _SafeStr_6089:int = 0;
        private var _SafeStr_4478:int;
        private var _SafeStr_4479:int;
        private var _lastWindowWidth:int;
        private var _SafeStr_4480:int;
        private var _SafeStr_6087:uint = getTimer();
        private var _SafeStr_6082:_SafeStr_3133;
        private var _SafeStr_6083:ITextFieldWindow;

        public function IssueHandler(_arg_1:ModerationManager, _arg_2:IssueBundle, _arg_3:Vector.<_SafeStr_1638>, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:int)
        {
            _moderationManager = _arg_1;
            _SafeStr_6081 = _arg_2;
            _SafeStr_6088 = _arg_3;
            _SafeStr_4478 = _arg_4;
            _SafeStr_4479 = _arg_5;
            _lastWindowWidth = _arg_6;
            _SafeStr_4480 = _arg_7;
        }

        public function getType():int
        {
            return (8);
        }

        public function getId():String
        {
            return ("" + _SafeStr_6081.id);
        }

        public function getFrame():_SafeStr_3263
        {
            return (_window);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            if (this._callerUserInfo != null)
            {
                this._callerUserInfo.dispose();
                this._callerUserInfo = null;
            };
            if (this._reportedUserInfo != null)
            {
                this._reportedUserInfo.dispose();
                this._reportedUserInfo = null;
            };
            if (this._SafeStr_6086 != null)
            {
                this._SafeStr_6086.dispose();
                this._SafeStr_6086 = null;
            };
            if (_SafeStr_6082)
            {
                _SafeStr_6082.dispose();
                _SafeStr_6082 = null;
            };
            if (_SafeStr_6083)
            {
                _SafeStr_6083.dispose();
                _SafeStr_6083 = null;
            };
            _moderationManager.removeUpdateReceiver(this);
            _moderationManager = null;
            _SafeStr_6081 = null;
        }

        public function show():void
        {
            var _local_5:* = null;
            var _local_6:* = null;
            if (_window != null)
            {
                return;
            };
            if (((_moderationManager.windowManager == null) || (_moderationManager.assets == null)))
            {
                return;
            };
            _window = (_moderationManager.getXmlWindow("issue_handler") as _SafeStr_3263);
            if (_window == null)
            {
                return;
            };
            var _local_3:IItemListWindow = (_window.findChildByName("issues_item_list") as IItemListWindow);
            _SafeStr_6082 = (_local_3.getListItemAt(0) as _SafeStr_3133);
            _local_3.removeListItems();
            var _local_2:IItemListWindow = (_window.findChildByName("msg_item_list") as IItemListWindow);
            _SafeStr_6083 = (_local_2.getListItemAt(0) as ITextFieldWindow);
            _local_2.removeListItems();
            var _local_7:_SafeStr_3109 = _window.findChildByTag("close");
            if (_local_7 != null)
            {
                _local_7.addEventListener("WME_CLICK", onClose);
            };
            _local_7 = _window.findChildByName("issue_cont");
            if (_local_7 != null)
            {
                _local_7.addEventListener("WE_RELOCATED", onWindowRelocatedOrResized);
                _local_7.addEventListener("WE_RESIZED", onWindowRelocatedOrResized);
                _moderationManager.registerUpdateReceiver(this, 1000);
            };
            _SafeStr_6087 = getTimer();
            setProc("close_useless", onCloseUseless);
            setProc("close_sanction", onCloseSanction);
            setProc("close_resolved", onCloseResolved);
            setProc("release", onRelease);
            _local_7 = _window.findChildByName("move_to_player_support");
            if (_local_7 != null)
            {
                _local_7.disable();
            };
            _moderationManager.issueManager.requestSanctionData(_SafeStr_6081.id, -1);
            initializeTopicDropdown();
            _SafeStr_6084 = _SafeStr_6081.getHighestPriorityIssue();
            _callerUserInfo = new UserInfoCtrl(_window, _moderationManager, _SafeStr_6084, this);
            _reportedUserInfo = new UserInfoCtrl(_window, _moderationManager, _SafeStr_6084, this);
            _callerUserInfo.load(_SafeStr_3133(_window.findChildByName("caller_user_info")), _SafeStr_6084.reporterUserId);
            if (((_SafeStr_6084.categoryId == 3) && (_SafeStr_6084.reportedCategoryId == 28)))
            {
                _topicDropdown.selection = _SafeStr_6085;
                _moderationManager.issueManager.requestSanctionData(_SafeStr_6081.id, 1);
            };
            var _local_1:_SafeStr_3133 = _SafeStr_3133(_window.findChildByName("reported_user_info"));
            if (_SafeStr_6081.reportedUserId > 0)
            {
                _reportedUserInfo.load(_local_1, _SafeStr_6081.reportedUserId);
            }
            else
            {
                _local_5 = IItemListWindow(_window.findChildByName("issue_cont"));
                _local_6 = _window.findChildByName("reported_user_info_caption");
                _local_5.removeListItem(_local_6);
                _local_5.removeListItem(_local_1);
            };
            var _local_4:_SafeStr_3158 = (_window.findChildByName("handle_next_checkbox") as _SafeStr_3158);
            if (_local_4 != null)
            {
                _local_4.select();
            };
            _chatFrame = _SafeStr_3133(_window.findChildByName("chat_cont"));
            _SafeStr_4680 = IItemListWindow(_chatFrame.findChildByName("evidence_list"));
            _SafeStr_6086 = new ChatlogCtrl(new _SafeStr_967(_SafeStr_6084.issueId), _moderationManager, 3, _SafeStr_6084.issueId, _SafeStr_6084, _chatFrame, _SafeStr_4680, true);
            _SafeStr_6086.show();
            _SafeStr_14.log(("HARASSER: " + _SafeStr_6081.reportedUserId));
            updateIssueList();
            updateMessages();
        }

        private function sendWindowPreferences():void
        {
            _SafeStr_4478 = _window.x;
            _SafeStr_4479 = _window.y;
            _lastWindowWidth = _window.width;
            _SafeStr_4480 = _window.height;
            _moderationManager.issueManager.setToolPreferences(_SafeStr_4478, _SafeStr_4479, _lastWindowWidth, _SafeStr_4480);
            _moderationManager.connection.send(new _SafeStr_539(_SafeStr_4478, _SafeStr_4479, _lastWindowWidth, _SafeStr_4480));
        }

        private function windowDimensionsChanged():Boolean
        {
            if (_SafeStr_4478 != _window.x)
            {
                return (true);
            };
            if (_SafeStr_4479 != _window.y)
            {
                return (true);
            };
            if (_lastWindowWidth != _window.width)
            {
                return (true);
            };
            if (_SafeStr_4480 != _window.height)
            {
                return (true);
            };
            return (false);
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:uint = getTimer();
            if (((windowDimensionsChanged()) && ((_local_2 - _SafeStr_6087) > 5000)))
            {
                sendWindowPreferences();
            };
        }

        private function onWindowRelocatedOrResized(_arg_1:_SafeStr_3116):void
        {
            var _local_4:IItemListWindow = (_arg_1.window as IItemListWindow);
            if (_local_4 == null)
            {
                return;
            };
            var _local_5:IItemListWindow = (_local_4.getListItemByName("issues_item_list") as IItemListWindow);
            var _local_3:IItemListWindow = (_local_4.getListItemByName("msg_item_list") as IItemListWindow);
            if (((_local_5 == null) || (_local_3 == null)))
            {
                return;
            };
            var _local_2:int = ((((_local_4.height - _local_4.scrollableRegion.height) + _local_5.height) + _local_3.height) * 0.5);
            _local_4.autoArrangeItems = false;
            _local_5.height = _local_2;
            _local_3.height = _local_2;
            _local_4.autoArrangeItems = true;
        }

        private function updateIssueList():void
        {
            var _local_1:* = null;
            var _local_10:* = null;
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_13:* = null;
            if (_window == null)
            {
                return;
            };
            var _local_6:IItemListWindow = (_window.findChildByName("issues_item_list") as IItemListWindow);
            if (_local_6 == null)
            {
                return;
            };
            var _local_8:Array = _SafeStr_6081.issues;
            var _local_7:int;
            var _local_12:int = _local_6.numListItems;
            var _local_3:int = _local_8.length;
            if (_local_12 < _local_3)
            {
                _local_1 = (_SafeStr_6082.clone() as _SafeStr_3133);
                _local_6.addListItem(_local_1);
                _local_7 = 1;
                while (_local_7 < (_local_3 - _local_12))
                {
                    _local_10 = (_local_1.clone() as _SafeStr_3133);
                    if (_local_10 == null)
                    {
                        return;
                    };
                    _local_6.addListItem(_local_10);
                    _local_7++;
                };
            }
            else
            {
                if (_local_12 > _local_3)
                {
                    _local_7 = 0;
                    while (_local_7 < (_local_12 - _local_3))
                    {
                        _local_2 = _local_6.removeListItemAt(0);
                        _local_2.dispose();
                        _local_7++;
                    };
                };
            };
            var _local_9:_SafeStr_1616 = _SafeStr_6081.getHighestPriorityIssue();
            var _local_11:int = ((_local_9 == null) ? 0 : _local_9.issueId);
            var _local_5:int = getTimer();
            _local_7 = 0;
            for each (_local_4 in _local_8)
            {
                _local_1 = (_local_6.getListItemAt(_local_7) as _SafeStr_3133);
                if (_local_1 == null)
                {
                    return;
                };
                _local_1.background = ((_local_7++ % 2) == 0);
                _local_1.id = _local_4.issueId;
                _local_1.removeEventListener("WME_CLICK", onIssueClicked);
                _local_1.addEventListener("WME_CLICK", onIssueClicked);
                setCaption(_local_1.findChildByName("reporter"), _local_4.reporterUserName);
                setCaption(_local_1.findChildByName("type"), _SafeStr_3225.getSourceName(_local_4.categoryId));
                setCaption(_local_1.findChildByName("category"), _SafeStr_3225.getCategoryName(_local_4.reportedCategoryId));
                setCaption(_local_1.findChildByName("time_open"), _local_4.getOpenTime(_local_5));
                _local_13 = (((_local_4.issueId == _local_11) && (_local_3 > 1)) ? "Volter Bold" : "Volter");
                (_local_1.findChildByName("category") as ITextWindow).fontFace = _local_13;
            };
        }

        private function updateMessages():void
        {
            var _local_1:* = null;
            var _local_6:* = null;
            var _local_2:* = null;
            var _local_5:* = null;
            if (_window == null)
            {
                return;
            };
            var _local_4:IItemListWindow = (_window.findChildByName("msg_item_list") as IItemListWindow);
            if (_local_4 == null)
            {
                return;
            };
            var _local_8:Array = _SafeStr_6081.issues;
            var _local_7:int;
            var _local_9:int = _local_4.numListItems;
            var _local_3:int = _local_8.length;
            if (_local_9 < _local_3)
            {
                _local_1 = (_SafeStr_6083.clone() as ITextFieldWindow);
                _local_1.selectable = true;
                _local_1.editable = false;
                _local_4.addListItem(_local_1);
                _local_7 = 1;
                while (_local_7 < (_local_3 - _local_9))
                {
                    _local_6 = (_local_1.clone() as ITextWindow);
                    if (_local_6 == null)
                    {
                        return;
                    };
                    _local_4.addListItem(_local_6);
                    _local_7++;
                };
            }
            else
            {
                if (_local_9 > _local_3)
                {
                    _local_7 = 0;
                    while (_local_7 < (_local_9 - _local_3))
                    {
                        _local_2 = _local_4.removeListItemAt(0);
                        _local_2.dispose();
                        _local_7++;
                    };
                };
            };
            _local_7 = 0;
            for each (_local_5 in _local_8)
            {
                _local_1 = (_local_4.getListItemAt(_local_7) as ITextFieldWindow);
                if (_local_1 == null)
                {
                    return;
                };
                _local_1.width = _local_4.width;
                _local_1.background = ((_local_7++ % 2) == 0);
                _local_1.caption = ((_local_5.reporterUserName + ": ") + _local_5.message);
                _local_1.height = (_local_1.textHeight + 10);
            };
        }

        private function setCaption(_arg_1:_SafeStr_3109, _arg_2:String):void
        {
            if (_arg_1 != null)
            {
                _arg_1.caption = _arg_2;
            };
        }

        private function initializeTopicDropdown():void
        {
            _topicDropdown = (_window.findChildByName("cfh_topics") as _SafeStr_3269);
            var _local_1:int = -1;
            var _local_6:int = _SafeStr_6081.getHighestPriorityIssue().reportedCategoryId;
            if (_local_6 == 27)
            {
                _topicDropdown.disable();
                return;
            };
            _SafeStr_6012 = [];
            var _local_2:Array = [];
            var _local_3:int;
            for each (var _local_5:_SafeStr_1638 in _SafeStr_6088)
            {
                for each (var _local_4:_SafeStr_1680 in _local_5.topics)
                {
                    _local_2[_local_3] = (("${help.cfh.topic." + _local_4.id) + "}");
                    _SafeStr_6012[_local_3] = _local_4.id;
                    if (_local_4.id == 1)
                    {
                        _SafeStr_6085 = _local_3;
                    };
                    if (_local_4.id == _local_6)
                    {
                        _local_1 = _local_3;
                    };
                    _local_3++;
                };
            };
            _topicDropdown.populate(_local_2);
            if (_local_1 >= 0)
            {
                _topicDropdown.selection = _local_1;
            };
            _topicDropdown.addEventListener("WE_SELECTED", refreshSanctionDataForSelectedTopic);
        }

        private function refreshSanctionDataForSelectedTopic(_arg_1:_SafeStr_3116):void
        {
            var _local_3:int = _topicDropdown.selection;
            var _local_2:int = _SafeStr_6012[_local_3];
            _moderationManager.issueManager.requestSanctionData(_SafeStr_6081.id, _local_2);
        }

        private function setProc(_arg_1:String, _arg_2:Function):void
        {
            _window.findChildByName(_arg_1).addEventListener("WME_CLICK", _arg_2);
        }

        private function onClose(_arg_1:WindowMouseEvent):void
        {
            if ((((!(_moderationManager == null)) && (!(_moderationManager.issueManager == null))) && (!(_SafeStr_6081 == null))))
            {
                _moderationManager.issueManager.removeHandler(_SafeStr_6081.id);
                trackAction("closeWindow");
            };
            this.dispose();
        }

        private function onCloseUseless(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_14.log("Close useless clicked");
            trackAction("closeUseless");
            _moderationManager.trackGoogle("actionCountUseless", _SafeStr_6089);
            _moderationManager.issueManager.closeBundle(_SafeStr_6081.id, 1);
            checkAutoHandling();
            dispose();
        }

        private function onCloseResolved(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_14.log("Close resolved clicked");
            trackAction("closeResolved");
            _moderationManager.trackGoogle("actionCountResolved", _SafeStr_6089);
            _moderationManager.issueManager.closeBundle(_SafeStr_6081.id, 3);
            checkAutoHandling();
            dispose();
        }

        private function onCloseSanction(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_14.log("Close with default sanction clicked");
            trackAction("closeSanction");
            _moderationManager.trackGoogle("actionCountSanction", _SafeStr_6089);
            var _local_2:int = -1;
            var _local_3:int = _topicDropdown.selection;
            if (_local_3 >= 0)
            {
                _local_2 = _SafeStr_6012[_local_3];
            };
            if (((_local_2 <= 0) && (_SafeStr_6081.getHighestPriorityIssue().reportedCategoryId == 28)))
            {
                _moderationManager.windowManager.alert("Topic missing", "You need to select the topic first.", 0, null);
            }
            else
            {
                _moderationManager.issueManager.closeDefaultAction(_SafeStr_6081.id, _local_2);
                checkAutoHandling();
                dispose();
            };
        }

        private function onRelease(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_14.log("Release clicked");
            trackAction("release");
            _moderationManager.issueManager.releaseBundle(_SafeStr_6081.id);
            checkAutoHandling();
            dispose();
        }

        private function onIssueClicked(_arg_1:WindowMouseEvent):void
        {
            var _local_3:int;
            for each (var _local_2:_SafeStr_1616 in _SafeStr_6081.issues)
            {
                if (_local_2.issueId == _arg_1.window.id)
                {
                    _SafeStr_6084 = _local_2;
                    _local_3 = _local_2.reporterUserId;
                    if (_local_3 != 0)
                    {
                        if (_callerUserInfo != null)
                        {
                            _callerUserInfo.dispose();
                        };
                        _callerUserInfo = new UserInfoCtrl(_window, _moderationManager, _local_2, this);
                        _callerUserInfo.load(_SafeStr_3133(_window.findChildByName("caller_user_info")), _local_3);
                        _moderationManager.connection.send(new _SafeStr_967(_local_2.issueId));
                        _SafeStr_6086.setId(_local_2.issueId);
                        _moderationManager.messageHandler.addChatlogListener(_SafeStr_6086);
                    };
                    return;
                };
            };
        }

        public function updateIssuesAndMessages():void
        {
            updateIssueList();
            updateMessages();
        }

        public function showDefaultSanction(_arg_1:int, _arg_2:String):void
        {
            if (((((_window == null) || (_moderationManager == null)) || (_moderationManager.issueManager == null)) || (_SafeStr_6081 == null)))
            {
                return;
            };
            if (_arg_1 != _SafeStr_6081.reportedUserId)
            {
                return;
            };
            var _local_3:ITextWindow = (_window.findChildByName("sanction_label") as ITextWindow);
            if (_local_3 != null)
            {
                _local_3.caption = _arg_2;
            };
        }

        private function checkAutoHandling():void
        {
            if ((((_window == null) || (_moderationManager == null)) || (_moderationManager.issueManager == null)))
            {
                return;
            };
            var _local_1:_SafeStr_3158 = (_window.findChildByName("handle_next_checkbox") as _SafeStr_3158);
            if (((!(_local_1 == null)) && (_local_1.isSelected)))
            {
                _moderationManager.issueManager.autoPick("issue handler pick next");
            };
        }

        internal function get callerUserInfo():UserInfoCtrl
        {
            return (_callerUserInfo);
        }

        internal function get reportedUserInfo():UserInfoCtrl
        {
            return (_reportedUserInfo);
        }

        internal function trackAction(_arg_1:String):void
        {
            if (((_moderationManager == null) || (_moderationManager.disposed)))
            {
                return;
            };
            _SafeStr_6089++;
            _moderationManager.trackGoogle(("issueHandler_" + _arg_1));
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1616 = "_-Jg" (String#2516, DoABC#4)
// _SafeStr_1638 = "_-Q16" (String#5254, DoABC#4)
// _SafeStr_1680 = "_-61U" (String#11416, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_3225 = "_-11F" (String#10141, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4478 = "_-6J" (String#3980, DoABC#4)
// _SafeStr_4479 = "_-V1z" (String#4062, DoABC#4)
// _SafeStr_4480 = "_-cJ" (String#3440, DoABC#4)
// _SafeStr_4680 = "_-cS" (String#5383, DoABC#4)
// _SafeStr_539 = "_-21j" (String#28546, DoABC#4)
// _SafeStr_6012 = "_-y1T" (String#5842, DoABC#4)
// _SafeStr_6081 = "_-mB" (String#3014, DoABC#4)
// _SafeStr_6082 = "_-mV" (String#8751, DoABC#4)
// _SafeStr_6083 = "_-hH" (String#9291, DoABC#4)
// _SafeStr_6084 = "_-k1U" (String#5688, DoABC#4)
// _SafeStr_6085 = "_-uI" (String#17989, DoABC#4)
// _SafeStr_6086 = "_-jx" (String#8680, DoABC#4)
// _SafeStr_6087 = "_-jQ" (String#13065, DoABC#4)
// _SafeStr_6088 = "_-sL" (String#17998, DoABC#4)
// _SafeStr_6089 = "_-df" (String#10864, DoABC#4)
// _SafeStr_8645 = "_-EW" (String#39629, DoABC#4)
// _SafeStr_967 = "_-MY" (String#18893, DoABC#4)


