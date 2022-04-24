// by nota

//com.sulake.habbo.help.CallForHelpManager

package com.sulake.habbo.help
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import _-d1i._SafeStr_1011;
    import _-d1i._SafeStr_617;
    import _-d1i._SafeStr_761;
    import _-51c._SafeStr_255;
    import _-51c._SafeStr_452;
    import com.sulake.habbo.window.widgets.IIlluminaInputWidget;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.habbo.help.cfh.registry.user.UserRegistryItem;
    import com.sulake.habbo.window.widgets._SafeStr_3289;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import _-XO._SafeStr_792;
    import _-51c._SafeStr_292;
    import com.sulake.core.window.components.ISelectableWindow;
    import _-51c._SafeStr_350;
    import _-51c._SafeStr_621;
    import _-51c._SafeStr_359;
    import _-51c._SafeStr_377;
    import com.sulake.habbo.window.utils._SafeStr_3114;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1169;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1261;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1384;
    import _-51c._SafeStr_417;

    public class CallForHelpManager implements _SafeStr_13 
    {

        private static const FIELD_MAX_CHARS:int = 253;
        private static const EMERGENCY_HELP_REQUEST_TITLE:String = "emergency_help_request";

        private var _disposed:Boolean;
        private var _habboHelp:HabboHelp;
        private var _window:_SafeStr_3133;
        private var _SafeStr_5239:ChatReportController;
        private var _SafeStr_5240:int = -1;
        private var _reportedUserName:String = "";
        private var _SafeStr_5241:int = -1;
        private var _reportedRoomName:String;
        private var _reportedRoomDescription:String;
        private var _SafeStr_5244:int = -1;
        private var _SafeStr_5245:int = -1;
        private var _SafeStr_5246:int = -1;
        private var _SafeStr_5242:String;
        private var _SafeStr_5243:int = -1;
        private var _SafeStr_3901:int;
        private var _SafeStr_5247:int;
        private var _SafeStr_5248:int;
        private var _SafeStr_4132:String;

        public function CallForHelpManager(_arg_1:HabboHelp)
        {
            _habboHelp = _arg_1;
            _SafeStr_5239 = new ChatReportController(_habboHelp, onChatReportEvent);
            _habboHelp.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_1011(onCallForHelpReply));
            _habboHelp.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_617(onIssueClose));
            _habboHelp.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_761(onCallForHelpResult));
        }

        private static function getCloseReasonKey(_arg_1:int):String
        {
            if (_arg_1 == 1)
            {
                return ("useless");
            };
            if (_arg_1 == 2)
            {
                return ("abusive");
            };
            return ("resolved");
        }


        public function dispose():void
        {
            if (!_disposed)
            {
                closeWindow();
                if (_SafeStr_5239)
                {
                    _SafeStr_5239.dispose();
                    _SafeStr_5239 = null;
                };
                _habboHelp = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get reportedUserId():int
        {
            return (_SafeStr_5240);
        }

        public function get reportedUserName():String
        {
            return (_reportedUserName);
        }

        public function get reportedRoomId():int
        {
            return (_SafeStr_5241);
        }

        public function get reportedRoomName():String
        {
            return (_reportedRoomName);
        }

        public function get reportedExtraDataId():String
        {
            return (_SafeStr_5242);
        }

        public function get reportedRoomObjectId():int
        {
            return (_SafeStr_5243);
        }

        public function get reportedGroupId():int
        {
            return (_SafeStr_5244);
        }

        public function get reportedThreadId():int
        {
            return (_SafeStr_5245);
        }

        public function get reportedMessageId():int
        {
            return (_SafeStr_5246);
        }

        public function set reportedUserId(_arg_1:int):void
        {
            _SafeStr_5240 = _arg_1;
        }

        public function set reportedUserName(_arg_1:String):void
        {
            _reportedUserName = _arg_1;
        }

        public function set reportedRoomId(_arg_1:int):void
        {
            _SafeStr_5241 = _arg_1;
        }

        public function set reportedRoomName(_arg_1:String):void
        {
            _reportedRoomName = _arg_1;
        }

        public function set reportedExtraDataId(_arg_1:String):void
        {
            _SafeStr_5242 = _arg_1;
        }

        public function set reportedRoomObjectId(_arg_1:int):void
        {
            _SafeStr_5243 = _arg_1;
        }

        public function set reportedGroupId(_arg_1:int):void
        {
            _SafeStr_5244 = _arg_1;
        }

        public function set reportedThreadId(_arg_1:int):void
        {
            _SafeStr_5245 = _arg_1;
        }

        public function set reportedMessageId(_arg_1:int):void
        {
            _SafeStr_5246 = _arg_1;
        }

        public function reportBully(_arg_1:int, _arg_2:int):void
        {
            if (_habboHelp.guardiansEnabled)
            {
                _SafeStr_5240 = _arg_1;
                _SafeStr_5241 = _arg_2;
                _habboHelp.queryForGuideReportingStatus(3);
            }
            else
            {
                reportUser(_arg_1, 1, 123);
            };
        }

        public function reportUser(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            _SafeStr_5240 = _arg_1;
            _SafeStr_5241 = -1;
            _SafeStr_5247 = _arg_3;
            _habboHelp.queryForPendingCallsForHelp(_arg_2);
        }

        public function reportRoom(_arg_1:int, _arg_2:String, _arg_3:String):void
        {
            _SafeStr_5241 = _arg_1;
            _reportedRoomName = _arg_2;
            _reportedRoomDescription = _arg_3;
            _SafeStr_5240 = -1;
            _habboHelp.queryForPendingCallsForHelp(4);
        }

        public function reportThread(_arg_1:int, _arg_2:int):void
        {
            _SafeStr_5244 = _arg_1;
            _SafeStr_5245 = _arg_2;
            _habboHelp.queryForPendingCallsForHelp(7);
        }

        public function reportMessage(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            _SafeStr_5244 = _arg_1;
            _SafeStr_5245 = _arg_2;
            _SafeStr_5246 = _arg_3;
            _habboHelp.queryForPendingCallsForHelp(8);
        }

        public function reportSelfie(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            _habboHelp.sendMessage(new _SafeStr_255(_arg_1, _arg_3, _arg_4, _arg_2, _arg_5));
        }

        public function reportPhoto(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):void
        {
            _habboHelp.setReportMessage(new _SafeStr_452(_arg_1, _arg_3, _arg_4, _arg_2, _arg_5));
            _habboHelp.queryForPendingCallsForHelp(9);
        }

        public function openEmergencyHelpRequest():void
        {
            reportUser(0, 1, -1);
        }

        private function showAbusiveNotice():void
        {
            closeWindow();
            _window = (_habboHelp.getXmlWindow("abusive_notice") as _SafeStr_3133);
            _window.center();
            _window.findChildByName("header_button_close").visible = false;
            _window.procedure = onAbusiveNoticeEvent;
        }

        public function showEmergencyHelpRequest(_arg_1:int):void
        {
            var _local_3:* = null;
            var _local_6:* = null;
            closeWindow();
            _SafeStr_3901 = _arg_1;
            if (_SafeStr_3901 == 6)
            {
                _window = (_habboHelp.getXmlWindow("bully_report") as _SafeStr_3133);
                _window.procedure = onBullyReportEvent;
            }
            else
            {
                _window = (_habboHelp.getXmlWindow("emergency_help_request") as _SafeStr_3133);
                _window.procedure = onEmergencyHelpRequestEvent;
                IIlluminaInputWidget(_SafeStr_3199(_window.findChildByName("help_message")).widget).maxChars = 253;
            };
            _window.center();
            var _local_4:IItemListWindow = (_window.findChildByName("user_panel") as IItemListWindow);
            var _local_5:IItemListWindow = (_window.findChildByName("room_panel") as IItemListWindow);
            var _local_2:ISelectorWindow = ISelectorWindow(_window.findChildByName("topic_selector"));
            if (_local_2 != null)
            {
                _local_3 = _local_2.getSelectableByName(("" + _SafeStr_5247));
                if (_local_3 != null)
                {
                    _local_2.setSelected(_local_3);
                };
                _local_6 = _local_2.getSelectableByName("123");
                if (((!(_local_6 == null)) && (_habboHelp.guardiansEnabled)))
                {
                    _local_6.visible = false;
                };
            };
            switch (_SafeStr_3901)
            {
                case 4:
                    showPanels(false, true);
                    return;
                case 1:
                    showPanels(true, false);
                    return;
                case 3:
                    showPanels(false, false);
                    return;
                case 7:
                case 8:
                    showPanels(false, false);
                    return;
                case 6:
                    populateUserList();
                default:
            };
        }

        private function showChatReportTool():void
        {
            closeWindow();
            _SafeStr_5239.show(_habboHelp.ownUserId, _SafeStr_5240, _SafeStr_3901);
        }

        private function showPanels(_arg_1:Boolean, _arg_2:Boolean):void
        {
            var _local_3:IItemListWindow = (_window.findChildByName("user_panel") as IItemListWindow);
            var _local_5:IItemListWindow = (_window.findChildByName("room_panel") as IItemListWindow);
            var _local_4:Boolean = ((_arg_1) || (_arg_2));
            _window.findChildByName("submit_box_wide").visible = _local_4;
            _window.findChildByName("submit_box_narrow").visible = (!(_local_4));
            _window.findChildByName("separator").visible = _local_4;
            _local_5.visible = _arg_2;
            _local_3.visible = _arg_1;
            if (_arg_2)
            {
                _local_5.getListItemByName("room_name").caption = ((_reportedRoomName != null) ? _reportedRoomName : "");
                _local_5.getListItemByName("room_description").caption = ((_reportedRoomDescription != null) ? _reportedRoomDescription : "");
            };
            if (_arg_1)
            {
                populateUserList();
            };
            if (!_local_4)
            {
                _window.width = 301;
            };
        }

        private function populateUserList():void
        {
            var _local_3:* = null;
            var _local_4:Boolean;
            var _local_2:IItemListWindow = (_window.findChildByName("user_list") as IItemListWindow);
            var _local_1:_SafeStr_3133 = (_local_2.getListItemAt(0) as _SafeStr_3133);
            _local_2.removeListItems();
            var _local_5:int;
            for each (var _local_6:UserRegistryItem in _habboHelp.userRegistry.getRegistry())
            {
                _local_3 = (_local_1.clone() as _SafeStr_3133);
                _local_4 = (_local_6.userId == _SafeStr_5240);
                _local_3.name = _local_6.userId.toString();
                _local_3.blend = ((_local_4) ? 1 : 0);
                _local_3.procedure = onUserSelectEvent;
                _local_3.findChildByName("user_name").caption = _local_6.userName;
                _local_3.findChildByName("room_name").id = _local_6.roomId;
                if (_local_4)
                {
                    _SafeStr_5241 = _local_6.roomId;
                };
                _local_3.findChildByName("room_name").caption = ((_local_6.roomName != "") ? _habboHelp.localization.getLocalizationWithParams("help.emergency.main.step.two.room.name", "", "room_name", _local_6.roomName) : "");
                _SafeStr_3289(_SafeStr_3199(_local_3.findChildByName("user_avatar")).widget).figure = _local_6.figure;
                _local_2.addListItemAt(_local_3, _local_5);
                if (_local_4)
                {
                    _local_5 = 1;
                };
            };
        }

        private function refreshUserList():void
        {
            var _local_3:int;
            var _local_2:* = null;
            var _local_1:IItemListWindow = (_window.findChildByName("user_list") as IItemListWindow);
            _local_3 = 0;
            while (_local_3 < _local_1.numListItems)
            {
                _local_2 = _SafeStr_3133(_local_1.getListItemAt(_local_3));
                _local_2.blend = ((_local_2.name == _SafeStr_5240) ? 1 : 0);
                _local_3++;
            };
        }

        public function showPendingRequest(_arg_1:String):void
        {
            closeWindow();
            _window = (_habboHelp.getXmlWindow("pending_request") as _SafeStr_3133);
            _window.findChildByName("request_message").caption = _arg_1;
            _window.center();
            _window.procedure = onPendingReuqestEvent;
        }

        private function closeWindow():void
        {
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function onAbusiveNoticeEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "close_button":
                        closeWindow();
                        return;
                };
            };
        }

        private function onEmergencyHelpRequestEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "submit_button":
                        if (!saveEmergencyHelpRequestData())
                        {
                            return;
                        };
                        basicInfoDone();
                        return;
                    case "header_button_close":
                        closeWindow();
                        return;
                };
            };
        }

        private function onBullyReportEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "submit_button":
                        if (_SafeStr_5240 > 0)
                        {
                            _habboHelp.sendMessage(new _SafeStr_792(_SafeStr_5240));
                            _habboHelp.sendMessage(new _SafeStr_292(_SafeStr_5240, _SafeStr_5241));
                            closeWindow();
                        }
                        else
                        {
                            _habboHelp.windowManager.alert("${generic.alert.title}", "${guide.bully.request.usermissing}", 0, null);
                        };
                        return;
                    case "header_button_close":
                        closeWindow();
                        return;
                };
            };
        }

        private function onChatReportEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "submit_button":
                        if (_SafeStr_5239.collectSelectedEntries(_SafeStr_3901, -1).length == 0)
                        {
                            _habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.chatmissing}", 0, null);
                            return;
                        };
                        submitCallForHelp();
                        _SafeStr_5239.closeWindow();
                        closeWindow();
                        return;
                    case "header_button_close":
                        _SafeStr_5239.closeWindow();
                        return;
                };
            };
        }

        private function onUserSelectEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                selectUserToReport((_arg_2 as _SafeStr_3133));
            };
        }

        private function selectUserToReport(_arg_1:_SafeStr_3133):void
        {
            if ((((_window == null) || (!(_window.name == "emergency_help_request"))) || (_arg_1 == null)))
            {
                return;
            };
            var _local_2:int = _arg_1.name;
            if (_SafeStr_5240 == _local_2)
            {
                _SafeStr_5240 = 0;
                _SafeStr_5241 = -1;
            }
            else
            {
                _SafeStr_5240 = _local_2;
                _SafeStr_5241 = _arg_1.findChildByName("room_name").id;
            };
            refreshUserList();
        }

        private function basicInfoDone():void
        {
            var _local_1:Boolean = isChatSelectionRequired();
            if (_SafeStr_3901 == 3)
            {
                if (!_habboHelp.instantMessageRegistry.hasUserChatted(_SafeStr_5240))
                {
                    _habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.nochathistory}", 0, null);
                };
            }
            else
            {
                if ((((_local_1) && (!(_habboHelp.chatRegistry.hasContentWithoutChatFromUser(_habboHelp.ownUserId)))) && (_habboHelp.chatRegistry.hasContentWithoutChatFromUser(_SafeStr_5240))))
                {
                    _habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.nochathistory}", 0, null);
                    return;
                };
            };
            if (_local_1)
            {
                showChatReportTool();
            }
            else
            {
                submitCallForHelp();
            };
        }

        private function isChatSelectionRequired():Boolean
        {
            if ((((_SafeStr_3901 == 7) || (_SafeStr_3901 == 8)) || (_SafeStr_3901 == 4)))
            {
                return (false);
            };
            return (((_SafeStr_5240 <= 0) || (_habboHelp.chatRegistry.getItemsByUser(_SafeStr_5240).length > 0)) || (_SafeStr_3901 == 3));
        }

        private function saveEmergencyHelpRequestData(_arg_1:Boolean=true):Boolean
        {
            if (((_window == null) || (!(_window.name == "emergency_help_request"))))
            {
                return (false);
            };
            _SafeStr_4132 = IIlluminaInputWidget(_SafeStr_3199(_window.findChildByName("help_message")).widget).message;
            if (((_SafeStr_4132 == null) || (_SafeStr_4132 == "")))
            {
                _habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.nomsg}", 0, null);
                return (false);
            };
            if (_SafeStr_4132.length < _habboHelp.getInteger("help.cfh.length.minimum", 15))
            {
                _habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.msgtooshort}", 0, null);
                return (false);
            };
            _SafeStr_5248 = 0;
            var _local_2:ISelectableWindow = ISelectorWindow(_window.findChildByName("topic_selector")).getSelected();
            if (_local_2 != null)
            {
                _SafeStr_5248 = _local_2.name;
            };
            if (_SafeStr_5248 == 0)
            {
                _habboHelp.windowManager.alert("${generic.alert.title}", "${help.cfh.error.notopic}", 0, null);
                return (false);
            };
            if (((_SafeStr_3901 == 8) || (_SafeStr_3901 == 7)))
            {
                return (true);
            };
            if ((((_SafeStr_5240 <= 0) && ((!(_SafeStr_3901 == 8)) && (_SafeStr_3901 == 7))) || ((_SafeStr_3901 == 4) && (!(_habboHelp.getBoolean("room.report.enabled"))))))
            {
                _habboHelp.windowManager.alert("${generic.alert.title}", "${guide.bully.request.usermissing}", 0, null);
                return (false);
            };
            if (_habboHelp.friendList.getFriend(_SafeStr_5240) != null)
            {
                _habboHelp.windowManager.confirm("${help.cfh.unfriend.confirm.title}", "${help.cfh.unfriend.confirm.message}", (0x10 | 0x20), onFriendReportConfirmation);
                return (false);
            };
            return (true);
        }

        private function submitCallForHelp():void
        {
            var _local_1:int;
            closeWindow();
            switch (_SafeStr_3901)
            {
                case 1:
                case 4:
                    _local_1 = ((_SafeStr_5239.reportedRoomId <= 0) ? _SafeStr_5241 : _SafeStr_5239.reportedRoomId);
                    _habboHelp.sendMessage(new _SafeStr_350(_SafeStr_4132, _SafeStr_5248, _SafeStr_5240, _local_1, _SafeStr_5239.collectSelectedEntries(_SafeStr_3901, -1)));
                    break;
                case 3:
                    _habboHelp.sendMessage(new _SafeStr_621(_SafeStr_4132, _SafeStr_5248, _SafeStr_5240, _SafeStr_5239.collectSelectedEntries(3, -1)));
                    break;
                case 7:
                    _habboHelp.sendMessage(new _SafeStr_359(_SafeStr_5244, _SafeStr_5245, _SafeStr_5248, _SafeStr_4132));
                    break;
                case 8:
                    _habboHelp.sendMessage(new _SafeStr_377(_SafeStr_5244, _SafeStr_5245, _SafeStr_5246, _SafeStr_5248, _SafeStr_4132));
                default:
            };
            _habboHelp.ignoreAndUnfriendReportedUser();
        }

        private function onFriendReportConfirmation(_arg_1:_SafeStr_3114, _arg_2:_SafeStr_3116):void
        {
            if (_arg_2.type == "WE_OK")
            {
                basicInfoDone();
            };
            _arg_1.dispose();
        }

        private function onPendingReuqestEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "keep_button":
                    case "header_button_close":
                        closeWindow();
                        return;
                    case "discard_button":
                        deletePendingCallsForHelp();
                        closeWindow();
                        return;
                };
            };
        }

        private function onCallForHelpReply(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1169 = _SafeStr_1011(_arg_1).getParser();
            _habboHelp.windowManager.alert("${help.cfh.reply.title}", _local_2.message, 0, null);
        }

        private function onCallForHelpResult(_arg_1:IMessageEvent):void
        {
            var _local_3:_SafeStr_1261 = _SafeStr_761(_arg_1).getParser();
            var _local_4:int = _local_3.resultType;
            var _local_2:String = _local_3.messageText;
            switch (_local_4)
            {
                case 1:
                    _habboHelp.queryForPendingCallsForHelp(1);
                    return;
                case 2:
                    showAbusiveNotice();
                    return;
                default:
                    if (_local_2 == "")
                    {
                        _local_2 = "${help.cfh.sent.text}";
                    };
                    _habboHelp.windowManager.alert("${help.cfh.sent.title}", _local_2, 0, null);
            };
        }

        private function onIssueClose(_arg_1:_SafeStr_617):void
        {
            var _local_3:_SafeStr_1384 = _arg_1.getParser();
            var _local_2:String = _local_3.messageText;
            if (_local_2 == "")
            {
                _local_2 = (("${help.cfh.closed." + getCloseReasonKey(_local_3.closeReason)) + "}");
            };
            _habboHelp.windowManager.alert("${mod.alert.title}", _local_2, 0, null);
        }

        private function deletePendingCallsForHelp():void
        {
            _habboHelp.sendMessage(new _SafeStr_417());
        }

        public function get chatReportController():ChatReportController
        {
            return (_SafeStr_5239);
        }


    }
}//package com.sulake.habbo.help

// _SafeStr_1011 = "_-C12" (String#27530, DoABC#4)
// _SafeStr_1169 = "_-R1B" (String#41426, DoABC#4)
// _SafeStr_1261 = "_-cj" (String#31849, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1384 = "_-R1n" (String#41497, DoABC#4)
// _SafeStr_255 = "_-j1K" (String#30718, DoABC#4)
// _SafeStr_292 = "_-a1K" (String#17255, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3114 = "_-b1E" (String#1258, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_350 = "_-713" (String#12120, DoABC#4)
// _SafeStr_359 = "_-t1c" (String#18913, DoABC#4)
// _SafeStr_377 = "_-h10" (String#17609, DoABC#4)
// _SafeStr_3901 = "_-K1j" (String#2996, DoABC#4)
// _SafeStr_4132 = "_-s1S" (String#1283, DoABC#4)
// _SafeStr_417 = "_-X1f" (String#30870, DoABC#4)
// _SafeStr_452 = "_-01u" (String#20211, DoABC#4)
// _SafeStr_5239 = "_-Q14" (String#4874, DoABC#4)
// _SafeStr_5240 = "_-T19" (String#2194, DoABC#4)
// _SafeStr_5241 = "_-Zs" (String#3171, DoABC#4)
// _SafeStr_5242 = "_-129" (String#20680, DoABC#4)
// _SafeStr_5243 = "_-21r" (String#20267, DoABC#4)
// _SafeStr_5244 = "_-12C" (String#7651, DoABC#4)
// _SafeStr_5245 = "_-F1R" (String#7716, DoABC#4)
// _SafeStr_5246 = "_-tm" (String#11385, DoABC#4)
// _SafeStr_5247 = "_-a1" (String#19023, DoABC#4)
// _SafeStr_5248 = "_-32a" (String#7663, DoABC#4)
// _SafeStr_617 = "_-Ab" (String#23111, DoABC#4)
// _SafeStr_621 = "_-Y1O" (String#16623, DoABC#4)
// _SafeStr_761 = "_-61f" (String#23812, DoABC#4)
// _SafeStr_792 = "_-A1E" (String#12364, DoABC#4)


