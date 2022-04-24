// by nota

//com.sulake.habbo.ui.handler.ChatInputWidgetHandler

package com.sulake.habbo.ui.handler
{
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.widget.chatinput.RoomChatInputWidget;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChatTypingMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChatMessage;
    import com.sulake.room.utils.RoomShakingEffect;
    import com.sulake.habbo.ui.widget.enums.AvatarExpressionEnum;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.localization._SafeStr_17;
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.room.events.RoomEngineZoomEvent;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import flash.ui.Mouse;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChatSelectAvatarMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
    import flash.events.Event;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetFloodControlEvent;
    import com.sulake.habbo.ui.widget.events.HideRoomWidgetEvent;
    import com.sulake.habbo.friendbar.events.FriendBarResizeEvent;

    public class ChatInputWidgetHandler implements IRoomWidgetHandler 
    {

        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_5645:Boolean = true;
        private var _container:IRoomWidgetHandlerContainer = null;
        private var _SafeStr_4981:RoomChatInputWidget;


        public function get container():IRoomWidgetHandlerContainer
        {
            return (_container);
        }

        public function set container(_arg_1:IRoomWidgetHandlerContainer):void
        {
            _container = _arg_1;
        }

        public function set widget(_arg_1:RoomChatInputWidget):void
        {
            _SafeStr_4981 = _arg_1;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get type():String
        {
            return ("RWE_CHAT_INPUT_WIDGET");
        }

        public function dispose():void
        {
            _SafeStr_4036 = true;
            _container = null;
            _SafeStr_4981 = null;
        }

        public function getWidgetMessages():Array
        {
            var _local_1:Array = [];
            _local_1.push("RWCTM_TYPING_STATUS");
            _local_1.push("RWCM_MESSAGE_CHAT");
            _local_1.push("RWCSAM_MESSAGE_SELECT_AVATAR");
            return (_local_1);
        }

        public function processWidgetMessage(_arg_1:RoomWidgetMessage):RoomWidgetUpdateEvent
        {
            var _local_3:* = null;
            var _local_6:int;
            var _local_11:int;
            var _local_17:* = null;
            var _local_12:* = null;
            var _local_7:* = null;
            var _local_13:* = null;
            var _local_18:* = null;
            var _local_21:* = null;
            var _local_19:* = null;
            var _local_24:int;
            var _local_5:* = null;
            var _local_16:* = null;
            var _local_22:* = null;
            var _local_15:* = null;
            var _local_20:* = null;
            var _local_4:* = null;
            var _local_8:* = null;
            var _local_2:* = null;
            var _local_14:* = null;
            var _local_23:int;
            var _local_9:* = null;
            var _local_10:* = null;
            switch (_arg_1.type)
            {
                case "RWCTM_TYPING_STATUS":
                    _local_17 = (_arg_1 as RoomWidgetChatTypingMessage);
                    if (_local_17 != null)
                    {
                        _container.roomSession.sendChatTypingMessage(_local_17.isTyping);
                    };
                    break;
                case "RWCM_MESSAGE_CHAT":
                    if (((!(_container == null)) && (!(_container.roomSession == null))))
                    {
                        _local_12 = (_arg_1 as RoomWidgetChatMessage);
                        if (_local_12 != null)
                        {
                            if (_local_12.text == "")
                            {
                                return (null);
                            };
                            _local_7 = _local_12.text;
                            _local_13 = null;
                            _local_18 = _local_12.text.split(" ");
                            if (_local_18.length > 0)
                            {
                                _local_21 = _local_18[0];
                                _local_19 = "";
                                if (_local_18.length > 1)
                                {
                                    _local_19 = _local_18[1];
                                };
                                if (((_local_21.charAt(0) == ":") && (_local_19 == "x")))
                                {
                                    _local_24 = _container.roomEngine.getSelectedAvatarId();
                                    if (_local_24 > -1)
                                    {
                                        _local_5 = _container.roomSession.userDataManager.getUserDataByIndex(_local_24);
                                        if (_local_5 != null)
                                        {
                                            _local_19 = _local_5.name;
                                            _local_7 = _local_12.text.replace(" x", (" " + _local_5.name));
                                        };
                                    };
                                };
                                switch (_local_21.toLowerCase())
                                {
                                    case ":shake":
                                        RoomShakingEffect.init(250, 5000);
                                        RoomShakingEffect.turnVisualizationOn();
                                        return (null);
                                    case ":d":
                                    case ";d":
                                        if (_container.sessionDataManager.hasVip)
                                        {
                                            _container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.LAUGH.ordinal);
                                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "chat", "laugh");
                                        };
                                        break;
                                    case "o/":
                                    case "_o/":
                                        _container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.WAVE.ordinal);
                                        return (null);
                                    case ":kiss":
                                        if (_container.sessionDataManager.hasVip)
                                        {
                                            _container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.BLOW.ordinal);
                                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "chat", "blow");
                                            return (null);
                                        };
                                        break;
                                    case ":jump":
                                        if (_container.sessionDataManager.hasVip)
                                        {
                                            _container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.JUMP.ordinal);
                                            HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "chat", "jump");
                                            return (null);
                                        };
                                        break;
                                    case ":idle":
                                        _container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum._SafeStr_3943.ordinal);
                                        HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "chat", "idle");
                                        return (null);
                                    case "_b":
                                        _container.roomSession.sendAvatarExpressionMessage(AvatarExpressionEnum.RESPECT.ordinal);
                                        HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "chat", "respect");
                                        return (null);
                                    case ":sign":
                                        _container.roomSession.sendSignMessage(_local_19);
                                        HabboTracking.getInstance().trackEventLog("OwnAvatarMenu", "chat", "sign", null, _local_19);
                                        return (null);
                                    case ":drop":
                                    case ":dropitem":
                                        _local_13 = new RoomWidgetRequestWidgetMessage("RWUAM_DROP_CARRY_ITEM");
                                        _container.processWidgetMessage(_local_13);
                                        return (null);
                                    case ":chooser":
                                        if ((((_container.sessionDataManager.hasClub) || (_container.sessionDataManager.hasSecurity(2))) || (_container.sessionDataManager.isAmbassador)))
                                        {
                                            _local_13 = new RoomWidgetRequestWidgetMessage("RWRWM_USER_CHOOSER");
                                            _container.processWidgetMessage(_local_13);
                                        };
                                        return (null);
                                    case ":furni":
                                        if (((((_container.sessionDataManager.hasClub) && (_container.roomSession.roomControllerLevel >= 1)) || (_container.sessionDataManager.hasSecurity(2))) || (_container.sessionDataManager.isAmbassador)))
                                        {
                                            _local_13 = new RoomWidgetRequestWidgetMessage("RWRWM_FURNI_CHOOSER");
                                            _container.processWidgetMessage(_local_13);
                                        };
                                        return (null);
                                    case ":pickall":
                                        _container.sessionDataManager.pickAllFurniture(_container.roomSession.roomId);
                                        return (null);
                                    case ":pickallbc":
                                        _container.sessionDataManager.pickAllBuilderFurniture(_container.roomSession.roomId);
                                        return (null);
                                    case ":ejectall":
                                        _container.sessionDataManager.ejectAllFurniture(_container.roomSession.roomId, _local_7);
                                        return (null);
                                    case ":ejectpets":
                                        _container.sessionDataManager.ejectPets(_container.roomSession.roomId);
                                        return (null);
                                    case ":moonwalk":
                                        _container.sessionDataManager.sendSpecialCommandMessage(":moonwalk");
                                        return (null);
                                    case ":habnam":
                                        _container.sessionDataManager.sendSpecialCommandMessage(":habnam");
                                        return (null);
                                    case ":yyxxabxa":
                                        _container.sessionDataManager.sendSpecialCommandMessage(":yyxxabxa");
                                        return (null);
                                    case ":mutepets":
                                        _container.sessionDataManager.sendSpecialCommandMessage(":mutepets");
                                        return (null);
                                    case ":mpgame":
                                        _container.sessionDataManager.sendSpecialCommandMessage(_local_7);
                                        return (null);
                                    case ":news":
                                        if (_container.config.getBoolean("client.news.embed.enabled"))
                                        {
                                            HabboWebTools.openNews();
                                            return (null);
                                        };
                                        break;
                                    case ":mail":
                                        if (_container.config.getBoolean("client.minimail.embed.enabled"))
                                        {
                                            HabboWebTools.openMinimail("#mail/inbox/");
                                            return (null);
                                        };
                                        break;
                                    case ":crashme":
                                        break;
                                    case ":ss":
                                        break;
                                    case ":qss":
                                        break;
                                    case ":gd":
                                        break;
                                    case ":csmm":
                                        if (_container.sessionDataManager.hasSecurity(4))
                                        {
                                            _container.gameManager.generateChecksumMismatch();
                                            return (null);
                                        };
                                        break;
                                    case ":tgl":
                                        break;
                                    case ":li":
                                        break;
                                    case ":2":
                                    case ":kick":
                                        if (!container.sessionDataManager.hasSecurity(4))
                                        {
                                            if (_container.roomSession.roomControllerLevel >= 1)
                                            {
                                                _local_16 = _container.roomSession.userDataManager.getUserDataByName(_local_19);
                                                if (_local_16)
                                                {
                                                    _container.roomSession.kickUser(_local_16.webID);
                                                };
                                            };
                                            return (null);
                                        };
                                        break;
                                    case ":shutup":
                                    case ":mute":
                                        if (!_container.sessionDataManager.hasSecurity(4))
                                        {
                                            if (_container.roomSession.roomControllerLevel >= 1)
                                            {
                                                _local_22 = _container.roomSession.userDataManager.getUserDataByName(_local_19);
                                                if (_local_22)
                                                {
                                                    _container.roomSession.muteUser(_local_22.webID, 2);
                                                };
                                            };
                                            return (null);
                                        };
                                        break;
                                    case ":ignore":
                                        if (_local_19)
                                        {
                                            _container.sessionDataManager.ignoreUser(_local_19);
                                        };
                                        return (null);
                                    case ":unignore":
                                        if (_local_19)
                                        {
                                            _container.sessionDataManager.unignoreUser(_local_19);
                                        };
                                        return (null);
                                    case ":floor":
                                    case ":bcfloor":
                                        if (_container.roomSession.roomControllerLevel >= 4)
                                        {
                                            _container.windowManager.displayFloorPlanEditor();
                                        };
                                        return (null);
                                    case ":lang":
                                        (_container.localization as _SafeStr_17).activateLocalizationDefinition(_local_19);
                                        return (null);
                                    case ":uc":
                                        if (_container.sessionDataManager.hasSecurity(4))
                                        {
                                            if (_local_19 == "hotel")
                                            {
                                                _container.roomSession.sendPeerUsersClassificationMessage(_local_18[2]);
                                            }
                                            else
                                            {
                                                _container.roomSession.sendRoomUsersClassificationMessage(_local_19);
                                            };
                                        };
                                        return (null);
                                    case ":anew":
                                        if (((_container.sessionDataManager.isAmbassador) || (_container.sessionDataManager.hasSecurity(4))))
                                        {
                                            _container.roomSession.sendRoomUsersClassificationMessage("new");
                                        };
                                        return (null);
                                    case ":avisit":
                                        if (((_container.sessionDataManager.isAmbassador) || (_container.sessionDataManager.hasSecurity(4))))
                                        {
                                            if ("group" == _local_19)
                                            {
                                                (_container.roomEngine as Component).context.createLinkEvent("navigator/goto/predefined_group_lobby");
                                            }
                                            else
                                            {
                                                (_container.roomEngine as Component).context.createLinkEvent("navigator/goto/predefined_noob_lobby");
                                            };
                                        };
                                        return (null);
                                    case ":aalert":
                                        if (((_container.sessionDataManager.isAmbassador) || (_container.sessionDataManager.hasSecurity(4))))
                                        {
                                            _local_15 = _container.roomSession.userDataManager.getUserDataByName(_local_19);
                                            if (_local_15)
                                            {
                                                _container.roomSession.ambassadorAlert(_local_15.webID);
                                            };
                                        };
                                        return (null);
                                    case ":visit":
                                        if (((_container.sessionDataManager.hasClub) || (_container.sessionDataManager.hasSecurity(4))))
                                        {
                                            _container.roomSession.sendVisitUserMessage(_local_19);
                                        };
                                        return (null);
                                    case ":roomid":
                                        if (((_container.sessionDataManager.hasClub) || (_container.sessionDataManager.hasSecurity(4))))
                                        {
                                            _container.roomSession.sendVisitFlatMessage(parseInt(_local_19));
                                        };
                                        return (null);
                                    case ":link":
                                        break;
                                    case ":zoom":
                                        _container.roomEngine.events.dispatchEvent(new RoomEngineZoomEvent(_container.roomEngine.activeRoomId, _local_19));
                                        return (null);
                                    case ":cam":
                                    case ":camera":
                                        if (_container.sessionDataManager.isPerkAllowed("CAMERA"))
                                        {
                                            _local_20 = new HabboToolbarEvent("HTE_ICON_CAMERA");
                                            _local_20.iconName = "chatCameraCommand";
                                            _container.toolbar.events.dispatchEvent(_local_20);
                                        };
                                        return (null);
                                    case ":fs":
                                    case ":fullscreen":
                                        _container.windowManager.toggleFullScreen();
                                        return (null);
                                    case ":q":
                                        break;
                                    case ":screenshot":
                                        _local_8 = _container.navigator.enteredGuestRoomData;
                                        if (_local_8)
                                        {
                                            _local_4 = _local_8.roomName;
                                        };
                                        if (((_local_4 == null) || (_local_4.length == 0)))
                                        {
                                            _local_2 = new Date();
                                            _local_14 = (([_local_2.getFullYear(), _local_2.getMonth(), _local_2.getDate()].join("-") + " ") + [_local_2.getHours(), _local_2.getMinutes(), _local_2.getSeconds()].join("."));
                                            _local_4 = ("Habbo " + _local_14);
                                        };
                                        _container.roomEngine.createScreenShot(_container.roomSession.roomId, _container.getFirstCanvasId(), (_local_4 + ".png"));
                                        return (null);
                                    case ":iddqd":
                                        _container.roomEngine.events.dispatchEvent(new RoomEngineZoomEvent(_container.roomEngine.activeRoomId, -1, true));
                                        return (null);
                                    case ":hidemouse":
                                        if (_SafeStr_5645)
                                        {
                                            Mouse.hide();
                                            _container.roomEngine.setTileCursorState(_container.roomEngine.activeRoomId, 0);
                                        }
                                        else
                                        {
                                            Mouse.show();
                                            _container.roomEngine.setTileCursorState(_container.roomEngine.activeRoomId, 1);
                                        };
                                        _container.roomEngine.toggleTileCursorVisibility(_container.roomEngine.activeRoomId, (!(_SafeStr_5645)));
                                        _SafeStr_5645 = (!(_SafeStr_5645));
                                        return (null);
                                };
                            };
                            _local_23 = _local_12.styleId;
                            if (((!(_container == null)) && (!(_container.roomSession == null))))
                            {
                                if (this._container.freeFlowChat != null)
                                {
                                    if (((!(this._container.freeFlowChat.preferedChatStyle == _local_12.styleId)) && (!(_local_12.styleId == -1))))
                                    {
                                        this._container.freeFlowChat.preferedChatStyle = _local_12.styleId;
                                    };
                                    _local_23 = this._container.freeFlowChat.preferedChatStyle;
                                };
                                switch (_local_12.chatType)
                                {
                                    case 0:
                                        _container.roomSession.sendChatMessage(_local_7, _local_23);
                                        break;
                                    case 2:
                                        _container.roomSession.sendShoutMessage(_local_7, _local_23);
                                        break;
                                    case 1:
                                        _container.roomSession.sendWhisperMessage(_local_12.recipientName, _local_7, _local_23);
                                    default:
                                };
                                HabboTracking.getInstance().trackEventLogOncePerSession("Tutorial", "interaction", "avatar.chat");
                            };
                        };
                    };
                    break;
                case "RWCSAM_MESSAGE_SELECT_AVATAR":
                    _local_9 = (_arg_1 as RoomWidgetChatSelectAvatarMessage);
                    if (_local_9 != null)
                    {
                        _container.roomEngine.selectAvatar(_local_9.roomId, _local_9.objectId);
                        _local_10 = _container.roomSession.userDataManager.getUserDataByIndex(_local_9.objectId);
                        if (_local_10 != null)
                        {
                            _container.moderation.userSelected(_local_10.webID, _local_9.userName);
                        };
                    };
            };
            return (null);
        }

        public function getProcessedEvents():Array
        {
            return (["RSCE_FLOOD_EVENT", "hrwe_hide_room_widget", "FBE_BAR_RESIZE_EVENT"]);
        }

        public function update():void
        {
        }

        public function processEvent(_arg_1:Event):void
        {
            var _local_3:* = null;
            var _local_2:int;
            var _local_4:* = null;
            var _local_5:Event;
            if (((_container == null) || (_container.events == null)))
            {
                return;
            };
            switch (_arg_1.type)
            {
                case "RSCE_FLOOD_EVENT":
                    _local_3 = (_arg_1 as RoomSessionChatEvent);
                    _local_2 = parseInt(_local_3.text);
                    _local_5 = new RoomWidgetFloodControlEvent(_local_2);
                    break;
                case "hrwe_hide_room_widget":
                    handleHideWidgetEvent((_arg_1 as HideRoomWidgetEvent));
                    return;
                case "FBE_BAR_RESIZE_EVENT":
                    _local_4 = (_arg_1 as FriendBarResizeEvent);
                    _SafeStr_4981.checkChatInputPosition();
            };
            if ((((!(_container == null)) && (!(_container.events == null))) && (!(_local_5 == null))))
            {
                _container.events.dispatchEvent(_local_5);
            };
        }

        private function handleHideWidgetEvent(_arg_1:HideRoomWidgetEvent):void
        {
            if (((_arg_1) && (_arg_1.widgetType == this.type)))
            {
                _SafeStr_4981.hide();
            };
        }


    }
}//package com.sulake.habbo.ui.handler

// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_17 = "_-94" (String#5077, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_3943 = "_-i1k" (String#11339, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5645 = "_-vX" (String#12102, DoABC#4)


