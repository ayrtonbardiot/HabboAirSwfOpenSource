// by nota

//com.sulake.habbo.messenger.MainView

package com.sulake.habbo.messenger
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.window.widgets.IIlluminaInputHandler;
    import flash.utils.Dictionary;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components._SafeStr_3199;
    import flash.utils.Timer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.window.widgets.IIlluminaInputWidget;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.window.widgets._SafeStr_3289;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.friendlist._SafeStr_3173;
    import com.sulake.habbo.messenger.events.NewMessageEvent;
    import flash.events.TimerEvent;
    import com.sulake.habbo.window.widgets.IIlluminaChatBubbleWidget;
    import _-Po._SafeStr_428;
    import _-qv._SafeStr_895;
    import _-XO._SafeStr_197;
    import _-XO._SafeStr_313;
    import com.sulake.core.window.events._SafeStr_3116;
    import _-Po._SafeStr_309;

    public class MainView implements _SafeStr_13, IIlluminaInputHandler 
    {

        private static const HIDDEN:String = "HIDDEN";
        private static const _SafeStr_8644:int = -1;
        private static const NOTIFICATION_ICON_WIDTH:int = 55;
        private static const CHAT_ITEM_RENDER_BUNDLE_SIZE:int = 5;
        private static const SCROLL_TRIGGER_HEIGHT:int = 150;
        private static const ERROR_MESSAGES:Dictionary = new Dictionary();

        private var _messenger:HabboMessenger;
        private var _frame:_SafeStr_3133;
        private var _SafeStr_4909:IItemListWindow;
        private var _SafeStr_4907:_SafeStr_3133;
        private var _avatarListPosition:int;
        private var _SafeStr_4918:Boolean;
        private var _SafeStr_4914:Dictionary = new Dictionary();
        private var _SafeStr_4916:int = -1;
        private var _SafeStr_4908:_SafeStr_3133;
        private var _SafeStr_4910:_SafeStr_3199;
        private var _SafeStr_4911:_SafeStr_3133;
        private var _SafeStr_4912:_SafeStr_3133;
        private var _SafeStr_4913:_SafeStr_3133;
        private var _SafeStr_4919:Boolean;
        private var _SafeStr_4915:Boolean = false;
        private var _SafeStr_4917:Array;
        private var _SafeStr_3923:Timer;

        {
            ERROR_MESSAGES[3] = "${messenger.error.receivermuted}";
            ERROR_MESSAGES[4] = "${messenger.error.sendermuted}";
            ERROR_MESSAGES[5] = "${messenger.error.offline}";
            ERROR_MESSAGES[6] = "${messenger.error.notfriend}";
            ERROR_MESSAGES[7] = "${messenger.error.busy}";
            ERROR_MESSAGES[8] = "${messenger.error.receiverhasnochat}";
            ERROR_MESSAGES[9] = "${messenger.error.senderhasnochat}";
            ERROR_MESSAGES[10] = "${messenger.error.offline_failed}";
            ERROR_MESSAGES[11] = "${messenger.error.not_group_member}";
            ERROR_MESSAGES[12] = "${messenger.error.not_group_admin}";
            ERROR_MESSAGES[13] = "${messenger.error.sender_im_unavailable}";
            ERROR_MESSAGES[14] = "${messenger.error.recipient_im_unavailable}";
        }

        public function MainView(_arg_1:HabboMessenger)
        {
            _messenger = _arg_1;
            _frame = (_messenger.getXmlWindow("messenger") as _SafeStr_3133);
            _frame.visible = false;
            _frame.procedure = messengerWindowProcedure;
            IStaticBitmapWrapperWindow(_frame.findChildByName("header_button_image")).assetUri = "messenger_minimize_button";
            _SafeStr_4907 = (_frame.findChildByName("avatar_list") as _SafeStr_3133);
            _SafeStr_4908 = (_SafeStr_4907.getChildAt(0) as _SafeStr_3133);
            _SafeStr_4907.removeChild(_SafeStr_4908);
            _avatarListPosition = 0;
            _SafeStr_4909 = (_frame.findChildByName("conversation") as IItemListWindow);
            _SafeStr_4910 = (_SafeStr_4909.getListItemByName("msg_normal") as _SafeStr_3199);
            _SafeStr_4911 = (_SafeStr_4909.getListItemByName("msg_notification") as _SafeStr_3133);
            _SafeStr_4912 = (_SafeStr_4909.getListItemByName("msg_invitation") as _SafeStr_3133);
            _SafeStr_4913 = (_SafeStr_4909.getListItemByName("msg_info") as _SafeStr_3133);
            _SafeStr_4909.removeListItems();
            IIlluminaInputWidget(_SafeStr_3199(_frame.findChildByName("input_widget")).widget).submitHandler = this;
            _SafeStr_4917 = [];
        }

        private static function avatarVisible(_arg_1:_SafeStr_3109):Boolean
        {
            return ((!(_arg_1 == null)) && (_arg_1.tags.indexOf("HIDDEN") < 0));
        }

        private static function setAvatarVisibilityTag(_arg_1:_SafeStr_3109, _arg_2:Boolean):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_3:Boolean = avatarVisible(_arg_1);
            if (((_local_3) && (!(_arg_2))))
            {
                _arg_1.tags.push("HIDDEN");
            }
            else
            {
                if (((!(_local_3)) && (_arg_2)))
                {
                    _arg_1.tags.splice(_arg_1.tags.indexOf("HIDDEN"), 1);
                };
            };
        }


        public function dispose():void
        {
            if (!disposed)
            {
                _SafeStr_4909 = null;
                _SafeStr_4907 = null;
                if (_frame != null)
                {
                    _frame.dispose();
                    _frame = null;
                };
                if (_SafeStr_4910 != null)
                {
                    _SafeStr_4910.dispose();
                    _SafeStr_4910 = null;
                };
                if (_SafeStr_4911 != null)
                {
                    _SafeStr_4911.dispose();
                    _SafeStr_4911 = null;
                };
                if (_SafeStr_4912 != null)
                {
                    _SafeStr_4912.dispose();
                    _SafeStr_4912 = null;
                };
                if (_SafeStr_4913 != null)
                {
                    _SafeStr_4913.dispose();
                    _SafeStr_4913 = null;
                };
                if (_SafeStr_4908 != null)
                {
                    _SafeStr_4908.dispose();
                    _SafeStr_4908 = null;
                };
                if (_SafeStr_3923)
                {
                    if (_SafeStr_3923.running)
                    {
                        _SafeStr_3923.stop();
                    };
                    _SafeStr_3923 = null;
                };
                _SafeStr_4914 = null;
                _messenger = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_messenger == null);
        }

        public function get isOpen():Boolean
        {
            return ((!(_frame == null)) && (_frame.visible));
        }

        public function toggle():void
        {
            if (isOpen)
            {
                hide();
            }
            else
            {
                show();
            };
        }

        public function show(_arg_1:Boolean=false):void
        {
            if (((_arg_1) || (visibleAvatarCount > 0)))
            {
                _frame.visible = true;
                _frame.activate();
            };
        }

        public function hide():void
        {
            _frame.visible = false;
        }

        public function startConversation(_arg_1:int, _arg_2:Boolean=true):void
        {
            var _local_5:* = null;
            var _local_8:* = null;
            var _local_4:* = null;
            var _local_7:* = null;
            var _local_6:* = null;
            var _local_3:* = null;
            if (!(_arg_1 in _SafeStr_4914))
            {
                _SafeStr_4914[_arg_1] = [];
                if (!_SafeStr_4915)
                {
                    recordNotificationMessage(_arg_1, "${messenger.moderationinfo}");
                    _SafeStr_4915 = true;
                };
                _local_5 = _messenger.getFriend(_arg_1);
                if (!_local_5)
                {
                    ErrorReportStorage.addDebugData("Messenger Mainview", ("User got start conversation request from nonexistent friend, id: " + _arg_1));
                    return;
                };
                if (!_local_5.online)
                {
                    recordNotificationMessage(_arg_1, "${messenger.notification.persisted_messages}");
                };
                _local_8 = (_SafeStr_4908.clone() as _SafeStr_3133);
                setAvatarVisibilityTag(_local_8, true);
                _local_8.blend = 0;
                _local_8.id = _arg_1;
                if (_arg_1 < 0)
                {
                    _local_8.name = String(_arg_1);
                };
                _local_4 = (_local_8.findChildByName("avatar_image") as _SafeStr_3199);
                _local_7 = (_local_8.findChildByName("group_badge_image") as _SafeStr_3199);
                if (_local_5.id > 0)
                {
                    _local_6 = (_local_4.widget as _SafeStr_3289);
                    if (_local_5 != null)
                    {
                        _local_6.figure = _local_5.figure;
                    };
                    _local_7.visible = false;
                    _local_4.visible = true;
                }
                else
                {
                    _local_3 = (_local_7.widget as _SafeStr_3349);
                    _local_3.badgeId = _local_5.figure;
                    _local_3.groupId = _local_5.id;
                    _local_7.visible = true;
                    _local_4.visible = false;
                };
                IRegionWindow(_local_8.findChildByName("avatar_click_region")).toolTipCaption = _local_5.name;
                _SafeStr_4907.addChild(_local_8);
                refreshAvatarList();
            };
            if (((_arg_2) || (!(isOpen))))
            {
                selectConversation(_arg_1);
            };
            refreshChatCount();
        }

        public function addConsoleMessage(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:String):void
        {
            recordChatMessage(_arg_1, _arg_2, true, _arg_3, _arg_4);
        }

        public function addRoomInvite(_arg_1:int, _arg_2:String):void
        {
            recordInvitationMessage(_arg_1, ((_messenger.getText("messenger.invitation") + " ") + _arg_2), true);
        }

        public function setFollowingAllowed(_arg_1:int, _arg_2:Boolean):void
        {
            if (_arg_1 == _SafeStr_4916)
            {
                refreshButtons();
            };
        }

        public function onInstantMessageError(_arg_1:int, _arg_2:int, _arg_3:String):void
        {
            var _local_5:* = null;
            var _local_4:* = null;
            if ((_arg_2 in ERROR_MESSAGES))
            {
                if (_arg_3.length > 0)
                {
                    _local_5 = ERROR_MESSAGES[_arg_2];
                    _local_4 = /[${}]/g;
                    _local_5 = _local_5.replace(_local_4, "");
                    recordNotificationMessage(_arg_1, ((_messenger.getText(_local_5) + ": ") + _arg_3));
                }
                else
                {
                    recordNotificationMessage(_arg_1, ERROR_MESSAGES[_arg_2]);
                };
            };
        }

        public function setOnlineStatus(_arg_1:int, _arg_2:Boolean):void
        {
            if ((_arg_1 in _SafeStr_4914))
            {
                recordInfoMessage(_arg_1, ((_arg_2) ? "${messenger.notification.online}" : "${messenger.notification.offline}"));
            };
        }

        private function selectConversation(_arg_1:int):void
        {
            _SafeStr_4916 = _arg_1;
            setAvatarVisibilityTag(getAvatarWrapper(_arg_1), true);
            setChatIndicatorVisibility(_arg_1, false);
            refreshConversationList();
            refreshAvatarList();
            var _local_3:_SafeStr_3173 = _messenger.getFriend(_SafeStr_4916);
            var _local_2:String = ((_local_3 != null) ? _local_3.name : "");
            _frame.findChildByName("separator_label").visible = ((_SafeStr_4916 < 0) || (!(_local_3 == null)));
            _messenger.localization.registerParameter("messenger.window.separator", "friend_name", _local_2);
            _messenger.localization.registerParameter("messenger.window.input.default", "friend_name", _local_2);
            _frame.invalidate();
        }

        public function hideConversation(_arg_1:int):void
        {
            var _local_2:_SafeStr_3109 = getAvatarWrapper(_arg_1);
            if (_local_2 != null)
            {
                setAvatarVisibilityTag(_local_2, false);
            };
            if (visibleAvatarCount == 0)
            {
                selectConversation(-1);
                hide();
            }
            else
            {
                for each (_local_2 in _SafeStr_4907.iterator)
                {
                    if (avatarVisible(_local_2))
                    {
                        _avatarListPosition = 0;
                        selectConversation(_local_2.id);
                        break;
                    };
                };
            };
            refreshChatCount();
        }

        private function refreshChatCount():void
        {
            _messenger.localization.registerParameter("messenger.window.title", "open_chat_count", visibleAvatarCount.toString());
            _messenger.conversationCountUpdated(visibleAvatarCount);
        }

        private function recordChatMessage(_arg_1:int, _arg_2:String, _arg_3:Boolean, _arg_4:int, _arg_5:String=null):void
        {
            if (_arg_3)
            {
                recordChatEntry(_arg_1, new ChatEntry(2, _arg_1, _arg_2, _arg_4, _arg_5), true);
            }
            else
            {
                recordChatEntry(_arg_1, new ChatEntry(1, 0, _arg_2, _arg_4));
            };
        }

        private function recordNotificationMessage(_arg_1:int, _arg_2:String):void
        {
            recordChatEntry(_arg_1, new ChatEntry(3, 0, _arg_2, 0));
        }

        private function recordInfoMessage(_arg_1:int, _arg_2:String, _arg_3:Boolean=false):void
        {
            recordChatEntry(_arg_1, new ChatEntry(4, 0, _arg_2, 0), _arg_3);
        }

        private function recordInvitationMessage(_arg_1:int, _arg_2:String, _arg_3:Boolean=false):void
        {
            recordChatEntry(_arg_1, new ChatEntry(5, 0, _arg_2, 0), _arg_3);
        }

        private function recordChatEntry(_arg_1:int, _arg_2:ChatEntry, _arg_3:Boolean=false):void
        {
            var _local_8:* = null;
            var _local_4:Boolean;
            var _local_9:* = null;
            var _local_6:* = null;
            if (_messenger == null)
            {
                return;
            };
            if (!_messenger.hasfriendsListInitialized)
            {
                _SafeStr_4917.push(new ChatQueueEntry(_arg_1, _arg_2, _arg_3));
                if (((!(_SafeStr_3923)) || ((_SafeStr_3923) && (!(_SafeStr_3923.running)))))
                {
                    _SafeStr_3923 = new Timer(12000);
                    _SafeStr_3923.addEventListener("timer", batchMessageUpdate);
                    _SafeStr_3923.start();
                };
                return;
            };
            if (!(_arg_1 in _SafeStr_4914))
            {
                if (_arg_1 > 0)
                {
                    startConversation(_arg_1, false);
                }
                else
                {
                    return;
                };
            };
            var _local_7:Array = _SafeStr_4914[_arg_1];
            if (_local_7.length > 0)
            {
                _local_8 = _local_7[(_local_7.length - 1)];
                if (_arg_1 > 0)
                {
                    if (((_arg_2.type == _local_8.type) && ((_arg_2.type == 1) || (_arg_2.type == 2))))
                    {
                        _local_7.pop();
                        _arg_2.prefixMessageWith(_local_8.message);
                        if (_arg_1 == _SafeStr_4916)
                        {
                            _SafeStr_4909.removeListItemAt((_SafeStr_4909.numListItems - 1));
                        };
                    };
                }
                else
                {
                    _local_4 = false;
                    if (_arg_2.type == 2)
                    {
                        if (((_local_8.extraData == null) || (_arg_2.extraData == null)))
                        {
                            _local_4 = false;
                        }
                        else
                        {
                            _local_9 = _local_8.extraData.split("/")[0];
                            _local_6 = _arg_2.extraData.split("/")[0];
                            _local_4 = (_local_9 == _local_6);
                        };
                    };
                    if (((_arg_2.type == _local_8.type) && ((_arg_2.type == 1) || (_local_4))))
                    {
                        _local_7.pop();
                        _arg_2.prefixMessageWith(_local_8.message);
                        if (_arg_1 == _SafeStr_4916)
                        {
                            _SafeStr_4909.removeListItemAt((_SafeStr_4909.numListItems - 1));
                        };
                    };
                };
            };
            _local_7.push(_arg_2);
            var _local_5:_SafeStr_3133 = getAvatarWrapper(_arg_1);
            if (_local_5 != null)
            {
                setAvatarVisibilityTag(_local_5, true);
                refreshAvatarList();
            };
            if (_arg_1 == _SafeStr_4916)
            {
                appendChatEntry(_arg_2);
            }
            else
            {
                if (_arg_3)
                {
                    setChatIndicatorVisibility(_arg_1, true);
                };
                if (visibleAvatarCount == 1)
                {
                    selectConversation(_arg_1);
                };
            };
            refreshChatCount();
        }

        private function batchMessageUpdate(_arg_1:TimerEvent):void
        {
            var _local_3:int;
            if (_messenger == null)
            {
                return;
            };
            if (_messenger.hasfriendsListInitialized)
            {
                if (_SafeStr_4917.length > 0)
                {
                    _local_3 = -1;
                    for each (var _local_2:ChatQueueEntry in _SafeStr_4917)
                    {
                        _local_3 = _local_2.conversationId;
                        recordChatEntry(_local_2.conversationId, _local_2.chatEntry, _local_2.updateIndicator);
                    };
                    refreshConversationList();
                    refreshAvatarList();
                    _messenger.events.dispatchEvent(new NewMessageEvent(true, _local_3));
                };
                _SafeStr_4917 = [];
                _SafeStr_3923.stop();
            };
        }

        private function getAvatarWrapper(_arg_1:int):_SafeStr_3133
        {
            return (_SafeStr_4907.getChildByID(_arg_1) as _SafeStr_3133);
        }

        private function setChatIndicatorVisibility(_arg_1:int, _arg_2:Boolean):void
        {
            var _local_3:_SafeStr_3133 = getAvatarWrapper(_arg_1);
            if (_local_3 != null)
            {
                _local_3.findChildByName("chat_indicator").visible = _arg_2;
            };
        }

        private function createChatItem(_arg_1:ChatEntry):_SafeStr_3109
        {
            var _local_8:* = null;
            var _local_4:* = null;
            var _local_10:* = null;
            var _local_9:* = null;
            var _local_3:* = null;
            var _local_5:* = null;
            var _local_2:Boolean;
            var _local_6:* = null;
            switch (_arg_1.type)
            {
                case 4:
                    _local_10 = (_SafeStr_4913.clone() as _SafeStr_3133);
                    _local_9 = _local_10.findChildByName("content");
                    _local_9.limits.minWidth = conversationItemWidth;
                    _local_9.limits.maxWidth = conversationItemWidth;
                    _local_9.caption = _arg_1.message;
                    return (_local_10);
                case 3:
                    _local_3 = (_SafeStr_4911.clone() as _SafeStr_3133);
                    _local_3.findChildByName("content").width = (conversationItemWidth - 55);
                    _local_3.findChildByName("content").caption = _arg_1.message;
                    return (_local_3);
                case 5:
                    _local_5 = (_SafeStr_4912.clone() as _SafeStr_3133);
                    _local_5.findChildByName("content").width = (conversationItemWidth - 55);
                    _local_5.findChildByName("content").caption = _arg_1.message;
                    return (_local_5);
                case 2:
                    _local_8 = (_SafeStr_4910.clone() as _SafeStr_3199);
                    _local_8.width = conversationItemWidth;
                    _local_4 = (_local_8.widget as IIlluminaChatBubbleWidget);
                    _local_4.message = _arg_1.message;
                    _local_4.timeStamp = _arg_1.sentTimeStamp();
                    _local_4.flipped = true;
                    for each (var _local_7:_SafeStr_3133 in _SafeStr_4907.iterator)
                    {
                        _local_2 = ((!(_local_7 == null)) && (_local_7.id == _SafeStr_4916));
                        if ((((!(_local_2)) && (!(_local_7 == null))) && (_SafeStr_4916 < 0)))
                        {
                            _local_2 = (_local_7.name == _SafeStr_4916);
                        };
                        if (_local_2)
                        {
                            if (_SafeStr_4916 > 0)
                            {
                                _local_4.figure = _SafeStr_3289(_SafeStr_3199(_local_7.getChildByName("avatar_image")).widget).figure;
                                _local_4.userName = IRegionWindow(_local_7.findChildByName("avatar_click_region")).toolTipCaption;
                                _local_4.userId = _local_7.id;
                            }
                            else
                            {
                                _local_4.userId = _arg_1.extraData.split("/")[2];
                                _local_4.figure = _arg_1.extraData.split("/")[1];
                                _local_4.userName = _arg_1.extraData.split("/")[0];
                            };
                            break;
                        };
                    };
                    return (_local_8);
                case 1:
                    _local_8 = (_SafeStr_4910.clone() as _SafeStr_3199);
                    _local_8.width = conversationItemWidth;
                    _local_4 = (_local_8.widget as IIlluminaChatBubbleWidget);
                    _local_4.message = _arg_1.message;
                    _local_4.timeStamp = _arg_1.sentTimeStamp();
                    _local_4.flipped = false;
                    _local_4.figure = _messenger.sessionDataManager.figure;
                    _local_4.userName = _messenger.sessionDataManager.userName;
                    _local_6 = _messenger.getFriend(_SafeStr_4916);
                    if ((((!(_local_6 == null)) && (!(_local_6.online))) && ((_local_6.persistedMessageUser) || (_local_6.pocketHabboUser))))
                    {
                        _local_4.friendOnlineStatus = false;
                    };
                    return (_local_8);
                default:
                    return (null);
            };
        }

        private function appendChatEntry(_arg_1:ChatEntry, _arg_2:Boolean=true):void
        {
            _SafeStr_4909.addListItem(createChatItem(_arg_1));
            if (_arg_2)
            {
                _SafeStr_4909.scrollV = 1;
                _SafeStr_4909.arrangeListItems();
            };
        }

        private function adjustListItemWidths():void
        {
            var _local_1:int;
            var _local_2:* = null;
            var _local_3:* = null;
            _local_1 = 0;
            while (_local_1 < _SafeStr_4909.numListItems)
            {
                _local_2 = _SafeStr_4909.getListItemAt(_local_1);
                switch (_local_2.name)
                {
                    case "msg_normal":
                        break;
                    case "msg_notification":
                        _SafeStr_3133(_local_2).findChildByName("content").width = (conversationItemWidth - 55);
                        break;
                    case "msg_info":
                        _local_3 = _SafeStr_3133(_local_2).findChildByName("content");
                        _local_3.limits.minWidth = conversationItemWidth;
                        _local_3.limits.maxWidth = conversationItemWidth;
                };
                _local_2.width = conversationItemWidth;
                _local_1++;
            };
            _SafeStr_4909.arrangeListItems();
            _frame.invalidate();
        }

        private function get conversationItemWidth():int
        {
            return (_frame.width - 27);
        }

        private function refreshButtons():void
        {
            IItemListWindow(_frame.findChildByName("button_strip")).arrangeListItems();
        }

        private function refreshConversationList():void
        {
            var _local_2:int;
            _SafeStr_4919 = true;
            _SafeStr_4909.destroyListItems();
            var _local_1:Array = _SafeStr_4914[_SafeStr_4916];
            if (_local_1 == null)
            {
                return;
            };
            var _local_3:int = _local_1.length;
            _local_2 = Math.max(0, (_local_3 - 5));
            while (_local_2 < _local_3)
            {
                appendChatEntry(_local_1[_local_2]);
                _local_2++;
            };
            _SafeStr_4909.scrollV = 1;
            _SafeStr_4909.arrangeListItems();
            _SafeStr_4919 = false;
        }

        private function addMissingChatEntries():void
        {
            var _local_5:int;
            if (-(_SafeStr_4909.scrollableRegion.y) > 150)
            {
                return;
            };
            _SafeStr_4919 = true;
            var _local_2:Number = _SafeStr_4909.scrollV;
            var _local_3:int = _SafeStr_4909.scrollableRegion.height;
            var _local_1:Array = _SafeStr_4914[_SafeStr_4916];
            if (_local_1 == null)
            {
                return;
            };
            var _local_6:int = (_local_1.length - _SafeStr_4909.numListItems);
            var _local_4:int;
            _local_5 = Math.max(0, (_local_6 - 5));
            while (_local_5 < _local_6)
            {
                _SafeStr_4909.addListItemAt(createChatItem(_local_1[_local_5]), _local_4);
                _local_4++;
                _local_5++;
            };
            _SafeStr_4909.arrangeListItems();
            _SafeStr_4909.scrollV = (1 - ((_local_3 * (1 - _local_2)) / _SafeStr_4909.scrollableRegion.height));
            _SafeStr_4919 = false;
        }

        private function refreshAvatarList():void
        {
            var _local_1:Boolean;
            var _local_2:Boolean;
            var _local_3:int;
            var _local_5:int;
            _SafeStr_4918 = false;
            for each (var _local_4:_SafeStr_3109 in _SafeStr_4907.iterator)
            {
                _local_1 = (_local_4.id == _SafeStr_4916);
                if (((!(_local_1)) && (_local_4.name.length > 0)))
                {
                    _local_1 = (_local_4.name == _SafeStr_4916);
                };
                if (_local_1)
                {
                    setAvatarVisibilityTag(_local_4, true);
                };
                _local_2 = avatarVisible(_local_4);
                if ((((_local_5 < _avatarListPosition) || (!(_local_2))) || (_SafeStr_4918)))
                {
                    _local_4.visible = false;
                }
                else
                {
                    if ((_local_3 + _local_4.width) > _SafeStr_4907.width)
                    {
                        _local_4.visible = false;
                        _SafeStr_4918 = true;
                    }
                    else
                    {
                        _local_4.visible = true;
                        _local_4.blend = ((_local_1) ? 1 : 0);
                        _local_4.x = _local_3;
                        _local_3 = (_local_3 + _local_4.width);
                    };
                };
                if (_local_2)
                {
                    _local_5++;
                };
            };
            _frame.findChildByName("avatars_scroll_left").visible = (_avatarListPosition > 0);
            _frame.findChildByName("avatars_scroll_right").visible = _SafeStr_4918;
        }

        private function get visibleAvatarCount():int
        {
            var _local_1:int;
            for each (var _local_2:_SafeStr_3109 in _SafeStr_4907.iterator)
            {
                if (avatarVisible(_local_2))
                {
                    _local_1++;
                };
            };
            return (_local_1);
        }

        private function messengerWindowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            switch (_arg_1.type)
            {
                case "WE_RESIZE":
                    if (_arg_2 == _frame)
                    {
                        adjustListItemWidths();
                        refreshAvatarList();
                    };
                    return;
                case "WE_RELOCATED":
                    if (((_arg_2.name == "_CONTAINER") && (!(_SafeStr_4919))))
                    {
                        addMissingChatEntries();
                    };
                    return;
                case "WME_CLICK":
                    switch (_arg_2.name)
                    {
                        case "avatar_click_region":
                            selectConversation(_arg_2.parent.id);
                            break;
                        case "avatars_scroll_left":
                            if (_avatarListPosition > 0)
                            {
                                _avatarListPosition--;
                                refreshAvatarList();
                            };
                            break;
                        case "avatars_scroll_right":
                            if (_SafeStr_4918)
                            {
                                _avatarListPosition++;
                                refreshAvatarList();
                            };
                            break;
                        case "close_conversation_button":
                            hideConversation(_SafeStr_4916);
                            break;
                        case "follow_button":
                            if (_SafeStr_4916 > 0)
                            {
                                _messenger.send(new _SafeStr_428(_SafeStr_4916));
                                _messenger.send(new _SafeStr_895("Navigation", "IM", "go.im"));
                            }
                            else
                            {
                                _messenger.followingToGroupRoom = true;
                                _messenger.send(new _SafeStr_197(Math.abs(_SafeStr_4916), false));
                            };
                            break;
                        case "profile_button":
                            if (_SafeStr_4916 > 0)
                            {
                                _messenger.send(new _SafeStr_313(_SafeStr_4916));
                                _messenger.trackGoogle("extendedProfile", "messenger_conversation");
                            }
                            else
                            {
                                _messenger.send(new _SafeStr_197(Math.abs(_SafeStr_4916), true));
                                _messenger.trackGoogle("extendedProfile", "messenger_conversation");
                            };
                            break;
                        case "report_button":
                            _messenger.reportUser(_SafeStr_4916);
                            break;
                        case "header_button_close":
                            hide();
                    };
                    return;
            };
        }

        public function onInput(_arg_1:_SafeStr_3199, _arg_2:String):void
        {
            _messenger.send(new _SafeStr_309(_SafeStr_4916, _arg_2));
            IIlluminaInputWidget(_arg_1.widget).message = "";
            var _local_3:Array = _SafeStr_4914[_SafeStr_4916];
            if (((_local_3.length == 0) || ((_local_3.length == 1) && (ChatEntry(_local_3[0]).type == 3))))
            {
                _messenger.playSendSound();
            };
            recordChatMessage(_SafeStr_4916, escapeExternalKeys(_arg_2), false, 0);
        }

        private function escapeExternalKeys(_arg_1:String):String
        {
            if (_arg_1.search("\\${") == 0)
            {
                return (" " + _arg_1);
            };
            return (_arg_1);
        }


    }
}//package com.sulake.habbo.messenger

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_197 = "_-G1o" (String#2651, DoABC#4)
// _SafeStr_309 = "_-n1d" (String#29079, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_313 = "_-L7" (String#1765, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3173 = "_-o3" (String#6682, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3289 = "_-O18" (String#2042, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_3923 = "_-9O" (String#3164, DoABC#4)
// _SafeStr_428 = "_-5Z" (String#7229, DoABC#4)
// _SafeStr_4907 = "_-01x" (String#5263, DoABC#4)
// _SafeStr_4908 = "_-D1K" (String#8695, DoABC#4)
// _SafeStr_4909 = "_-N8" (String#2713, DoABC#4)
// _SafeStr_4910 = "_-q1u" (String#8447, DoABC#4)
// _SafeStr_4911 = "_-x1S" (String#9226, DoABC#4)
// _SafeStr_4912 = "_-Az" (String#9273, DoABC#4)
// _SafeStr_4913 = "_-xf" (String#9545, DoABC#4)
// _SafeStr_4914 = "_-h1T" (String#5672, DoABC#4)
// _SafeStr_4915 = "_-N1i" (String#21319, DoABC#4)
// _SafeStr_4916 = "_-7J" (String#2862, DoABC#4)
// _SafeStr_4917 = "_-1X" (String#8927, DoABC#4)
// _SafeStr_4918 = "_-Q1A" (String#9866, DoABC#4)
// _SafeStr_4919 = "_-22O" (String#7306, DoABC#4)
// _SafeStr_8644 = "_-F1D" (String#39206, DoABC#4)
// _SafeStr_895 = "_-6o" (String#1376, DoABC#4)


