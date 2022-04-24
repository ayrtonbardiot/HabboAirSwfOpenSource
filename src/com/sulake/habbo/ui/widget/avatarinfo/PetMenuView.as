// by nota

//com.sulake.habbo.ui.widget.avatarinfo.PetMenuView

package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class PetMenuView extends AvatarContextInfoButtonView 
    {

        protected static const MODE_NORMAL:uint = 0;
        private static const MODE_SADDLED_UP:int = 1;
        private static const MODE_RIDING:int = 2;
        private static const MODE_MONSTER_PLANT:int = 3;

        private var _SafeStr_3740:PetInfoData;
        private var _SafeStr_3771:int = 0;

        public function PetMenuView(_arg_1:AvatarInfoWidget)
        {
            super(_arg_1);
            _SafeStr_8948 = false;
        }

        public static function setup(_arg_1:PetMenuView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:PetInfoData):void
        {
            _arg_1._SafeStr_3740 = _arg_6;
            var _local_7:Boolean = _arg_1.widget.hasFreeSaddle;
            var _local_8:Boolean = _arg_1.widget.isRiding;
            if (_arg_1.widget.isMonsterPlant())
            {
                _arg_1._SafeStr_3771 = 3;
            }
            else
            {
                if (((_local_7) && (!(_local_8))))
                {
                    _arg_1._SafeStr_3771 = 1;
                }
                else
                {
                    if (_local_8)
                    {
                        _arg_1._SafeStr_3771 = 2;
                    }
                    else
                    {
                        _arg_1._SafeStr_3771 = 0;
                    };
                };
            };
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
            var _local_8:int;
            var _local_1:Number;
            var _local_9:Number;
            var _local_2:* = null;
            var _local_3:int;
            var _local_11:* = null;
            var _local_5:int;
            if (((!(_window)) || (!(_SafeStr_3740))))
            {
                return;
            };
            var _local_4:IItemListWindow = (_window.findChildByName("buttons") as IItemListWindow);
            if (!_local_4)
            {
                return;
            };
            _local_4.procedure = buttonEventProc;
            _local_4.autoArrangeItems = false;
            var _local_7:int = _local_4.numListItems;
            _local_8 = 0;
            while (_local_8 < _local_7)
            {
                _local_4.getListItemAt(_local_8).visible = false;
                _local_8++;
            };
            var _local_10:IRoomSession = widget.handler.roomSession;
            var _local_6:ISessionDataManager = widget.handler.container.sessionDataManager;
            if ((((_local_10.isRoomOwner) || (_local_6.isAnyRoomController)) || (_local_10.roomControllerLevel >= 1)))
            {
                showButton("pick_up");
            };
            switch (_SafeStr_3771)
            {
                case 0:
                    showButton("respect", (_SafeStr_3740.petRespectLeft > 0));
                    break;
                case 1:
                    if (widget.configuration.getBoolean("sharedhorseriding.enabled"))
                    {
                        showButton("mount");
                    };
                    showButton("respect", (_SafeStr_3740.petRespectLeft > 0));
                    break;
                case 2:
                    if (widget.configuration.getBoolean("sharedhorseriding.enabled"))
                    {
                        showButton("dismount");
                    };
                    showButton("respect", (_SafeStr_3740.petRespectLeft > 0));
                    break;
                case 3:
                    if (!_SafeStr_3740.canRevive)
                    {
                        showButton("respect", false);
                        _local_1 = (_SafeStr_3740.energy as Number);
                        _local_9 = (_SafeStr_3740.energyMax as Number);
                        showButton("treat", true, ((_local_1 / _local_9) < 0.98));
                    };
                default:
            };
            widget.localizations.registerParameter("infostand.button.petrespect", "count", _SafeStr_3740.petRespectLeft.toString());
            if (widget.configuration.getBoolean("handitem.give.pet.enabled"))
            {
                _local_2 = widget.handler;
                _local_3 = _local_2.container.roomSession.ownUserRoomId;
                _local_11 = _local_2.container.roomEngine.getRoomObject(_local_2.roomSession.roomId, _local_3, 100);
                if (_local_11 != null)
                {
                    _local_5 = _local_11.getModel().getNumber("figure_carry_object");
                    if (((_local_5 > 0) && (_local_5 < 999999)))
                    {
                        showButton("pass_handitem");
                    };
                };
            };
            _local_4.autoArrangeItems = true;
            _local_4.visible = true;
        }

        override protected function updateWindow():void
        {
            var _local_1:* = null;
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
                    _local_1 = (XmlAsset(_SafeStr_4981.assets.getAssetByName("pet_menu")).content as XML);
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
                _window.findChildByName("name").caption = _userName;
                _window.visible = false;
                activeView = _window;
                updateButtons();
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
                        case "mount":
                            _local_4 = new RoomWidgetUserActionMessage("RWUAM_MOUNT_PET", userId);
                            break;
                        case "dismount":
                            _local_4 = new RoomWidgetUserActionMessage("RWUAM_DISMOUNT_PET", userId);
                            break;
                        case "respect":
                            _SafeStr_3740.petRespectLeft = (_SafeStr_3740.petRespectLeft - 1);
                            updateButtons();
                            _local_4 = new RoomWidgetUserActionMessage(" RWUAM_RESPECT_PET", userId);
                            break;
                        case "treat":
                            _local_4 = new RoomWidgetUserActionMessage("RWUAM_TREAT_PET", userId);
                            break;
                        case "pass_handitem":
                            _local_4 = new RoomWidgetUserActionMessage("RWUAM_GIVE_CARRY_ITEM_TO_PET", userId);
                            break;
                        case "pick_up":
                            _local_4 = new RoomWidgetUserActionMessage("RWUAM_PICKUP_PET", userId);
                    };
                };
                if (_arg_2.name == "profile_link")
                {
                    _local_4 = new RoomWidgetOpenProfileMessage("RWOPEM_OPEN_USER_PROFILE", _SafeStr_4128, "petContextMenu");
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
                super.buttonEventProc(_arg_1, _arg_2);
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


    }
}//package com.sulake.habbo.ui.widget.avatarinfo

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_3771 = "_-9Y" (String#962, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5538 = "_-da" (String#3937, DoABC#4)
// _SafeStr_8948 = "_-E1n" (String#3452, DoABC#4)


