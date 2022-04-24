// by nota

//com.sulake.habbo.ui.widget.avatarinfo.OwnPetMenuView

package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.ui.handler.AvatarInfoWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.core.window.components._SafeStr_3158;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPetCommandMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class OwnPetMenuView extends AvatarContextInfoButtonView 
    {

        private static const MODE_NORMAL:int = 0;
        private static const MODE_SADDLED_UP:int = 1;
        private static const MODE_RIDING:int = 2;
        private static const MODE_MONSTERPLANT:int = 3;

        private var _SafeStr_3740:PetInfoData;
        private var _SafeStr_3771:int;
        private var _SafeStr_5578:_SafeStr_3130;
        private var _SafeStr_5579:_SafeStr_3130;
        protected var _catalog:IHabboCatalog;
        protected var _habboTracking:_SafeStr_1704;

        public function OwnPetMenuView(_arg_1:AvatarInfoWidget, _arg_2:IHabboCatalog)
        {
            super(_arg_1);
            _SafeStr_8948 = false;
            _habboTracking = HabboTracking.getInstance();
            _catalog = _arg_2;
        }

        public static function setup(_arg_1:OwnPetMenuView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:PetInfoData):void
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
            _SafeStr_3740 = null;
            _SafeStr_5578 = null;
            _SafeStr_5579 = null;
            _catalog = null;
            _habboTracking = null;
            super.dispose();
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
                    _local_1 = (XmlAsset(_SafeStr_4981.assets.getAssetByName("own_pet_menu")).content as XML);
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

        public function updateButtons():void
        {
            var _local_6:int;
            var _local_2:Number;
            var _local_7:Number;
            var _local_3:int;
            var _local_8:* = null;
            var _local_4:int;
            if ((((!(_window)) || (!(_SafeStr_3740))) || (!(_buttons))))
            {
                return;
            };
            _buttons.autoArrangeItems = false;
            var _local_5:int = _buttons.numListItems;
            _local_6 = 0;
            while (_local_6 < _local_5)
            {
                _buttons.getListItemAt(_local_6).visible = false;
                _local_6++;
            };
            _SafeStr_5578 = null;
            var _local_1:AvatarInfoWidgetHandler = widget.handler;
            switch (_SafeStr_3771)
            {
                case 0:
                    showButton("respect", (_SafeStr_3740.petRespectLeft > 0));
                    showButton("train");
                    showButton("pick_up");
                    if (_SafeStr_3740.petType == 15)
                    {
                        _SafeStr_5578 = findFurnitureData(16, 15);
                        if (_SafeStr_5578 != null)
                        {
                            showButton("buy_saddle");
                        };
                    };
                    if (widget.configuration.getBoolean("nest.breeding.bear.enabled"))
                    {
                        if (_SafeStr_3740.petType == 4)
                        {
                            showButton("breed");
                        };
                    };
                    if (widget.configuration.getBoolean("nest.breeding.terrier.enabled"))
                    {
                        if (_SafeStr_3740.petType == 3)
                        {
                            showButton("breed");
                        };
                    };
                    if (widget.configuration.getBoolean("nest.breeding.cat.enabled"))
                    {
                        if (_SafeStr_3740.petType == 1)
                        {
                            showButton("breed");
                        };
                    };
                    if (widget.configuration.getBoolean("nest.breeding.dog.enabled"))
                    {
                        if (_SafeStr_3740.petType == 0)
                        {
                            showButton("breed");
                        };
                    };
                    if (widget.configuration.getBoolean("nest.breeding.pig.enabled"))
                    {
                        if (_SafeStr_3740.petType == 5)
                        {
                            showButton("breed");
                        };
                    };
                    break;
                case 1:
                    showButton("mount");
                    if (widget.configuration.getBoolean("sharedhorseriding.enabled"))
                    {
                        showButton("toggle_riding_permission");
                        enableCheckbox("toggle_riding_permission", ((_SafeStr_3740 != null) ? (_SafeStr_3740.accessRights == 1) : false));
                    };
                    showButton("respect", (_SafeStr_3740.petRespectLeft > 0));
                    showButton("train");
                    showButton("pick_up");
                    showButton("saddle_off");
                    break;
                case 2:
                    showButton("dismount");
                    showButton("respect", (_SafeStr_3740.petRespectLeft > 0));
                    break;
                case 3:
                    showButton("pick_up");
                    if (_SafeStr_3740.canRevive)
                    {
                        _SafeStr_5579 = findFurnitureData(20, 16);
                        showButton("revive");
                        if (((widget.configuration.getBoolean("monsterplants.composting.enabled")) && (_local_1.container.roomSession.isRoomOwner)))
                        {
                            showButton("compost");
                        };
                    }
                    else
                    {
                        _local_2 = (_SafeStr_3740.energy as Number);
                        _local_7 = (_SafeStr_3740.energyMax as Number);
                        showButton("treat", true, ((_local_2 / _local_7) < 0.98));
                        if (_SafeStr_3740.level == _SafeStr_3740.levelMax)
                        {
                            if (_SafeStr_3740.canBreed)
                            {
                                showButton("toggle_breeding_permission");
                                enableCheckbox("toggle_breeding_permission", _SafeStr_3740.hasBreedingPermission);
                                showButton("breed");
                            };
                        };
                    };
                default:
            };
            if (widget.configuration.getBoolean("handitem.give.pet.enabled"))
            {
                _local_3 = _local_1.container.roomSession.ownUserRoomId;
                _local_8 = _local_1.container.roomEngine.getRoomObject(_local_1.roomSession.roomId, _local_3, 100);
                if (_local_8 != null)
                {
                    _local_4 = _local_8.getModel().getNumber("figure_carry_object");
                    if (((_local_4 > 0) && (_local_4 < 999999)))
                    {
                        showButton("pass_handitem");
                    };
                };
            };
            widget.localizations.registerParameter("infostand.button.petrespect", "count", _SafeStr_3740.petRespectLeft.toString());
            _buttons.autoArrangeItems = true;
            _buttons.visible = true;
        }

        private function findFurnitureData(_arg_1:int, _arg_2:int):_SafeStr_3130
        {
            var _local_3:* = null;
            var _local_6:int;
            var _local_4:_SafeStr_3130;
            var _local_7:Array = widget.handler.container.sessionDataManager.getFloorItemsDataByCategory(_arg_1);
            for each (var _local_5:_SafeStr_3130 in _local_7)
            {
                _local_3 = _local_5.customParams.split(" ");
                _local_6 = (((_local_3) && (_local_3.length >= 1)) ? parseInt(_local_3[0]) : -1);
                if (_local_6 == _arg_2)
                {
                    _local_4 = _local_5;
                    break;
                };
            };
            return (_local_4);
        }

        private function openCatalogPage(_arg_1:_SafeStr_3130):Boolean
        {
            if ((((_catalog == null) || (_arg_1 == null)) || (_arg_1.purchaseOfferId < 0)))
            {
                return (false);
            };
            _catalog.openCatalogPageByOfferId(_arg_1.purchaseOfferId, "NORMAL");
            if (((_habboTracking) && (!(_habboTracking.disposed))))
            {
                _habboTracking.trackGoogle("infostandCatalogButton", "offer", _arg_1.purchaseOfferId);
            };
            return (true);
        }

        private function findRoomObject(_arg_1:_SafeStr_3130):IRoomObject
        {
            var _local_5:int;
            var _local_3:* = null;
            var _local_7:int;
            if (((widget == null) || (_arg_1 == null)))
            {
                return (null);
            };
            var _local_2:IRoomWidgetHandlerContainer = widget.handler.container;
            if (_local_2 == null)
            {
                return (null);
            };
            var _local_6:IRoomEngine = _local_2.roomEngine;
            if (_local_6 == null)
            {
                return (null);
            };
            var _local_8:int = _local_2.roomSession.roomId;
            var _local_4:int = _local_6.getRoomObjectCount(_local_8, 10);
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_3 = _local_6.getRoomObjectWithIndex(_local_8, _local_5, 10);
                if (_local_3 != null)
                {
                    _local_7 = _local_3.getModel().getNumber("furniture_type_id");
                    if (_local_7 == _arg_1.id)
                    {
                        return (_local_3);
                    };
                };
                _local_5++;
            };
            return (null);
        }

        private function enableCheckbox(_arg_1:String, _arg_2:Boolean):void
        {
            var _local_3:_SafeStr_3158 = getCheckbox(_arg_1);
            if (!_local_3)
            {
                return;
            };
            if (_arg_2)
            {
                _local_3.select();
            }
            else
            {
                _local_3.unselect();
            };
        }

        private function getCheckbox(_arg_1:String):_SafeStr_3158
        {
            if (!_buttons)
            {
                return (null);
            };
            var _local_2:_SafeStr_3133 = (_buttons.getListItemByName(_arg_1) as _SafeStr_3133);
            if (!_local_2)
            {
                return (null);
            };
            return (_local_2.findChildByName((_arg_1 + "_checkbox")) as _SafeStr_3158);
        }

        override protected function buttonEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_8:* = null;
            var _local_5:* = null;
            var _local_9:int;
            var _local_6:* = null;
            var _local_4:* = null;
            var _local_7:Boolean;
            if (disposed)
            {
                return;
            };
            if (((!(_window)) || (_window.disposed)))
            {
                return;
            };
            var _local_3:Boolean;
            if (_arg_1.type == "WME_CLICK")
            {
                if (_arg_2.name == "button")
                {
                    _local_3 = true;
                    _SafeStr_14.log(("Own pet menu was clicked: " + _arg_2.parent.name));
                    switch (_arg_2.parent.name)
                    {
                        case "respect":
                            _SafeStr_3740.petRespectLeft = (_SafeStr_3740.petRespectLeft - 1);
                            updateButtons();
                            _local_8 = new RoomWidgetUserActionMessage(" RWUAM_RESPECT_PET", petId);
                            break;
                        case "treat":
                            _local_8 = new RoomWidgetUserActionMessage("RWUAM_TREAT_PET", petId);
                            break;
                        case "pass_handitem":
                            _local_8 = new RoomWidgetUserActionMessage("RWUAM_GIVE_CARRY_ITEM_TO_PET", petId);
                            break;
                        case "train":
                            widget.openTrainingView();
                            break;
                        case "pick_up":
                            _local_8 = new RoomWidgetUserActionMessage("RWUAM_PICKUP_PET", petId);
                            widget.closeTrainingView();
                            break;
                        case "mount":
                            _local_8 = new RoomWidgetUserActionMessage("RWUAM_MOUNT_PET", petId);
                            break;
                        case "toggle_riding_permission":
                            _local_8 = new RoomWidgetUserActionMessage("RWUAM_TOGGLE_PET_RIDING_PERMISSION", petId);
                            _local_5 = getCheckbox("toggle_riding_permission");
                            if (_local_5 != null)
                            {
                                enableCheckbox("toggle_riding_permission", (!(_local_5.isSelected)));
                            };
                            break;
                        case "toggle_breeding_permission":
                            _local_8 = new RoomWidgetUserActionMessage("RWUAM_TOGGLE_PET_BREEDING_PERMISSION", petId);
                            _local_5 = getCheckbox("toggle_breeding_permission");
                            if (_local_5 != null)
                            {
                                enableCheckbox("toggle_breeding_permission", (!(_local_5.isSelected)));
                            };
                            break;
                        case "dismount":
                            _local_8 = new RoomWidgetUserActionMessage("RWUAM_DISMOUNT_PET", petId);
                            break;
                        case "saddle_off":
                            _local_8 = new RoomWidgetUserActionMessage("RWUAM_SADDLE_OFF", petId);
                            break;
                        case "breed":
                            if (_SafeStr_3771 == 0)
                            {
                                _local_9 = 46;
                                _local_6 = ("pet.command." + _local_9);
                                _local_4 = _SafeStr_4981.catalog.localization.getLocalization(_local_6);
                                _local_8 = new RoomWidgetPetCommandMessage("RWPCM_PET_COMMAND", _SafeStr_3740.id, ((_SafeStr_3740.name + " ") + _local_4));
                            }
                            else
                            {
                                if (_SafeStr_3771 == 3)
                                {
                                    _local_8 = new RoomWidgetUserActionMessage("RWUAM_REQUEST_BREED_PET", petId);
                                };
                            };
                            break;
                        case "harvest":
                            _local_8 = new RoomWidgetUserActionMessage("RWUAM_HARVEST_PET", petId);
                            break;
                        case "revive":
                            _local_7 = openCatalogPage(_SafeStr_5579);
                            if (!_local_7)
                            {
                            };
                            _local_8 = new RoomWidgetUserActionMessage("RWUAM_REVIVE_PET", petId);
                            break;
                        case "compost":
                            _local_8 = new RoomWidgetUserActionMessage("RWUAM_COMPOST_PLANT", petId);
                            break;
                        case "buy_saddle":
                            openCatalogPage(_SafeStr_5578);
                    };
                }
                else
                {
                    if (_arg_2.name == "profile_link")
                    {
                        _local_8 = new RoomWidgetOpenProfileMessage("RWOPEM_OPEN_USER_PROFILE", petId, "ownPetContextMenu");
                    }
                    else
                    {
                        if (_arg_2.name == "toggle_riding_permission_checkbox")
                        {
                            _local_3 = true;
                            _local_8 = new RoomWidgetUserActionMessage("RWUAM_TOGGLE_PET_RIDING_PERMISSION", petId);
                        }
                        else
                        {
                            if (_arg_2.name == "toggle_breeding_permission_checkbox")
                            {
                                _local_3 = true;
                                _local_8 = new RoomWidgetUserActionMessage("RWUAM_TOGGLE_PET_BREEDING_PERMISSION", petId);
                            };
                        };
                    };
                };
                if (_local_8)
                {
                    _SafeStr_4981.messageListener.processWidgetMessage(_local_8);
                };
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

        public function get widget():AvatarInfoWidget
        {
            return (_SafeStr_4981 as AvatarInfoWidget);
        }

        private function changeMode(_arg_1:int):void
        {
            _SafeStr_3771 = _arg_1;
            updateButtons();
        }

        public function get petId():int
        {
            return (userId);
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_3771 = "_-9Y" (String#962, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5538 = "_-da" (String#3937, DoABC#4)
// _SafeStr_5578 = "_-A1A" (String#8572, DoABC#4)
// _SafeStr_5579 = "_-W1Z" (String#12323, DoABC#4)
// _SafeStr_8948 = "_-E1n" (String#3452, DoABC#4)


