// by nota

//com.sulake.habbo.moderation.ModerationMessageHandler

package com.sulake.habbo.moderation
{
    import com.sulake.core.communication.connection.IConnection;
    import _-x1P._SafeStr_802;
    import _-x1P._SafeStr_478;
    import _-v1p._SafeStr_658;
    import _-x1P._SafeStr_650;
    import _-x1P._SafeStr_543;
    import _-x1P._SafeStr_232;
    import _-x1P._SafeStr_1015;
    import _-M1G._SafeStr_345;
    import _-v1p._SafeStr_173;
    import _-x1P._SafeStr_959;
    import _-x1P._SafeStr_397;
    import _-x1P._SafeStr_1000;
    import _-x1P._SafeStr_382;
    import _-x1P._SafeStr_453;
    import _-y1x._SafeStr_605;
    import _-x1P._SafeStr_488;
    import _-Ol._SafeStr_484;
    import _-V1k._SafeStr_1513;
    import _-V1k._SafeStr_1616;
    import _-V1k._SafeStr_1451;
    import _-V1k._SafeStr_1652;
    import _-V1k._SafeStr_1432;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-V1k._SafeStr_1201;
    import _-V1k._SafeStr_1067;
    import _-V1k._SafeStr_1497;
    import _-V1k._SafeStr_1173;
    import flash.utils.Dictionary;
    import _-V1k._SafeStr_1503;
    import _-V1k._SafeStr_1258;
    import _-V1k._SafeStr_1202;
    import _-f1w._SafeStr_1125;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.userclassification.UserClassificationData;
    import _-Y1i._SafeStr_1145;
    import _-Y1i._SafeStr_1165;
    import _-61T._SafeStr_1254;
    import _-V1k._SafeStr_1245;
    import _-2s._SafeStr_349;
    import _-x1P.*;
    import _-V1k.*;

    public class ModerationMessageHandler 
    {

        private var _moderationManager:ModerationManager;
        private var _userInfoListeners:Array = [];
        private var _roomVisitsListeners:Array = [];
        private var _SafeStr_4781:Array = [];
        private var _chatlogListeners:Array = [];
        private var _roomInfoListeners:Array = [];
        private var _roomEnterListeners:Array = [];

        public function ModerationMessageHandler(_arg_1:ModerationManager)
        {
            _moderationManager = _arg_1;
            var _local_2:IConnection = _arg_1.connection;
            _local_2.addMessageEvent(new _SafeStr_802(onRoomChatlog));
            _local_2.addMessageEvent(new _SafeStr_478(onIssueDeleted));
            _local_2.addMessageEvent(new _SafeStr_658(onSanctions));
            _local_2.addMessageEvent(new _SafeStr_650(onModeratorToolPreferences));
            _local_2.addMessageEvent(new _SafeStr_543(onUserChatlog));
            _local_2.addMessageEvent(new _SafeStr_232(onCfhChatlog));
            _local_2.addMessageEvent(new _SafeStr_1015(onIssueInfo));
            _local_2.addMessageEvent(new _SafeStr_345(onRoomUserClassification));
            _local_2.addMessageEvent(new _SafeStr_173(onCfhTopics));
            _local_2.addMessageEvent(new _SafeStr_959(onRoomVisits));
            _local_2.addMessageEvent(new _SafeStr_397(onModeratorActionResult));
            _local_2.addMessageEvent(new _SafeStr_1000(onModeratorInit));
            _local_2.addMessageEvent(new _SafeStr_382(onUserInfo));
            _local_2.addMessageEvent(new _SafeStr_453(onIssuePickFailed));
            _local_2.addMessageEvent(new _SafeStr_605(onRoomExit));
            _local_2.addMessageEvent(new _SafeStr_488(onRoomInfo));
            _local_2.addMessageEvent(new _SafeStr_484(onRoomEnter));
        }

        private function onIssueInfo(_arg_1:_SafeStr_1015):void
        {
            if (((_arg_1 == null) || (_moderationManager == null)))
            {
                return;
            };
            var _local_2:_SafeStr_1513 = _arg_1.getParser();
            if (_local_2 == null)
            {
                return;
            };
            var _local_3:_SafeStr_1616 = _local_2.issueData;
            _moderationManager.issueManager.playSound(_local_3);
            _moderationManager.issueManager.updateIssue(_local_3);
        }

        private function onModeratorInit(_arg_1:_SafeStr_1000):void
        {
            var _local_4:* = null;
            if (((_arg_1 == null) || (_moderationManager == null)))
            {
                return;
            };
            var _local_3:_SafeStr_1451 = _arg_1.getParser();
            if (((_local_3 == null) || (_local_3.data == null)))
            {
                return;
            };
            var _local_2:_SafeStr_1652 = _local_3.data;
            var _local_6:Array = _local_2.issues;
            var _local_5:Array = _local_2.messageTemplates;
            for each (_local_4 in _local_6)
            {
                _moderationManager.issueManager.updateIssue(_local_4);
            };
            _moderationManager.issueManager.updateIssueBrowser();
            _moderationManager.initMsg = _local_2;
            _moderationManager.startPanel.show();
        }

        private function onModeratorToolPreferences(_arg_1:_SafeStr_650):void
        {
            var _local_2:* = null;
            if (((_moderationManager) && (_moderationManager.issueManager)))
            {
                _local_2 = _arg_1.getParser();
                _moderationManager.issueManager.setToolPreferences(_local_2.windowX, _local_2.windowY, _local_2.windowHeight, _local_2.windowWidth);
            };
        }

        private function onIssuePickFailed(_arg_1:_SafeStr_453):void
        {
            var event = _arg_1;
            var parser:_SafeStr_1432 = event.getParser();
            if (parser == null)
            {
                return;
            };
            var alert:Boolean = true;
            var issues:Array = parser.issues;
            var retryEnabled:Boolean = parser.retryEnabled;
            var retryCount:int = parser.retryCount;
            var pickedAlready:Boolean = _moderationManager.issueManager.issuePickFailed(issues);
            if (pickedAlready)
            {
                if (retryEnabled)
                {
                    if (retryCount < 10)
                    {
                        alert = false;
                        _moderationManager.issueManager.autoPick("pick failed retry", retryEnabled, retryCount);
                    };
                };
            };
            if (alert)
            {
                _moderationManager.windowManager.alert("Error", "Issue picking failed", 0, function (_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
                {
                    _arg_1.dispose();
                });
            };
        }

        private function onIssueDeleted(_arg_1:_SafeStr_478):void
        {
            if (((_arg_1 == null) || (_moderationManager == null)))
            {
                return;
            };
            var _local_2:_SafeStr_1201 = _arg_1.getParser();
            if (_local_2 == null)
            {
                return;
            };
            _moderationManager.issueManager.removeIssue(_local_2.issueId);
        }

        private function onUserInfo(_arg_1:_SafeStr_382):void
        {
            var _local_3:_SafeStr_1067 = _arg_1.getParser();
            _SafeStr_14.log(((("GOT USER INFO: " + _local_3.data.userId) + ", ") + _local_3.data.cautionCount));
            for each (var _local_2:_SafeStr_3355 in _userInfoListeners)
            {
                _local_2.onUserInfo(_local_3.data);
            };
        }

        private function onRoomInfo(_arg_1:_SafeStr_488):void
        {
            var _local_2:* = null;
            var _local_3:_SafeStr_1497 = _arg_1.getParser();
            for each (_local_2 in _roomInfoListeners)
            {
                _local_2.onRoomInfo(_local_3.data);
            };
        }

        private function onCfhChatlog(_arg_1:_SafeStr_232):void
        {
            var _local_3:_SafeStr_1173 = _arg_1.getParser();
            var _local_2:Array = [];
            _local_2.push(_local_3.data.chatRecord);
            var _local_4:Dictionary = new Dictionary();
            _local_4[_local_3.data.callerUserId] = 0;
            _local_4[_local_3.data.reportedUserId] = 1;
            onChatlog(("Call For Help Evidence #" + _local_3.data.chatRecordId), 3, _local_3.data.callId, _local_2, _local_4);
        }

        private function onRoomChatlog(_arg_1:_SafeStr_802):void
        {
            var _local_3:_SafeStr_1503 = _arg_1.getParser();
            var _local_2:Array = [];
            _local_2.push(_local_3.data);
            var _local_4:Dictionary = new Dictionary();
            onChatlog(("Room Chatlog: " + _local_3.data.roomName), 4, _local_3.data.roomId, _local_2, _local_4);
        }

        private function onUserChatlog(_arg_1:_SafeStr_543):void
        {
            var _local_2:_SafeStr_1258 = _arg_1.getParser();
            var _local_3:Dictionary = new Dictionary();
            _local_3[_local_2.data.userId] = 0;
            onChatlog(("User Chatlog: " + _local_2.data.userName), 5, _local_2.data.userId, _local_2.data.rooms, _local_3);
        }

        private function onChatlog(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:Array, _arg_5:Dictionary):void
        {
            var _local_6:Array = _chatlogListeners.concat();
            for each (var _local_7:_SafeStr_3333 in _local_6)
            {
                _local_7.onChatlog(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5);
            };
        }

        private function onRoomVisits(_arg_1:_SafeStr_959):void
        {
            var _local_2:* = null;
            var _local_4:_SafeStr_1202 = _arg_1.getParser();
            var _local_3:Array = _roomVisitsListeners.concat();
            for each (_local_2 in _local_3)
            {
                _local_2.onRoomVisits(_local_4.data);
            };
        }

        private function onRoomUserClassification(_arg_1:_SafeStr_345):void
        {
            var _local_9:* = null;
            var _local_5:_SafeStr_1125 = (_arg_1 as _SafeStr_345).getParser();
            var _local_10:_SafeStr_24 = _local_5.classifiedUsernameMap;
            var _local_3:_SafeStr_24 = _local_5.classifiedUserTypeMap;
            var _local_6:int = 1;
            var _local_7:Array = [];
            for each (var _local_8:int in _local_10.getKeys())
            {
                _local_7.push(new UserClassificationData(_local_8, _local_10[_local_8], _local_3[_local_8]));
            };
            var _local_2:UserClassificationCtrl = new UserClassificationCtrl(_moderationManager, _local_6);
            _local_2.show();
            var _local_4:Array = _SafeStr_4781.concat();
            for each (_local_9 in _local_4)
            {
                _local_9.onUserClassification(_local_6, _local_7);
            };
        }

        private function onSanctions(_arg_1:_SafeStr_658):void
        {
            var _local_2:_SafeStr_1145 = _arg_1.getParser();
            _SafeStr_14.log(("Got sanction data..." + [_local_2.issueId, _local_2.accountId, _local_2.sanctionType]));
            _moderationManager.issueManager.updateSanctionData(_local_2.issueId, _local_2.accountId, _local_2.sanctionType);
        }

        private function onCfhTopics(_arg_1:_SafeStr_173):void
        {
            var _local_2:*;
            var _local_3:_SafeStr_1165 = _arg_1.getParser();
            _local_2 = _local_3.callForHelpCategories;
            _moderationManager.cfhTopics = _local_2;
        }

        private function onRoomEnter(_arg_1:_SafeStr_484):void
        {
            var _local_2:* = null;
            var _local_3:_SafeStr_1254 = _arg_1.getParser();
            this._moderationManager.currentFlatId = _local_3.guestRoomId;
            this._moderationManager.startPanel.guestRoomEntered(_local_3);
            for each (_local_2 in _roomEnterListeners)
            {
                _local_2.onRoomChange();
            };
        }

        private function onRoomExit(_arg_1:_SafeStr_605):void
        {
            var _local_2:* = null;
            this._moderationManager.currentFlatId = 0;
            this._moderationManager.startPanel.roomExited();
            for each (_local_2 in _roomEnterListeners)
            {
                _local_2.onRoomChange();
            };
        }

        private function onModeratorActionResult(_arg_1:_SafeStr_397):void
        {
            var _local_2:_SafeStr_1245 = _arg_1.getParser();
            _SafeStr_14.log(((("GOT MOD ACTION RESULT: " + _local_2.userId) + ", ") + _local_2.success));
            if (_local_2.success)
            {
                _moderationManager.connection.send(new _SafeStr_349(_local_2.userId));
            }
            else
            {
                _moderationManager.windowManager.alert("Alert", "Moderation action failed. If you tried to ban a user, please check if the user is already banned.", 0, onAlertClose);
            };
        }

        public function addUserInfoListener(_arg_1:_SafeStr_3355):void
        {
            _userInfoListeners.push(_arg_1);
        }

        public function removeUserInfoListener(_arg_1:_SafeStr_3355):void
        {
            var _local_3:Array = [];
            for each (var _local_2:_SafeStr_3355 in _userInfoListeners)
            {
                if (_local_2 != _arg_1)
                {
                    _local_3.push(_local_2);
                };
            };
            _userInfoListeners = _local_3;
        }

        public function addRoomInfoListener(_arg_1:RoomToolCtrl):void
        {
            _roomInfoListeners.push(_arg_1);
        }

        public function removeRoomInfoListener(_arg_1:RoomToolCtrl):void
        {
            var _local_2:* = null;
            var _local_3:Array = [];
            for each (_local_2 in _roomInfoListeners)
            {
                if (_local_2 != _arg_1)
                {
                    _local_3.push(_local_2);
                };
            };
            _roomInfoListeners = _local_3;
        }

        public function addRoomEnterListener(_arg_1:RoomToolCtrl):void
        {
            _roomEnterListeners.push(_arg_1);
        }

        public function removeRoomEnterListener(_arg_1:RoomToolCtrl):void
        {
            var _local_2:* = null;
            var _local_3:Array = [];
            for each (_local_2 in _roomEnterListeners)
            {
                if (_local_2 != _arg_1)
                {
                    _local_3.push(_local_2);
                };
            };
            _roomEnterListeners = _local_3;
        }

        public function addRoomVisitsListener(_arg_1:RoomVisitsCtrl):void
        {
            _roomVisitsListeners.push(_arg_1);
        }

        public function removeRoomVisitsListener(_arg_1:RoomVisitsCtrl):void
        {
            var _local_2:* = null;
            var _local_3:Array = [];
            for each (_local_2 in _roomVisitsListeners)
            {
                if (_local_2 != _arg_1)
                {
                    _local_3.push(_local_2);
                };
            };
            _roomVisitsListeners = _local_3;
        }

        public function addChatlogListener(_arg_1:_SafeStr_3333):void
        {
            _chatlogListeners.push(_arg_1);
        }

        public function removeChatlogListener(_arg_1:_SafeStr_3333):void
        {
            var _local_3:Array = [];
            for each (var _local_2:_SafeStr_3333 in _chatlogListeners)
            {
                if (_local_2 != _arg_1)
                {
                    _local_3.push(_local_2);
                };
            };
            _chatlogListeners = _local_3;
        }

        public function addUserClassificationListener(_arg_1:UserClassificationCtrl):void
        {
            _SafeStr_4781.push(_arg_1);
        }

        public function removeUserClassificationListener(_arg_1:UserClassificationCtrl):void
        {
            var _local_2:* = null;
            var _local_3:Array = [];
            for each (_local_2 in _SafeStr_4781)
            {
                if (_local_2 != _arg_1)
                {
                    _local_3.push(_local_2);
                };
            };
            _roomVisitsListeners = _local_3;
        }

        private function onAlertClose(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            _arg_1.dispose();
        }


    }
}//package com.sulake.habbo.moderation

// _SafeStr_1000 = "_-m1q" (String#23486, DoABC#4)
// _SafeStr_1015 = "_-31i" (String#23294, DoABC#4)
// _SafeStr_1067 = "_-J1L" (String#38794, DoABC#4)
// _SafeStr_1125 = "_-D15" (String#32007, DoABC#4)
// _SafeStr_1145 = "_-k1h" (String#35616, DoABC#4)
// _SafeStr_1150 = "_-NH" (String#39845, DoABC#4)
// _SafeStr_1165 = "_-32h" (String#30257, DoABC#4)
// _SafeStr_1173 = "_-8x" (String#38762, DoABC#4)
// _SafeStr_1201 = "_-S1j" (String#40556, DoABC#4)
// _SafeStr_1202 = "_-z1Q" (String#32733, DoABC#4)
// _SafeStr_1245 = "_-kq" (String#32185, DoABC#4)
// _SafeStr_1254 = "_-i1B" (String#10192, DoABC#4)
// _SafeStr_1258 = "_-e1h" (String#37613, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1432 = "_-u2" (String#28583, DoABC#4)
// _SafeStr_1451 = "_-ws" (String#34339, DoABC#4)
// _SafeStr_1497 = "_-M1T" (String#39061, DoABC#4)
// _SafeStr_1503 = "_-9F" (String#38809, DoABC#4)
// _SafeStr_1513 = "_-GN" (String#39890, DoABC#4)
// _SafeStr_1616 = "_-Jg" (String#2516, DoABC#4)
// _SafeStr_1638 = "_-Q16" (String#5254, DoABC#4)
// _SafeStr_1652 = "_-Mv" (String#18944, DoABC#4)
// _SafeStr_173 = "_-k1C" (String#12708, DoABC#4)
// _SafeStr_232 = "_-Kl" (String#23368, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3333 = "_-Vk" (String#10240, DoABC#4)
// _SafeStr_3355 = "_-C0" (String#9196, DoABC#4)
// _SafeStr_345 = "_-41p" (String#20589, DoABC#4)
// _SafeStr_349 = "_-21k" (String#20279, DoABC#4)
// _SafeStr_382 = "_-Pg" (String#23208, DoABC#4)
// _SafeStr_397 = "_-B1t" (String#27016, DoABC#4)
// _SafeStr_453 = "_-s1M" (String#18429, DoABC#4)
// _SafeStr_478 = "_-9k" (String#24505, DoABC#4)
// _SafeStr_4781 = "_-d1X" (String#13722, DoABC#4)
// _SafeStr_484 = "_-4N" (String#2464, DoABC#4)
// _SafeStr_488 = "_-mo" (String#23602, DoABC#4)
// _SafeStr_543 = "_-g1Q" (String#23285, DoABC#4)
// _SafeStr_605 = "_-zC" (String#4018, DoABC#4)
// _SafeStr_650 = "_-Hc" (String#23483, DoABC#4)
// _SafeStr_658 = "_-j16" (String#23271, DoABC#4)
// _SafeStr_802 = "_-31s" (String#23314, DoABC#4)
// _SafeStr_959 = "_-a1Y" (String#27613, DoABC#4)


