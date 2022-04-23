// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.help.TopicsFlowHelpController

package com.sulake.habbo.help
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.window._SafeStr_3133;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.components.IItemListWindow;
    import _-v1p._SafeStr_1680;
    import com.sulake.habbo.window.widgets.IIlluminaInputWidget;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import _-51c._SafeStr_452;
    import _-51c._SafeStr_621;
    import _-51c._SafeStr_350;
    import _-51c._SafeStr_359;
    import _-51c._SafeStr_377;
    import _-51c._SafeStr_292;
    import com.sulake.habbo.help.cfh.registry.user.UserRegistryItem;
    import com.sulake.habbo.window.widgets._SafeStr_3289;
    import com.sulake.core.window.components.ITextWindow;
    import _-v1p._SafeStr_1638;
    import com.sulake.habbo.help.cfh.registry.chat.ChatRegistryItem;
    import com.sulake.core.window.components.ITextLinkWindow;
    import com.sulake.core.window.components._SafeStr_3158;
    import com.sulake.habbo.help.cfh.registry.instantmessage.InstantMessageRegistryItem;

    public class TopicsFlowHelpController implements _SafeStr_13 
    {

        private static const START_CONTAINER:String = "start_container";
        private static const HELP_CONTAINER:String = "help_container";
        private static const USERS_CONTAINER:String = "users_container";
        private static const USER_CONTAINER:String = "user";
        private static const REASON_CONTAINER:String = "reason_container";
        private static const TOPIC_CONTAINER:String = "topic_container";
        private static const MESSAGE_CONTAINER:String = "message_container";
        private static const CHAT_CONTAINER:String = "chat_container";
        private static const BACK_BUTTON:String = "back_button";
        private static const SUMMARY_CONTAINER:String = "summary_container";
        private static const CONTINUE_BUTTON:String = "continue_button";
        private static const REQUIRES_CONTINUE_BUTTON:Array = ["users_container", "message_container", "chat_container"];
        private static const REQUIRES_USER_DATA:Array = ["reason_container", "message_container", "chat_container", "summary_container"];
        private static const FIELD_MAX_CHARS:int = 253;
        private static const TOPIC_NAME_BULLYING:String = "bullying";
        private static const TOPIC_NAME_BAD_USER_NAME:String = "habbo_name";

        private var _habboHelp:HabboHelp;
        private var _disposed:Boolean = false;
        private var _SafeStr_4681:IModalDialog;
        private var _SafeStr_3882:_SafeStr_3133;
        private var _containers:Vector.<String>;
        private var _SafeStr_4682:IItemListWindow;
        private var _SafeStr_4683:IItemListWindow;
        private var _SafeStr_4680:IItemListWindow;
        private var _SafeStr_4687:_SafeStr_3133;
        private var _SafeStr_4688:_SafeStr_3133;
        private var _SafeStr_4689:_SafeStr_3133;
        private var _SafeStr_4684:String = "start_container";
        private var _SafeStr_4679:_SafeStr_1680;
        private var _SafeStr_4132:String;
        private var _reportedUserName:String;
        private var _SafeStr_4685:int = -1;
        private var _SafeStr_4686:Boolean = false;

        public function TopicsFlowHelpController(_arg_1:HabboHelp)
        {
            _habboHelp = _arg_1;
            _containers = new Vector.<String>(0);
            _containers.push("start_container", "help_container", "users_container", "user", "reason_container", "message_container", "chat_container", "back_button", "summary_container");
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            closeWindow();
            _habboHelp = null;
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function openReportingUserName():void
        {
            _SafeStr_4686 = true;
            showReportingDialog(-1, false);
            _SafeStr_4679 = getTopic("habbo_name");
            _SafeStr_3882.findChildByName("message_phase_title").caption = ((_habboHelp.localization.getLocalization("generic.reason") + " ") + _habboHelp.localization.getLocalization(("help.cfh.topic." + _SafeStr_4679.id)));
            showContainer("message_container");
        }

        public function openReportingChatLineSelection():void
        {
            showReportingDialog(-1, true);
            if (!userChatLinesAvailable())
            {
                return;
            };
            showContainer("chat_container");
            populateChatMessage();
        }

        public function openReportingContentReasonCategory(_arg_1:int):Boolean
        {
            showReportingDialog(_arg_1, false);
            var _local_2:Boolean = showReasons(_arg_1);
            if (!_local_2)
            {
                closeWindow();
            };
            return (_local_2);
        }

        public function openReportingIMSelection():void
        {
            showReportingDialog(3, false);
            showContainer("chat_container");
            populateInstantMessages();
            if (_SafeStr_4680.numListItems == 0)
            {
                _habboHelp.windowManager.alertWithModal("${generic.alert.title}", "${help.cfh.error.no_user_data}", 0, null);
                closeWindow();
            };
        }

        private function showReportingDialog(_arg_1:int, _arg_2:Boolean):void
        {
            _SafeStr_4685 = _arg_1;
            if (_SafeStr_4681 == null)
            {
                openWindow();
            };
            _SafeStr_3882.findChildByName("change_user").visible = _arg_2;
        }

        private function openWindow():void
        {
            if (((_SafeStr_4681 == null) && (!(disposed))))
            {
                _SafeStr_4681 = _habboHelp.getModalXmlWindow("topics_flow_help");
                _SafeStr_4681.rootWindow.procedure = windowEventProcedure;
                _SafeStr_3882 = (_SafeStr_4681.rootWindow as _SafeStr_3133);
                _SafeStr_4682 = (_SafeStr_3882.findChildByName("user_list") as IItemListWindow);
                _SafeStr_4683 = (_SafeStr_3882.findChildByName("reason_list") as IItemListWindow);
                _SafeStr_4680 = (_SafeStr_3882.findChildByName("chat_list") as IItemListWindow);
                _SafeStr_4687 = (_SafeStr_4682.getListItemAt(0) as _SafeStr_3133);
                _SafeStr_4688 = (_SafeStr_4683.getListItemAt(0) as _SafeStr_3133);
                _SafeStr_4689 = (_SafeStr_4680.getListItemAt(0) as _SafeStr_3133);
                _SafeStr_4682.removeListItems();
                _SafeStr_4683.removeListItems();
                _SafeStr_4680.removeListItems();
                IIlluminaInputWidget(_SafeStr_3199(_SafeStr_3882.findChildByName("help_message")).widget).maxChars = 253;
                deselectChatEntries();
            };
        }

        public function closeWindow():void
        {
            if (_SafeStr_4681 != null)
            {
                _SafeStr_4681.dispose();
                _SafeStr_4681 = null;
            };
            _SafeStr_4684 = "start_container";
        }

        public function toggleWindow():void
        {
            if (_SafeStr_4681 == null)
            {
                _SafeStr_4685 = -1;
                openWindow();
                showContainer("start_container");
            }
            else
            {
                closeWindow();
            };
        }

        private function showContainer(_arg_1:String):void
        {
            for each (var _local_2:String in _containers)
            {
                _SafeStr_3882.findChildByName(_local_2).visible = false;
            };
            _SafeStr_3882.findChildByName("continue_button").visible = (REQUIRES_CONTINUE_BUTTON.indexOf(_arg_1) > -1);
            _SafeStr_3882.findChildByName("user").visible = (REQUIRES_USER_DATA.indexOf(_arg_1) > -1);
            _SafeStr_4684 = _arg_1;
            updateBackButtonVisibility();
            _SafeStr_3882.findChildByName(_arg_1).visible = true;
            if (REQUIRES_USER_DATA.indexOf(_arg_1) > -1)
            {
                updateUserData();
            };
        }

        private function updateBackButtonVisibility():void
        {
            var _local_1:Boolean = true;
            if (_SafeStr_4684 == "start_container")
            {
                _local_1 = false;
            }
            else
            {
                if (_SafeStr_4685 == 3)
                {
                    _local_1 = (!(_SafeStr_4684 == "chat_container"));
                }
                else
                {
                    if (_SafeStr_4685 > -1)
                    {
                        _local_1 = (!(_SafeStr_4684 == "reason_container"));
                    }
                    else
                    {
                        if (_SafeStr_4686)
                        {
                            _local_1 = (!(_SafeStr_4684 == "message_container"));
                        };
                    };
                };
            };
            _SafeStr_3882.findChildByName("back_button").visible = _local_1;
        }

        private function verifyUserSelected():Boolean
        {
            if (_habboHelp.reportedUserId == -1)
            {
                _habboHelp.windowManager.alertWithModal("${generic.alert.title}", "${guide.bully.request.usermissing}", 0, null);
                return (false);
            };
            return (true);
        }

        private function verifyMessage():Boolean
        {
            _SafeStr_4132 = IIlluminaInputWidget(_SafeStr_3199(_SafeStr_3882.findChildByName("help_message")).widget).message;
            if (((_SafeStr_4132 == null) || (_SafeStr_4132 == "")))
            {
                _habboHelp.windowManager.alertWithModal("${generic.alert.title}", "${help.cfh.error.nomsg}", 0, null);
                return (false);
            };
            if (_SafeStr_4132.length < _habboHelp.getInteger("help.cfh.length.minimum", 15))
            {
                _habboHelp.windowManager.alertWithModal("${generic.alert.title}", "${help.cfh.error.msgtooshort}", 0, null);
                return (false);
            };
            return (true);
        }

        private function verifySelectedChatLines():Boolean
        {
            var _local_1:Array = _habboHelp.callForHelpManager.chatReportController.collectSelectedEntries(_SafeStr_4685, _habboHelp.reportedUserId);
            if (((_local_1 == null) || (_local_1.length == 0)))
            {
                _habboHelp.windowManager.alertWithModal("${generic.alert.title}", "${help.cfh.error.chatmissing}", 0, null);
                return (false);
            };
            return (true);
        }

        private function windowEventProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((disposed) || (!(_arg_1.type == "WME_CLICK"))))
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "header_button_close":
                    closeWindow();
                    return;
                case "back_button":
                    switch (_SafeStr_4684)
                    {
                        case "reason_container":
                            showContainer("chat_container");
                            break;
                        case "topic_container":
                        case "message_container":
                            showContainer("reason_container");
                            populateReasons();
                            break;
                        case "chat_container":
                            if (populateUsers())
                            {
                                showContainer("users_container");
                            }
                            else
                            {
                                showContainer("start_container");
                            };
                            break;
                        case "summary_container":
                            showContainer("message_container");
                            break;
                        default:
                            showContainer("start_container");
                    };
                    return;
                case "continue_button":
                    switch (_SafeStr_4684)
                    {
                        case "users_container":
                            if (verifyUserSelected())
                            {
                                showContainer("chat_container");
                                populateChatMessage();
                            };
                            break;
                        case "message_container":
                            if (verifyMessage())
                            {
                                showContainer("summary_container");
                            };
                            break;
                        case "chat_container":
                            if (verifySelectedChatLines())
                            {
                                showContainer("reason_container");
                                populateReasons();
                            };
                            break;
                        default:
                            showContainer("start_container");
                    };
                    return;
                case "button_habbo_help":
                    showContainer("help_container");
                    return;
                case "button_user_report":
                case "change_user":
                    if (populateUsers())
                    {
                        showContainer("users_container");
                    }
                    else
                    {
                        _habboHelp.windowManager.alertWithModal("${generic.alert.title}", "${help.cfh.error.nochathistory}", 0, null);
                    };
                    return;
                case "button_account":
                    HabboWebTools.openWebPage(_habboHelp.getProperty("zendesk.url"), "habboMain");
                    _habboHelp.trackGoogle("helpWindow", "click_selfHelp");
                    closeWindow();
                    return;
                case "tour_button":
                    _habboHelp.guideHelpManager.createHelpRequest(((_habboHelp.newIdentity) ? 0 : 2));
                    _habboHelp.trackGoogle("helpWindow", "click_userTour");
                    closeWindow();
                    return;
                case "bully_button":
                    closeWindow();
                    _habboHelp.toggleNewHelpWindow();
                    _habboHelp.trackGoogle("helpWindow", "click_reportBully");
                    return;
                case "instructions_button":
                    _habboHelp.guideHelpManager.createHelpRequest(1);
                    _habboHelp.trackGoogle("helpWindow", "click_instructions");
                    closeWindow();
                    return;
                case "safetybooklet_link":
                    _habboHelp.showSafetyBooklet();
                    _habboHelp.trackGoogle("helpWindow", "click_showSafetyBooklet");
                    closeWindow();
                    return;
                case "habboway_link":
                    if (_habboHelp.getBoolean("habboway.enabled"))
                    {
                        _habboHelp.showHabboWay();
                    }
                    else
                    {
                        HabboWebTools.openWebPage(_habboHelp.getProperty("habboway.url"), "habboMain");
                    };
                    _habboHelp.trackGoogle("helpWindow", "click_habboWay");
                    closeWindow();
                    return;
                case "faq_link":
                    _habboHelp.openCfhFaq();
                    return;
                case "sanction_info_link":
                    _habboHelp.requestSanctionInfo(false);
                    closeWindow();
                    return;
                case "submit_button":
                    if (_SafeStr_4679)
                    {
                        submitCallForHelp(true);
                        closeWindow();
                    }
                    else
                    {
                        _habboHelp.windowManager.alertWithModal("${generic.alert.title}", "${help.cfh.error.notopic}", 0, null);
                    };
                    return;
                default:
                    return;
            };
        }

        public function submitCallForHelp(_arg_1:Boolean):void
        {
            if ((((!(_SafeStr_4132)) || (!(_SafeStr_4679))) || (!(_habboHelp))))
            {
                return;
            };
            _habboHelp.ignoreAndUnfriendReportedUser();
            switch (_SafeStr_4685)
            {
                case 9:
                    _habboHelp.sendMessage(new _SafeStr_452(_habboHelp.reportedExtraDataId, _habboHelp.reportedRoomId, _habboHelp.reportedUserId, _SafeStr_4679.id, _habboHelp.reportedRoomObjectId));
                    return;
                case 3:
                    _habboHelp.sendMessage(new _SafeStr_621(_SafeStr_4132, _SafeStr_4679.id, _habboHelp.reportedUserId, _habboHelp.callForHelpManager.chatReportController.collectSelectedEntries(3, _habboHelp.reportedUserId)));
                    return;
                case 4:
                    _habboHelp.sendMessage(new _SafeStr_350(_SafeStr_4132, _SafeStr_4679.id, -1, _habboHelp.reportedRoomId, []));
                    return;
                case 7:
                    _habboHelp.sendMessage(new _SafeStr_359(_habboHelp.callForHelpManager.reportedGroupId, _habboHelp.callForHelpManager.reportedThreadId, _SafeStr_4679.id, _SafeStr_4132));
                    return;
                case 8:
                    _habboHelp.sendMessage(new _SafeStr_377(_habboHelp.callForHelpManager.reportedGroupId, _habboHelp.callForHelpManager.reportedThreadId, _habboHelp.callForHelpManager.reportedMessageId, _SafeStr_4679.id, _SafeStr_4132));
                    return;
                default:
                    if (((((_arg_1) && (_SafeStr_4679.name == "bullying")) && (_habboHelp.getBoolean("guides.enabled"))) && (_habboHelp.guardiansEnabled)))
                    {
                        _habboHelp.sendMessage(new _SafeStr_292(_habboHelp.reportedUserId, _habboHelp.reportedRoomId));
                    }
                    else
                    {
                        _habboHelp.sendMessage(new _SafeStr_350(_SafeStr_4132, _SafeStr_4679.id, _habboHelp.reportedUserId, _habboHelp.reportedRoomId, _habboHelp.callForHelpManager.chatReportController.collectSelectedEntries(1, -1)));
                    };
            };
        }

        private function populateUsers():Boolean
        {
            var _local_5:*;
            var _local_1:* = null;
            var _local_2:Boolean;
            _SafeStr_4682.removeListItems();
            var _local_3:int;
            var _local_6:Boolean;
            for each (var _local_4:UserRegistryItem in _habboHelp.userRegistry.getRegistry())
            {
                _local_5 = _habboHelp.chatRegistry.getItemsByUser(_local_4.userId);
                if (_local_5.length != 0)
                {
                    _local_1 = (_SafeStr_4687.clone() as _SafeStr_3133);
                    _local_2 = (_local_4.userId == _habboHelp.reportedUserId);
                    _local_1.name = _local_4.userId.toString();
                    _local_1.findChildByName("user_bg").blend = ((_local_2) ? 1 : 0);
                    _local_1.procedure = onUserSelectEvent;
                    _local_1.findChildByName("user_name").caption = _local_4.userName;
                    _local_1.findChildByName("room_name").id = _local_4.roomId;
                    if (_local_2)
                    {
                        _habboHelp.reportedRoomId = _local_4.roomId;
                    };
                    _local_1.findChildByName("room_name").caption = ((_local_4.roomName != "") ? _habboHelp.localization.getLocalizationWithParams("help.emergency.main.step.two.room.name", "", "room_name", _local_4.roomName) : "");
                    _SafeStr_3289(_SafeStr_3199(_local_1.findChildByName("user_avatar")).widget).figure = _local_4.figure;
                    _SafeStr_4682.addListItemAt(_local_1, _local_3);
                    if (_local_2)
                    {
                        _local_3 = 1;
                        _local_6 = true;
                    };
                };
            };
            if (!_local_6)
            {
                _habboHelp.reportedUserId = -1;
                _habboHelp.reportedRoomId = -1;
            };
            return (_SafeStr_4682.numListItems > 0);
        }

        private function refreshUserList():void
        {
            var _local_2:int;
            var _local_1:* = null;
            _local_2 = 0;
            while (_local_2 < _SafeStr_4682.numListItems)
            {
                _local_1 = _SafeStr_3133(_SafeStr_4682.getListItemAt(_local_2));
                _local_1.findChildByName("user_bg").blend = ((_local_1.name == _habboHelp.reportedUserId) ? 1 : 0);
                _local_2++;
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
            var _local_2:int = _arg_1.name;
            _habboHelp.reportedUserId = _local_2;
            _habboHelp.reportedRoomId = _arg_1.findChildByName("room_name").id;
            refreshUserList();
        }

        private function populateRoomReportButton():void
        {
            _SafeStr_4683.destroyListItems();
            var _local_3:int = _SafeStr_4683.height;
            _SafeStr_4683.height = 0;
            _SafeStr_4683.height = _local_3;
            var _local_2:int = 34;
            var _local_5:String = "inappropiate_room_group_event";
            var _local_4:_SafeStr_3133 = (_SafeStr_4688.clone() as _SafeStr_3133);
            _habboHelp.localization.registerParameter(("help.cfh.topic." + _local_2), "name", _reportedUserName);
            var _local_1:ITextWindow = (_local_4.findChildByName("name") as ITextWindow);
            _local_1.caption = (("${help.cfh.topic." + _local_2) + "}");
            if (_local_1.height < _local_1.textHeight)
            {
                _local_1.height = (_local_1.textHeight + 5);
            };
            if (_local_4.height < ((_local_1.height + (_local_1.y * 2)) + 5))
            {
                _local_4.height = ((_local_1.height + (_local_1.y * 2)) + 5);
            };
            _local_4.name = _local_5;
            _local_4.addEventListener("WME_CLICK", onReportTopic);
            _SafeStr_4683.addListItem(_local_4);
        }

        private function populateReasons():void
        {
            var _local_1:* = null;
            _SafeStr_4683.destroyListItems();
            for each (var _local_2:_SafeStr_1638 in _habboHelp.callForHelpCategories)
            {
                _local_1 = (_SafeStr_4688.clone() as _SafeStr_3133);
                _local_1.findChildByName("name").caption = (("${help.cfh.reason." + _local_2.name) + "}");
                _local_1.name = _local_2.name;
                _local_1.addEventListener("WME_CLICK", populateTopicsEvent);
                _SafeStr_4683.addListItem(_local_1);
            };
        }

        private function populateTopicsEvent(_arg_1:_SafeStr_3116):void
        {
            var _local_2:_SafeStr_3109 = _arg_1.target;
            populateTopics(_local_2.name);
        }

        private function populateTopics(_arg_1:String):Boolean
        {
            var _local_5:*;
            var _local_3:int;
            var _local_4:* = null;
            var _local_2:* = null;
            for each (var _local_7:_SafeStr_1638 in _habboHelp.callForHelpCategories)
            {
                if (_local_7.name == _arg_1)
                {
                    _local_5 = _local_7.topics;
                    break;
                };
            };
            if (((_local_5) && (_local_5.length > 0)))
            {
                _SafeStr_4683.destroyListItems();
                _local_3 = _SafeStr_4683.height;
                _SafeStr_4683.height = 0;
                _SafeStr_4683.height = _local_3;
                for each (var _local_6:_SafeStr_1680 in _local_5)
                {
                    _local_4 = (_SafeStr_4688.clone() as _SafeStr_3133);
                    _habboHelp.localization.registerParameter(("help.cfh.topic." + _local_6.id), "name", _reportedUserName);
                    _local_2 = (_local_4.findChildByName("name") as ITextWindow);
                    _local_2.caption = (("${help.cfh.topic." + _local_6.id) + "}");
                    if (_local_2.height < _local_2.textHeight)
                    {
                        _local_2.height = (_local_2.textHeight + 5);
                    };
                    if (_local_4.height < ((_local_2.height + (_local_2.y * 2)) + 5))
                    {
                        _local_4.height = ((_local_2.height + (_local_2.y * 2)) + 5);
                    };
                    _local_4.name = _local_6.name;
                    _local_4.addEventListener("WME_CLICK", onReportTopic);
                    _SafeStr_4683.addListItem(_local_4);
                };
                _SafeStr_4684 = "topic_container";
                updateBackButtonVisibility();
            }
            else
            {
                return (false);
            };
            return (true);
        }

        private function populateChatMessage():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            var _local_3:* = null;
            _SafeStr_4680.removeListItems();
            _habboHelp.chatRegistry.holdPurges = true;
            var _local_4:Vector.<ChatRegistryItem> = ((_habboHelp.reportedUserId > 0) ? _habboHelp.chatRegistry.getItemsByUser(_habboHelp.reportedUserId) : _habboHelp.chatRegistry.getItems());
            _SafeStr_14.log(((("Found chat items: " + _local_4.length) + " from user:") + _habboHelp.reportedUserId));
            for each (var _local_5:ChatRegistryItem in _local_4)
            {
                if (_local_5.userId != _habboHelp.ownUserId)
                {
                    _local_1 = (_SafeStr_4689.clone() as _SafeStr_3133);
                    _local_2 = (_local_1.findChildByName("chat_text") as ITextLinkWindow);
                    _local_2.caption = _local_5.text;
                    if (_local_2.height < _local_2.textHeight)
                    {
                        _local_2.height = (_local_2.textHeight + 5);
                    };
                    if (_local_1.height < (_local_2.height + (_local_2.y * 2)))
                    {
                        _local_1.height = (_local_2.height + (_local_2.y * 2));
                    };
                    _local_1.id = _local_5.index;
                    _local_1.procedure = onChatEntryEvent;
                    _local_3 = (_local_1.findChildByName("chat_check") as _SafeStr_3158);
                    _local_3.isSelected = _local_5.selected;
                    _SafeStr_4680.addListItem(_local_1);
                };
            };
        }

        private function deselectChatEntries():void
        {
            for each (var _local_2:Vector.<InstantMessageRegistryItem> in _habboHelp.instantMessageRegistry.getItems())
            {
                for each (var _local_3:InstantMessageRegistryItem in _local_2)
                {
                    _local_3.selected = false;
                };
            };
            for each (var _local_1:ChatRegistryItem in _habboHelp.chatRegistry.getItems())
            {
                _local_1.selected = false;
            };
        }

        private function onChatEntryEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:int;
            var _local_4:* = null;
            var _local_5:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                _local_3 = _arg_2.id;
                if ((_arg_2 is ITextLinkWindow))
                {
                    _local_3 = _arg_2.parent.id;
                    _local_4 = ((_arg_2.parent as _SafeStr_3133).findChildByName("chat_check") as _SafeStr_3158);
                };
                if ((_arg_2 is _SafeStr_3158))
                {
                    _local_3 = _arg_2.parent.id;
                    _local_4 = (_arg_2 as _SafeStr_3158);
                };
                _local_5 = _habboHelp.chatRegistry.getItem(_local_3);
                if (!_local_5)
                {
                    return;
                };
                if (((!(_local_5.selected)) && (!(_local_5.roomId == _habboHelp.reportedRoomId))))
                {
                    _habboHelp.reportedRoomId = _local_5.roomId;
                };
                _local_5.selected = (!(_local_5.selected));
                _local_4.isSelected = _local_5.selected;
            };
        }

        private function populateInstantMessages():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            _SafeStr_4680.removeListItems();
            _habboHelp.instantMessageRegistry.holdPurges = true;
            var _local_3:Vector.<InstantMessageRegistryItem> = _habboHelp.instantMessageRegistry.getItemsByUser(_habboHelp.reportedUserId);
            for each (var _local_4:InstantMessageRegistryItem in _local_3)
            {
                _local_1 = (_SafeStr_4689.clone() as _SafeStr_3133);
                _local_1.findChildByName("chat_text").caption = _local_4.text;
                _local_1.id = _local_4.index;
                _local_1.procedure = onInstantMessageEntryEvent;
                _local_2 = (_local_1.findChildByName("chat_check") as _SafeStr_3158);
                _local_2.isSelected = _local_4.selected;
                _SafeStr_4680.addListItem(_local_1);
            };
        }

        private function onInstantMessageEntryEvent(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:int;
            var _local_4:* = null;
            var _local_5:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                _local_3 = _arg_2.id;
                if ((_arg_2 is ITextLinkWindow))
                {
                    _local_3 = _arg_2.parent.id;
                    _local_4 = ((_arg_2.parent as _SafeStr_3133).findChildByName("chat_check") as _SafeStr_3158);
                }
                else
                {
                    if ((_arg_2 is _SafeStr_3158))
                    {
                        _local_3 = _arg_2.parent.id;
                        _local_4 = (_arg_2 as _SafeStr_3158);
                    };
                };
                _local_5 = _habboHelp.instantMessageRegistry.getItem(_habboHelp.reportedUserId, _local_3);
                if (_local_5)
                {
                    _local_5.selected = (!(_local_5.selected));
                    _local_4.isSelected = _local_5.selected;
                };
            };
        }

        private function onReportTopic(_arg_1:_SafeStr_3116=null):void
        {
            if (_SafeStr_4681 == null)
            {
                openWindow();
            };
            _SafeStr_4679 = getTopic(_arg_1.target.name);
            showContainer("message_container");
        }

        private function isNotNeededToSelectUser():Boolean
        {
            return (((_SafeStr_4685 == 4) || (_SafeStr_4685 == 7)) || (_SafeStr_4685 == 8));
        }

        private function showReasons(_arg_1:int):Boolean
        {
            if (((isNotNeededToSelectUser()) || (verifyUserSelected())))
            {
                showContainer("reason_container");
                if (_arg_1 == 4)
                {
                    populateRoomReportButton();
                }
                else
                {
                    populateReasons();
                };
                return (true);
            };
            return (false);
        }

        private function userChatLinesAvailable():Boolean
        {
            populateUsers();
            if (_habboHelp.reportedUserId <= 0)
            {
                _habboHelp.windowManager.alertWithModal("${generic.alert.title}", "${help.cfh.error.no_user_data}", 0, null);
                closeWindow();
                return (false);
            };
            return (true);
        }

        private function getTopic(_arg_1:String):_SafeStr_1680
        {
            for each (var _local_3:_SafeStr_1638 in _habboHelp.callForHelpCategories)
            {
                for each (var _local_2:_SafeStr_1680 in _local_3.topics)
                {
                    if (_local_2.name == _arg_1)
                    {
                        return (_local_2);
                    };
                };
            };
            return (null);
        }

        private function updateUserData():void
        {
            var _local_1:* = null;
            switch (_SafeStr_4685)
            {
                case 4:
                    _SafeStr_3882.findChildByName("reported_user_avatar").visible = false;
                    _SafeStr_3882.findChildByName("user_info_title").visible = false;
                    _SafeStr_3882.findChildByName("reported_user_name").caption = _habboHelp.callForHelpManager.reportedRoomName;
                    return;
                case 7:
                case 8:
                    _SafeStr_3882.findChildByName("reported_user_avatar").visible = false;
                    _SafeStr_3882.findChildByName("user_info_title").visible = false;
                    _SafeStr_3882.findChildByName("reported_user_name").visible = false;
                    return;
                default:
                    if (_habboHelp.reportedUserId > 0)
                    {
                        _local_1 = _habboHelp.userRegistry.getEntry(_habboHelp.reportedUserId);
                        if (_local_1)
                        {
                            _reportedUserName = _local_1.userName;
                            _SafeStr_3289(_SafeStr_3199(_SafeStr_3882.findChildByName("reported_user_avatar")).widget).figure = _local_1.figure;
                        }
                        else
                        {
                            _SafeStr_3882.findChildByName("reported_user_avatar").visible = false;
                            _reportedUserName = _habboHelp.reportedUserName;
                        };
                        _SafeStr_3882.findChildByName("reported_user_name").caption = _reportedUserName;
                    };
            };
        }


    }
}//package com.sulake.habbo.help

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1638 = "_-Q16" (String#5254, DoABC#4)
// _SafeStr_1680 = "_-61U" (String#11416, DoABC#4)
// _SafeStr_292 = "_-a1K" (String#17255, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_350 = "_-713" (String#12120, DoABC#4)
// _SafeStr_359 = "_-t1c" (String#18913, DoABC#4)
// _SafeStr_377 = "_-h10" (String#17609, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4132 = "_-s1S" (String#1283, DoABC#4)
// _SafeStr_452 = "_-01u" (String#20211, DoABC#4)
// _SafeStr_4679 = "_-32w" (String#4947, DoABC#4)
// _SafeStr_4680 = "_-cS" (String#5383, DoABC#4)
// _SafeStr_4681 = "_-jY" (String#3415, DoABC#4)
// _SafeStr_4682 = "_-91U" (String#7738, DoABC#4)
// _SafeStr_4683 = "_-H13" (String#4498, DoABC#4)
// _SafeStr_4684 = "_-wQ" (String#5658, DoABC#4)
// _SafeStr_4685 = "_-9Z" (String#5731, DoABC#4)
// _SafeStr_4686 = "_-81n" (String#19783, DoABC#4)
// _SafeStr_4687 = "_-HJ" (String#22552, DoABC#4)
// _SafeStr_4688 = "_-L14" (String#11810, DoABC#4)
// _SafeStr_4689 = "_-Ha" (String#14360, DoABC#4)
// _SafeStr_621 = "_-Y1O" (String#16623, DoABC#4)


