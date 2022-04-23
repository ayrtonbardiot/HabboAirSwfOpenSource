// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.avatarinfo.AvatarMenuView

package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IInteractiveWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class AvatarMenuView extends AvatarContextInfoButtonView 
    {

        protected static const MODE_ACTIONS:uint = 1;
        protected static const MODE_MODERATE:uint = 2;
        protected static const MODE_BAN:uint = 4;
        protected static const MODE_MUTE:uint = 5;
        protected static const MODE_RELATIONSHIP:uint = 6;
        protected static const MODE_AMBASSADOR:uint = 7;

        protected static var lastViewMode:uint = 1;

        protected var _SafeStr_3740:_SafeStr_3363;
        protected var _SafeStr_3771:uint = 1;
        protected var _SafeStr_8952:Boolean;

        public function AvatarMenuView(_arg_1:AvatarInfoWidget)
        {
            super(_arg_1);
            _SafeStr_8948 = false;
        }

        public static function setup(_arg_1:AvatarMenuView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:_SafeStr_3363):void
        {
            _arg_1._SafeStr_3740 = _arg_6;
            AvatarContextInfoButtonView.setup(_arg_1, _arg_2, _arg_3, _arg_4, _arg_5, false);
        }


        override public function dispose():void
        {
            if (_window)
            {
                _window.removeEventListener("WME_OVER", onMouseHoverEvent);
                _window.removeEventListener("WME_OUT", onMouseHoverEvent);
            };
            _SafeStr_3740 = null;
            super.dispose();
        }

        protected function updateButtons():void
        {
            var _local_7:int;
            var _local_1:* = null;
            var _local_8:Boolean;
            var _local_4:* = null;
            var _local_2:int;
            var _local_9:* = null;
            var _local_5:int;
            if (((!(_window)) || (!(_SafeStr_3740))))
            {
                return;
            };
            var _local_3:IItemListWindow = (_window.findChildByName("buttons") as IItemListWindow);
            if (!_local_3)
            {
                return;
            };
            _local_3.procedure = buttonEventProc;
            _local_3.autoArrangeItems = false;
            var _local_6:int = _local_3.numListItems;
            _local_7 = 0;
            while (_local_7 < _local_6)
            {
                _local_3.getListItemAt(_local_7).visible = false;
                _local_7++;
            };
            if (_SafeStr_3771 == 1)
            {
                showButton("moderate", moderateMenuHasContent());
                showButton("friend", _SafeStr_3740.canBeAskedAsFriend);
                showButton("ignore", (!(_SafeStr_3740.isIgnored)));
                showButton("unignore", _SafeStr_3740.isIgnored);
                showButton("report", ((widget.configuration) && (widget.configuration.getBoolean("infostand.report.show"))));
                showButton("stargem", true, true, false, true);
                _local_1 = widget.handler;
                _local_8 = _local_1.container.sessionDataManager.isAccountSafetyLocked();
                showButton("trade", ((citizenshipTalentTrackEnabled) || ((!(_local_8)) && (_SafeStr_3740.canTrade))));
                switch (_SafeStr_3740.canTradeReason)
                {
                    case 2:
                        _local_4 = "${infostand.button.trade.tooltip.shutdown}";
                        break;
                    case 3:
                        _local_4 = "${infostand.button.trade.tooltip.tradingroom}";
                        break;
                    default:
                        _local_4 = "";
                };
                IInteractiveWindow(_SafeStr_3133(_local_3.getListItemByName("trade")).getChildByName("button")).toolTipCaption = _local_4;
                showButton("whisper");
                if (widget.configuration.getBoolean("handitem.give.enabled"))
                {
                    _local_2 = _local_1.container.roomSession.ownUserRoomId;
                    _local_9 = _local_1.container.roomEngine.getRoomObject(_local_1.roomSession.roomId, _local_2, 100);
                    if (_local_9 != null)
                    {
                        _local_5 = _local_9.getModel().getNumber("figure_carry_object");
                        if (((_local_5 > 0) && (_local_5 < 999999)))
                        {
                            showButton("pass_handitem");
                        };
                    };
                };
                showButton("relationship", ((widget.configuration.getBoolean("relationship.status.enabled")) && (_SafeStr_3740.isFriend)));
                showButton("ambassador", ambassadorMenuHasContent());
            };
            if (_SafeStr_3771 == 2)
            {
                showButton("kick", _SafeStr_3740.canBeKicked);
                showButton("ban_with_duration", _SafeStr_3740.canBeBanned);
                showButton("mute", _SafeStr_3740.canBeMuted);
                showButton("give_rights", isShowGiveRights());
                showButton("remove_rights", isShowRemoveRights());
                showButton("actions");
            };
            if (_SafeStr_3771 == 4)
            {
                showButton("ban_hour");
                showButton("ban_day");
                showButton("perm_ban");
                showButton("actions");
            };
            if (_SafeStr_3771 == 5)
            {
                showButton("mute_2min");
                showButton("mute_5min");
                showButton("mute_10min");
                showButton("actions");
            };
            if (_SafeStr_3771 == 6)
            {
                showButtonGrid("relationship_grid");
                showButton("no_relationship");
                showButton("actions");
            };
            if (_SafeStr_3771 == 7)
            {
                showButton("ambassador_kick");
                showButton("ambassador_alert");
                showButton("ambassador_mute_15min");
                showButton("ambassador_mute_60min");
                showButton("ambassador_mute_18hour");
                showButton("ambassador_mute_36hour");
                showButton("ambassador_mute_72hour");
                showButton("ambassador_unmute");
                showButton("actions");
            };
            _local_3.autoArrangeItems = true;
            _local_3.visible = true;
            lastViewMode = _SafeStr_3771;
            _SafeStr_8952 = false;
        }

        private function ambassadorMenuHasContent():Boolean
        {
            return (_SafeStr_3740.isAmbassador);
        }

        private function moderateMenuHasContent():Boolean
        {
            return (((((_SafeStr_3740.canBeKicked) || (_SafeStr_3740.canBeBanned)) || (_SafeStr_3740.canBeMuted)) || (isShowGiveRights())) || (isShowRemoveRights()));
        }

        private function isShowGiveRights():Boolean
        {
            return ((_SafeStr_3740.amIOwner) && (_SafeStr_3740.targetRoomControllerLevel < 1));
        }

        private function isShowRemoveRights():Boolean
        {
            return ((_SafeStr_3740.amIOwner) && (_SafeStr_3740.targetRoomControllerLevel == 1));
        }

        override protected function updateWindow():void
        {
            var _local_1:* = null;
            var _local_4:* = null;
            var _local_3:* = null;
            var _local_5:int;
            var _local_6:int;
            var _local_7:* = null;
            var _local_2:* = null;
            if ((((!(_SafeStr_4981)) || (!(_SafeStr_4981.assets))) || (!(_SafeStr_4981.windowManager))))
            {
                return;
            };
            if (_SafeStr_5538)
            {
                activeView = getMinimizedView();
            }
            else
            {
                if (!_window)
                {
                    _local_1 = (XmlAsset(_SafeStr_4981.assets.getAssetByName("avatar_menu_widget")).content as XML);
                    _window = (_SafeStr_4981.windowManager.buildFromXML(_local_1, 0) as _SafeStr_3133);
                    if (!_window)
                    {
                        return;
                    };
                    _window.addEventListener("WME_OVER", onMouseHoverEvent);
                    _window.addEventListener("WME_OUT", onMouseHoverEvent);
                    _window.findChildByName("minimize").addEventListener("WME_CLICK", onMinimize);
                    _window.findChildByName("minimize").addEventListener("WME_OVER", onMinimizeHover);
                    _window.findChildByName("minimize").addEventListener("WME_OUT", onMinimizeHover);
                };
                _buttons = (_window.findChildByName("buttons") as IItemListWindow);
                _buttons.procedure = buttonEventProc;
                _window.findChildByName("profile_link").procedure = buttonEventProc;
                _window.findChildByName("name").caption = _userName;
                _window.visible = false;
                activeView = _window;
                updateButtons();
                updateRelationshipStatus();
                _local_4 = (_window.findChildByName("relationship_grid") as IItemGridWindow);
                _local_3 = _local_4.iterator;
                _local_5 = _local_3.length;
                _local_6 = 0;
                while (_local_6 < _local_5)
                {
                    _local_7 = (_local_3[_local_6] as _SafeStr_3133);
                    _local_2 = (_local_7.findChildByName("button") as _SafeStr_3133);
                    _local_2.procedure = buttonEventProc;
                    _local_6++;
                };
            };
        }

        override protected function buttonEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_5:* = null;
            if (disposed)
            {
                return;
            };
            if (((!(_window)) || (_window.disposed)))
            {
                return;
            };
            var _local_3:Boolean;
            var _local_4:RoomWidgetMessage;
            if (_arg_1.type == "WME_CLICK")
            {
                if (_arg_2.name == "button")
                {
                    _local_3 = true;
                    switch (_arg_2.parent.name)
                    {
                        case "whisper":
                            _local_5 = "RWUAM_WHISPER_USER";
                            break;
                        case "friend":
                            _arg_2.disable();
                            _SafeStr_3740.canBeAskedAsFriend = false;
                            _local_5 = "RWUAM_SEND_FRIEND_REQUEST";
                            break;
                        case "stargem":
                            _local_5 = "RWUAM_GIVE_STAR_GEM_TO_USER";
                            break;
                        case "ignore":
                            _arg_2.parent.visible = false;
                            _window.findChildByName("unignore").visible = true;
                            _SafeStr_3740.isIgnored = true;
                            _local_5 = "RWUAM_IGNORE_USER";
                            break;
                        case "unignore":
                            _arg_2.parent.visible = false;
                            _window.findChildByName("ignore").visible = true;
                            _SafeStr_3740.isIgnored = false;
                            _local_5 = "RWUAM_UNIGNORE_USER";
                            break;
                        case "kick":
                            _local_5 = "RWUAM_KICK_USER";
                            break;
                        case "ban_hour":
                            _local_5 = "RWUAM_BAN_USER_HOUR";
                            break;
                        case "ban_day":
                            _local_5 = "RWUAM_BAN_USER_DAY";
                            break;
                        case "perm_ban":
                            _local_5 = "RWUAM_BAN_USER_PERM";
                            break;
                        case "mute_2min":
                            _local_5 = "RWUAM_MUTE_USER_2MIN";
                            break;
                        case "mute_5min":
                            _local_5 = "RWUAM_MUTE_USER_5MIN";
                            break;
                        case "mute_10min":
                            _local_5 = "RWUAM_MUTE_USER_10MIN";
                            break;
                        case "ban_with_duration":
                            _SafeStr_3771 = 4;
                            _SafeStr_8952 = true;
                            _local_3 = false;
                            break;
                        case "mute":
                            _SafeStr_3771 = 5;
                            _SafeStr_8952 = true;
                            _local_3 = false;
                            break;
                        case "give_rights":
                            _arg_2.parent.visible = false;
                            _window.findChildByName("remove_rights").visible = true;
                            _SafeStr_3740.myRoomControllerLevel = 1;
                            _local_5 = "RWUAM_GIVE_RIGHTS";
                            break;
                        case "remove_rights":
                            _arg_2.parent.visible = false;
                            _window.findChildByName("give_rights").visible = true;
                            _SafeStr_3740.myRoomControllerLevel = 0;
                            _local_5 = "RWUAM_TAKE_RIGHTS";
                            break;
                        case "trade":
                            _local_5 = "RWUAM_START_TRADING";
                            break;
                        case "moderate":
                            _SafeStr_3771 = 2;
                            _SafeStr_8952 = true;
                            _local_3 = false;
                            break;
                        case "report":
                            _local_5 = "RWUAM_REPORT_CFH_OTHER";
                            break;
                        case "actions":
                            _SafeStr_3771 = 1;
                            _SafeStr_8952 = true;
                            _local_3 = false;
                            break;
                        case "relationship":
                            _SafeStr_3771 = 6;
                            _SafeStr_8952 = true;
                            _local_3 = false;
                            break;
                        case "pass_handitem":
                            _local_5 = "RWUAM_PASS_CARRY_ITEM";
                            break;
                        case "relationship_heart":
                            setRelationship(1);
                            break;
                        case "relationship_smile":
                            setRelationship(2);
                            break;
                        case "relationship_bobba":
                            setRelationship(3);
                            break;
                        case "no_relationship":
                            setRelationship(0);
                            break;
                        case "ambassador":
                            _SafeStr_3771 = 7;
                            _SafeStr_8952 = true;
                            _local_3 = false;
                            break;
                        case "ambassador_alert":
                            _local_5 = "RWUAM_AMBASSADOR_ALERT_USER";
                            break;
                        case "ambassador_kick":
                            _local_5 = "RWUAM_AMBASSADOR_KICK_USER";
                            break;
                        case "ambassador_mute_2min":
                            _local_5 = "RWUAM_AMBASSADOR_MUTE_2MIN";
                            break;
                        case "ambassador_mute_10min":
                            _local_5 = "RWUAM_AMBASSADOR_MUTE_10MIN";
                            break;
                        case "ambassador_mute_15min":
                            _local_5 = "RWUAM_AMBASSADOR_MUTE_15MIN";
                            break;
                        case "ambassador_mute_60min":
                            _local_5 = "RWUAM_AMBASSADOR_MUTE_60MIN";
                            break;
                        case "ambassador_mute_18hour":
                            _local_5 = "RWUAM_AMBASSADOR_MUTE_18HOUR";
                            break;
                        case "ambassador_mute_36hour":
                            _local_5 = "RWUAM_AMBASSADOR_MUTE_36HOUR";
                            break;
                        case "ambassador_mute_72hour":
                            _local_5 = "RWUAM_AMBASSADOR_MUTE_72HOUR";
                            break;
                        case "ambassador_unmute":
                            _local_5 = "RWUAM_AMBASSADOR_UNMUTE";
                    };
                };
                if (_arg_2.name == "profile_link")
                {
                    _local_3 = true;
                    _local_4 = new RoomWidgetOpenProfileMessage("RWOPEM_OPEN_USER_PROFILE", _SafeStr_4128, "avatarContextMenu");
                };
                if (_local_5 != null)
                {
                    _local_4 = new RoomWidgetUserActionMessage(_local_5, _SafeStr_4128);
                    HabboTracking.getInstance().trackEventLog("InfoStand", "click", _local_5);
                };
                if (_local_4 != null)
                {
                    _SafeStr_4981.messageListener.processWidgetMessage(_local_4);
                };
                updateButtons();
            }
            else
            {
                if (_arg_1.type == "WME_OVER")
                {
                    if (_arg_2.name == "button")
                    {
                        switch (_arg_2.parent.name)
                        {
                            case "kick":
                                HabboTracking.getInstance().trackEventLogOncePerSession("InterfaceExplorer", "hover", "avatar.kick.hover");
                                break;
                            case "perm_ban":
                            case "ban_hour":
                            case "ban_day":
                            case "ban_with_duration":
                                HabboTracking.getInstance().trackEventLogOncePerSession("InterfaceExplorer", "hover", "avatar.ban.hover");
                                break;
                            case "mute":
                            case "mute_2min":
                            case "mute_5min":
                            case "mute_10min":
                                HabboTracking.getInstance().trackEventLogOncePerSession("InterfaceExplorer", "hover", "avatar.mute.hover");
                                break;
                            case "unignore":
                            case "ignore":
                                HabboTracking.getInstance().trackEventLogOncePerSession("InterfaceExplorer", "hover", "avatar.ignore.hover");
                        };
                    };
                }
                else
                {
                    super.buttonEventProc(_arg_1, _arg_2);
                };
            };
            if (_local_3)
            {
                _SafeStr_4981.removeView(this, false);
            };
        }

        private function get widget():AvatarInfoWidget
        {
            return (_SafeStr_4981 as AvatarInfoWidget);
        }

        private function get citizenshipTalentTrackEnabled():Boolean
        {
            return (AvatarInfoWidget(_SafeStr_4981).configuration.getBoolean("talent.track.citizenship.enabled"));
        }

        private function setRelationship(_arg_1:int):void
        {
            _SafeStr_4981.friendList.setRelationshipStatus(_SafeStr_4128, _arg_1);
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3363 = "_-bv" (String#6134, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_3771 = "_-9Y" (String#962, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5538 = "_-da" (String#3937, DoABC#4)
// _SafeStr_8948 = "_-E1n" (String#3452, DoABC#4)
// _SafeStr_8952 = "_-Jr" (String#5119, DoABC#4)


