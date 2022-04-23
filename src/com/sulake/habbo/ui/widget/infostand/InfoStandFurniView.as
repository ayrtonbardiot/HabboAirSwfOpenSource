// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.infostand.InfoStandFurniView

package com.sulake.habbo.ui.widget.infostand
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.tracking._SafeStr_1704;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.core.window.components.ITextWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.utils.FriendlyTime;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniActionMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetGetBadgeDetailsMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.habbo.utils._SafeStr_3270;
    import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfoUpdateEvent;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets.ILimitedItemPreviewOverlayWidget;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.window.widgets.IRarityItemPreviewOverlayWidget;
    import com.sulake.habbo.window.widgets._SafeStr_3349;

    public class InfoStandFurniView 
    {

        private static const _SafeStr_9033:int = -12345678;

        private const _SafeStr_5482:int = 0;
        private const _SafeStr_9034:int = 1;
        private const _SafeStr_9035:int = 2;

        protected var _window:IItemListWindow;
        protected var _SafeStr_5483:_SafeStr_3133;
        protected var _SafeStr_5487:_SafeStr_3109;
        protected var _SafeStr_5484:_SafeStr_3195;
        protected var _buttons:IItemListWindow;
        protected var _catalog:IHabboCatalog;
        protected var _habboTracking:_SafeStr_1704;
        protected var _catalogButton:_SafeStr_3109;
        protected var _rentButton:_SafeStr_3109;
        protected var _extendButton:_SafeStr_3109;
        protected var _buyoutButton:_SafeStr_3109;
        private var _SafeStr_5486:int = _SafeStr_5482;
        private var _SafeStr_5226:int = 0;
        protected var _SafeStr_4981:InfoStandWidget;
        protected var _SafeStr_5485:IItemListWindow;

        public function InfoStandFurniView(_arg_1:InfoStandWidget, _arg_2:String, _arg_3:IHabboCatalog)
        {
            _SafeStr_4981 = _arg_1;
            _catalog = _arg_3;
            _habboTracking = HabboTracking.getInstance();
            createWindow(_arg_2);
        }

        public function dispose():void
        {
            _catalog = null;
            _SafeStr_4981 = null;
            _window.dispose();
            _window = null;
        }

        public function get window():IItemListWindow
        {
            return (_window);
        }

        protected function createWindow(_arg_1:String):void
        {
            var _local_2:* = null;
            var _local_5:int;
            var _local_4:XmlAsset = (_SafeStr_4981.assets.getAssetByName("furni_view") as XmlAsset);
            _window = (_SafeStr_4981.windowManager.buildFromXML((_local_4.content as XML)) as IItemListWindow);
            if (_window == null)
            {
                throw (new Error("Failed to construct window from XML!"));
            };
            _SafeStr_5484 = (_window.getListItemByName("info_border") as _SafeStr_3195);
            _buttons = (_window.getListItemByName("button_list") as IItemListWindow);
            _SafeStr_5483 = (_window.getListItemByName("custom_variables") as _SafeStr_3133);
            if (!_SafeStr_4981.handler.container.sessionDataManager.hasSecurity(5))
            {
                _SafeStr_5483.dispose();
                _SafeStr_5483 = null;
            };
            if (_SafeStr_5483 != null)
            {
                _SafeStr_5483.procedure = customVarsWindowProcedure;
                _SafeStr_5487 = IItemListWindow(_SafeStr_5483.findChildByName("variable_list")).removeListItemAt(0);
            };
            if (_SafeStr_5484 != null)
            {
                _SafeStr_5485 = (_SafeStr_5484.findChildByName("infostand_element_list") as IItemListWindow);
            };
            _window.name = _arg_1;
            _SafeStr_4981.mainContainer.addChild(_window);
            var _local_3:_SafeStr_3109 = _SafeStr_5484.findChildByTag("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener("WME_CLICK", onClose);
            };
            if (_buttons != null)
            {
                _local_5 = 0;
                while (_local_5 < _buttons.numListItems)
                {
                    _local_2 = _buttons.getListItemAt(_local_5);
                    _local_2.addEventListener("WME_CLICK", onButtonClicked);
                    _local_5++;
                };
            };
            _catalogButton = _SafeStr_5484.findChildByTag("catalog");
            if (_catalogButton != null)
            {
                _catalogButton.addEventListener("WME_CLICK", onCatalogButtonClicked);
            };
            _rentButton = _SafeStr_5484.findChildByName("rent_button");
            if (_rentButton != null)
            {
                _rentButton.addEventListener("WME_CLICK", onRentButtonClicked);
            };
            _extendButton = _SafeStr_5484.findChildByName("extend_button");
            if (_extendButton != null)
            {
                _extendButton.addEventListener("WME_CLICK", onExtendButtonClicked);
            };
            _buyoutButton = _SafeStr_5484.findChildByName("buyout_button");
            if (_buyoutButton != null)
            {
                _buyoutButton.addEventListener("WME_CLICK", onBuyoutButtonClicked);
            };
            var _local_6:IRegionWindow = (_SafeStr_5485.getListItemByName("owner_region") as IRegionWindow);
            if (_local_6 != null)
            {
                _local_6.addEventListener("WME_CLICK", onOwnerRegion);
                _local_6.addEventListener("WME_OVER", onOwnerRegion);
                _local_6.addEventListener("WME_OUT", onOwnerRegion);
            };
            var _local_7:_SafeStr_3109 = _SafeStr_5484.findChildByName("group_details_container");
            if (_local_7)
            {
                _local_7.addEventListener("WME_CLICK", onGroupInfoClicked);
            };
        }

        private function customVarsWindowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_4:int;
            var _local_6:* = null;
            if (((!(_arg_1.type == "WME_CLICK")) || (!(!(_SafeStr_5483 == null)))))
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "set_values":
                    _local_5 = new _SafeStr_24();
                    _local_3 = (_SafeStr_5483.findChildByName("variable_list") as IItemListWindow);
                    _local_4 = 0;
                    while (_local_4 < _local_3.numListItems)
                    {
                        _local_6 = (_local_3.getListItemAt(_local_4) as _SafeStr_3133);
                        _local_5[_local_6.name] = _local_6.findChildByName("value").caption;
                        _local_4++;
                    };
                    _SafeStr_4981.handler.setObjectData(_local_5);
                    return;
            };
        }

        protected function onBuyoutButtonClicked(_arg_1:WindowMouseEvent):void
        {
            var _local_2:* = null;
            if ((((!(_catalog == null)) && (_SafeStr_4981)) && (_SafeStr_4981.furniData)))
            {
                _local_2 = getFurnitureData(_SafeStr_4981.furniData);
                if (_local_2)
                {
                    _catalog.openRentConfirmationWindow(_local_2, true, _SafeStr_4981.furniData.id);
                };
            };
        }

        protected function onExtendButtonClicked(_arg_1:WindowMouseEvent):void
        {
            var _local_2:* = null;
            if ((((!(_catalog == null)) && (_SafeStr_4981)) && (_SafeStr_4981.furniData)))
            {
                _local_2 = getFurnitureData(_SafeStr_4981.furniData);
                if (_local_2)
                {
                    _catalog.openRentConfirmationWindow(_local_2, false, _SafeStr_4981.furniData.id);
                };
            };
        }

        private function getRoomObject(_arg_1:int):IRoomObject
        {
            var _local_3:int = _SafeStr_4981.handler.container.roomSession.roomId;
            var _local_2:IRoomObject = _SafeStr_4981.handler.container.roomEngine.getRoomObject(_local_3, _arg_1, 10);
            if (_local_2 == null)
            {
                _local_2 = _SafeStr_4981.handler.container.roomEngine.getRoomObject(_local_3, _arg_1, 20);
            };
            return (_local_2);
        }

        private function getFurnitureData(_arg_1:InfoStandFurniData):_SafeStr_3130
        {
            var _local_4:* = null;
            var _local_2:IRoomObject = getRoomObject(_arg_1.id);
            if (_local_2 == null)
            {
                return (null);
            };
            var _local_3:* = (_SafeStr_4981.furniData.category == 20);
            var _local_5:int = _local_2.getModel().getNumber("furniture_type_id");
            if (_local_3)
            {
                _local_4 = _SafeStr_4981.handler.container.sessionDataManager.getWallItemData(_local_5);
            }
            else
            {
                _local_4 = _SafeStr_4981.handler.container.sessionDataManager.getFloorItemData(_local_5);
            };
            return (_local_4);
        }

        protected function onRentButtonClicked(_arg_1:WindowMouseEvent):void
        {
            if (_catalog != null)
            {
                _catalog.openCatalogPageByOfferId(_SafeStr_4981.furniData.rentOfferId, "NORMAL");
            };
        }

        protected function onClose(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.close();
        }

        public function set name(_arg_1:String):void
        {
            var _local_2:ITextWindow = (_SafeStr_5485.getListItemByName("name_text") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.text = _arg_1;
            _local_2.visible = true;
            _local_2.height = (_local_2.textHeight + 5);
            updateWindow();
        }

        public function set furniImage(_arg_1:BitmapData):void
        {
            setImage(_arg_1, "image");
        }

        private function setImage(_arg_1:BitmapData, _arg_2:String):void
        {
            var _local_3:_SafeStr_3264 = (_SafeStr_5484.findChildByName(_arg_2) as _SafeStr_3264);
            if (_local_3 == null)
            {
                return;
            };
            if (_arg_1 == null)
            {
                _arg_1 = new BitmapData(_local_3.width, 40, true);
            };
            _local_3.height = Math.min(_arg_1.height, 200);
            _local_3.bitmap = _arg_1.clone();
            _local_3.visible = true;
            updateWindow();
        }

        public function set description(_arg_1:String):void
        {
            var _local_2:ITextWindow = (_SafeStr_5485.getListItemByName("description_text") as ITextWindow);
            if (_local_2 == null)
            {
                return;
            };
            _local_2.text = _arg_1;
            _local_2.height = (_local_2.textHeight + 5);
            updateWindow();
        }

        public function setOwnerInfo(_arg_1:int, _arg_2:String):void
        {
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_6:* = null;
            _SafeStr_5226 = _arg_1;
            if (_SafeStr_5226 == 0)
            {
                showWindow("owner_region", false);
                showWindow("owner_spacer", false);
            }
            else
            {
                _local_4 = (_SafeStr_5485.getListItemByName("owner_region") as IRegionWindow);
                _local_5 = (_local_4.findChildByName("owner_name") as ITextWindow);
                _local_3 = _local_4.findChildByName("owner_link");
                _local_6 = _local_4.findChildByName("bcw_icon");
                if (_SafeStr_5226 != -12345678)
                {
                    _local_5.text = _arg_2;
                    _local_4.toolTipCaption = _SafeStr_4981.localizations.getLocalization("infostand.profile.link.tooltip", "");
                    _local_4.toolTipDelay = 100;
                    _local_3.visible = true;
                    if (_local_6 != null)
                    {
                        _local_6.visible = false;
                    };
                }
                else
                {
                    _local_5.text = "${builder.catalog.title}";
                    _local_4.toolTipCaption = "";
                    _local_3.visible = false;
                    if (_local_6 != null)
                    {
                        _local_6.visible = true;
                    };
                };
                showWindow("owner_region", true);
                showWindow("owner_spacer", true);
            };
            updateWindow();
        }

        private function set expiration(_arg_1:int):void
        {
            var _local_2:_SafeStr_3109 = _SafeStr_5485.getListItemByName("expiration_text");
            if (_local_2 == null)
            {
                return;
            };
            _SafeStr_4981.localizations.registerParameter("infostand.rent.expiration", "time", FriendlyTime.getFriendlyTime(_SafeStr_4981.handler.container.localization, _arg_1));
            _local_2.visible = ((_arg_1 >= 0) && (_SafeStr_5226 == _SafeStr_4981.handler.container.sessionDataManager.userId));
            updateWindow();
        }

        protected function onButtonClicked(_arg_1:WindowMouseEvent):void
        {
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_2:_SafeStr_3109 = (_arg_1.target as _SafeStr_3109);
            switch (_local_2.name)
            {
                case "rotate":
                    _local_5 = "RWFUAM_ROTATE";
                    break;
                case "move":
                    _local_5 = "RWFAM_MOVE";
                    break;
                case "pickup":
                    if (_SafeStr_5486 == 2)
                    {
                        _local_5 = "RWFAM_PICKUP";
                    }
                    else
                    {
                        _local_5 = "RWFAM_EJECT";
                    };
                    _SafeStr_4981.close();
                    break;
                case "save_branding_configuration":
                    if (_SafeStr_4981.handler.container.sessionDataManager.hasSecurity(4))
                    {
                        _local_5 = "RWFAM_SAVE_STUFF_DATA";
                        _local_3 = getVisibleAdFurnitureExtraParams();
                        break;
                    };
                case "use":
                    _local_5 = "RWFAM_USE";
            };
            if (_local_5 != null)
            {
                _local_4 = new RoomWidgetFurniActionMessage(_local_5, _SafeStr_4981.furniData.id, _SafeStr_4981.furniData.category, _SafeStr_4981.furniData.purchaseOfferId, _local_3);
                _SafeStr_4981.messageListener.processWidgetMessage(_local_4);
            };
        }

        private function onGroupInfoClicked(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetGetBadgeDetailsMessage(false, _SafeStr_4981.furniData.groupId));
        }

        protected function onCatalogButtonClicked(_arg_1:WindowMouseEvent):void
        {
            if (_catalog != null)
            {
                _catalog.openCatalogPageByOfferId(_SafeStr_4981.furniData.purchaseOfferId, "NORMAL");
                if (((_habboTracking) && (!(_habboTracking.disposed))))
                {
                    _habboTracking.trackGoogle("infostandCatalogButton", "offer", _SafeStr_4981.furniData.purchaseOfferId);
                };
            };
        }

        protected function onOwnerRegion(_arg_1:WindowMouseEvent):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                if (_SafeStr_5226 == -12345678)
                {
                    _SafeStr_4981.handler.container.catalog.toggleBuilderCatalog();
                }
                else
                {
                    _SafeStr_4981.messageListener.processWidgetMessage(new RoomWidgetOpenProfileMessage("RWOPEM_OPEN_USER_PROFILE", _SafeStr_5226, "infoStand_furniView"));
                };
            };
            if (_arg_1.type == "WME_OUT")
            {
                IIconWindow(IRegionWindow(_arg_1.target).findChildByName("owner_link")).style = 21;
            };
            if (_arg_1.type == "WME_OVER")
            {
                IIconWindow(IRegionWindow(_arg_1.target).findChildByName("owner_link")).style = 22;
            };
        }

        protected function updateWindow():void
        {
            if ((((_SafeStr_5485 == null) || (_SafeStr_5484 == null)) || (_buttons == null)))
            {
                return;
            };
            _SafeStr_5485.arrangeListItems();
            _buttons.width = _buttons.scrollableRegion.width;
            _SafeStr_5485.height = _SafeStr_5485.scrollableRegion.height;
            _SafeStr_5484.height = (_SafeStr_5485.height + 20);
            _window.width = Math.max(_SafeStr_5484.width, _buttons.width);
            _window.height = _window.scrollableRegion.height;
            if (_SafeStr_5484.width < _buttons.width)
            {
                _SafeStr_5484.x = (_window.width - _SafeStr_5484.width);
                _buttons.x = 0;
            }
            else
            {
                _buttons.x = (_window.width - _buttons.width);
                _SafeStr_5484.x = 0;
            };
            if (_SafeStr_5483 != null)
            {
                _SafeStr_5483.x = _SafeStr_5484.x;
            };
            _SafeStr_4981.refreshContainer();
        }

        public function update(_arg_1:RoomWidgetFurniInfoUpdateEvent):void
        {
            if (_SafeStr_5484 != null)
            {
                _SafeStr_5484.color = ((_SafeStr_3270.isBuilderClubId(_arg_1.id)) ? 0xD77900 : 0xFFFFFF);
            };
            name = _arg_1.name;
            description = _arg_1.description;
            furniImage = _arg_1.image;
            expiration = _arg_1.expiration;
            setOwnerInfo(((_SafeStr_3270.isBuilderClubId(_arg_1.id)) ? -12345678 : _arg_1.ownerId), _arg_1.ownerName);
            var _local_3:Boolean;
            var _local_4:Boolean;
            var _local_5:Boolean;
            var _local_2:Boolean;
            if (((((_arg_1.roomControllerLevel >= 1) || (_arg_1.isOwner)) || (_arg_1.isRoomOwner)) || (_arg_1.isAnyRoomController)))
            {
                _local_3 = true;
                _local_4 = (!(_arg_1.isWallItem));
            };
            if (_arg_1.isAnyRoomController)
            {
                _local_5 = true;
            };
            var _local_6:* = (_arg_1.roomControllerLevel >= 1);
            if (((((_arg_1.usagePolicy == 2) || ((_arg_1.usagePolicy == 1) && (_local_6))) || ((_arg_1.extraParam == "RWEIEP_JUKEBOX") && (_local_6))) || ((_arg_1.extraParam == "RWEIEP_USABLE_PRODUCT") && (_local_6))))
            {
                _local_2 = _SafeStr_4981.config.getBoolean("infostand.use.button.enabled");
            };
            updatePickupMode(_arg_1);
            showButton("move", _local_3);
            showButton("rotate", _local_4);
            showButton("use", _local_2);
            showAdFurnitureDetails(_local_5);
            showGroupInfo((_arg_1.groupId > 0));
            updatePurchaseButtonVisibility(_arg_1.isOwner, (_arg_1.expiration >= 0), (_arg_1.purchaseOfferId >= 0), (_arg_1.rentOfferId >= 0), _arg_1.purchaseCouldBeUsedForBuyout, _arg_1.rentCouldBeUsedForBuyout);
            showLimitedItem((_arg_1.stuffData.uniqueSerialNumber > 0), _arg_1.stuffData);
            showRarityItem((_arg_1.stuffData.rarityLevel >= 0), _arg_1.stuffData);
            _buttons.visible = ((((_local_3) || (_local_4)) || (!(_SafeStr_5486 == 0))) || (_local_2));
            updateCustomVarsWindow();
            updateWindow();
        }

        private function updateCustomVarsWindow():void
        {
            var _local_1:* = null;
            if (((_SafeStr_5483 == null) || (_SafeStr_4981.furniData == null)))
            {
                return;
            };
            var _local_6:IRoomObject = getRoomObject(_SafeStr_4981.furniData.id);
            if (_local_6 == null)
            {
                return;
            };
            var _local_3:Array = _local_6.getModel().getStringArray("furniture_custom_variables");
            _SafeStr_5483.visible = ((!(_local_3 == null)) && (_local_3.length > 0));
            if (!_SafeStr_5483.visible)
            {
                return;
            };
            var _local_5:IItemListWindow = (_SafeStr_5483.findChildByName("variable_list") as IItemListWindow);
            _local_5.destroyListItems();
            var _local_4:_SafeStr_24 = _local_6.getModel().getStringToStringMap("furniture_data");
            for each (var _local_2:String in _local_3)
            {
                _local_1 = (_SafeStr_5487.clone() as _SafeStr_3133);
                _local_1.name = _local_2;
                _local_1.findChildByName("name").caption = _local_2;
                _local_1.findChildByName("value").caption = _local_4[_local_2];
                _local_5.addListItem(_local_1);
            };
        }

        private function updatePickupMode(_arg_1:RoomWidgetFurniInfoUpdateEvent):void
        {
            _SafeStr_5486 = 0;
            if (((_arg_1.isOwner) || (_arg_1.isAnyRoomController)))
            {
                _SafeStr_5486 = 2;
            }
            else
            {
                if (((_arg_1.isRoomOwner) || (_arg_1.roomControllerLevel >= 3)))
                {
                    _SafeStr_5486 = 1;
                };
            };
            if (_arg_1.isStickie)
            {
                _SafeStr_5486 = 0;
            };
            showButton("pickup", (!(_SafeStr_5486 == 0)));
            localizePickupButton(_SafeStr_5486);
        }

        private function localizePickupButton(_arg_1:int):void
        {
            if (_buttons == null)
            {
                return;
            };
            var _local_2:_SafeStr_3109 = _buttons.getListItemByName("pickup");
            if (_local_2 != null)
            {
                if (_arg_1 == 1)
                {
                    _local_2.caption = "${infostand.button.eject}";
                }
                else
                {
                    _local_2.caption = "${infostand.button.pickup}";
                };
            };
        }

        private function createAdElement(_arg_1:String, _arg_2:String):void
        {
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_6:* = null;
            var _local_3:* = null;
            if (_SafeStr_5485 != null)
            {
                _local_4 = (_SafeStr_4981.assets.getAssetByName("furni_view_branding_element") as XmlAsset);
                if (_local_4 != null)
                {
                    _local_5 = (_SafeStr_4981.windowManager.buildFromXML((_local_4.content as XML)) as _SafeStr_3133);
                    if (_local_5 != null)
                    {
                        _local_6 = _local_5.findChildByName("element_name");
                        if (_local_6 != null)
                        {
                            _local_6.caption = _arg_1;
                        };
                        _local_3 = _local_5.findChildByName("element_value");
                        if (_local_3 != null)
                        {
                            _local_3.caption = _arg_2;
                            _local_3.addEventListener("WKE_KEY_DOWN", adElementKeyEventProc);
                        };
                        if (((!(_local_6 == null)) && (!(_local_3 == null))))
                        {
                            _SafeStr_5485.addListItem(_local_5);
                        };
                    };
                };
            };
        }

        private function getAdFurnitureExtraParams():_SafeStr_24
        {
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_7:* = null;
            var _local_6:* = null;
            var _local_1:_SafeStr_24 = new _SafeStr_24();
            if (_SafeStr_4981 != null)
            {
                _local_5 = _SafeStr_4981.furniData.extraParam.substr("RWEIEP_BRANDING_OPTIONS".length);
                _local_3 = _local_5.split("\t");
                if (_local_3 != null)
                {
                    for each (var _local_2:String in _local_3)
                    {
                        _local_4 = _local_2.split("=", 2);
                        if (((!(_local_4 == null)) && (_local_4.length == 2)))
                        {
                            _local_7 = _local_4[0];
                            _local_6 = _local_4[1];
                            _local_1.add(_local_7, _local_6);
                        };
                    };
                };
            };
            return (_local_1);
        }

        private function getVisibleAdFurnitureExtraParams():String
        {
            var _local_2:* = null;
            var _local_7:* = null;
            var _local_3:* = null;
            var _local_5:* = null;
            var _local_4:* = null;
            var _local_1:String = "";
            if (_SafeStr_5484 != null)
            {
                _local_2 = [];
                _SafeStr_5484.groupChildrenWithTag("branding_element", _local_2, -1);
                if (_local_2.length > 0)
                {
                    for each (var _local_6:_SafeStr_3133 in _local_2)
                    {
                        _local_7 = _local_6.findChildByName("element_name");
                        _local_3 = _local_6.findChildByName("element_value");
                        if (((!(_local_7 == null)) && (!(_local_3 == null))))
                        {
                            _local_5 = trimAdFurnitureExtramParam(_local_7.caption);
                            _local_4 = trimAdFurnitureExtramParam(_local_3.caption);
                            _local_1 = (_local_1 + (((_local_5 + "=") + _local_4) + "\t"));
                        };
                    };
                };
            };
            return (_local_1);
        }

        private function trimAdFurnitureExtramParam(_arg_1:String):String
        {
            if (_arg_1 != null)
            {
                if (_arg_1.indexOf("\t") != -1)
                {
                    return (_arg_1.replace("\t", ""));
                };
            };
            return (_arg_1);
        }

        private function showAdFurnitureDetails(_arg_1:Boolean):void
        {
            var _local_5:* = null;
            var _local_8:* = null;
            var _local_9:* = null;
            if (((_SafeStr_4981 == null) || (_SafeStr_5484 == null)))
            {
                return;
            };
            var _local_4:_SafeStr_3109 = _SafeStr_5484.findChildByName("furni_details_spacer");
            if (_local_4 != null)
            {
                _local_4.visible = _arg_1;
            };
            var _local_2:Array = [];
            _SafeStr_5484.groupChildrenWithTag("branding_element", _local_2, -1);
            if (_local_2.length > 0)
            {
                for each (var _local_6:_SafeStr_3109 in _local_2)
                {
                    _SafeStr_5484.removeChild(_local_6);
                    _local_6.dispose();
                };
            };
            var _local_3:Boolean;
            var _local_7:_SafeStr_3109 = (_SafeStr_5484.findChildByName("furni_details_text") as ITextWindow);
            if (_local_7 != null)
            {
                _local_7.visible = _arg_1;
                _local_5 = ("id: " + _SafeStr_4981.furniData.id);
                _local_8 = getAdFurnitureExtraParams();
                if (_local_8.length > 0)
                {
                    _local_3 = true;
                    for each (var _local_10:String in _local_8.getKeys())
                    {
                        _local_9 = _local_8.getValue(_local_10);
                        createAdElement(_local_10, _local_9);
                    };
                };
                _local_7.caption = _local_5;
            };
            showButton("save_branding_configuration", _local_3);
        }

        private function showGroupInfo(_arg_1:Boolean):void
        {
            showWindow("group_details_spacer", _arg_1);
            showWindow("group_details_container", _arg_1);
            showWindow("group_badge_image", false);
            showWindow("group_name", false);
        }

        private function showWindow(_arg_1:String, _arg_2:Boolean):void
        {
            var _local_3:_SafeStr_3109 = _SafeStr_5484.findChildByName(_arg_1);
            if (_local_3)
            {
                _local_3.visible = _arg_2;
            };
        }

        private function adElementKeyEventProc(_arg_1:_SafeStr_3116=null, _arg_2:_SafeStr_3109=null):void
        {
        }

        protected function showButton(_arg_1:String, _arg_2:Boolean):void
        {
            if (_buttons == null)
            {
                return;
            };
            var _local_3:_SafeStr_3109 = _buttons.getListItemByName(_arg_1);
            if (_local_3 != null)
            {
                _local_3.visible = _arg_2;
                _buttons.arrangeListItems();
            };
        }

        private function updatePurchaseButtonVisibility(_arg_1:Boolean, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean):void
        {
            var _local_11:Boolean;
            var _local_9:Boolean = ((_arg_1) && (_arg_2));
            var _local_8:Boolean = ((_local_9) && (_arg_6));
            var _local_10:Boolean = ((_local_9) && (_arg_5));
            var _local_12:Boolean = ((!(_local_9)) && (_arg_3));
            var _local_13:Boolean = ((!(_local_9)) && (_arg_4));
            if (_catalogButton != null)
            {
                _catalogButton.visible = _local_12;
                if (!_local_11)
                {
                    _local_11 = _local_12;
                };
            };
            if (_rentButton != null)
            {
                _rentButton.visible = _local_13;
                if (!_local_11)
                {
                    _local_11 = _local_13;
                };
            };
            if (_extendButton != null)
            {
                _extendButton.visible = _local_8;
                if (!_local_11)
                {
                    _local_11 = _local_8;
                };
            };
            if (_buyoutButton != null)
            {
                _buyoutButton.visible = _local_10;
                if (!_local_11)
                {
                    _local_11 = _local_10;
                };
            };
            var _local_7:IItemListWindow = (_SafeStr_5485.getListItemByName("purchase_buttons") as IItemListWindow);
            if (_local_7 != null)
            {
                _local_7.arrangeListItems();
                _local_7.visible = _local_11;
            };
            _SafeStr_5485.arrangeListItems();
        }

        public function set groupName(_arg_1:String):void
        {
            var _local_2:_SafeStr_3109 = _SafeStr_5484.findChildByName("group_name");
            if (_local_2)
            {
                _local_2.caption = _arg_1;
                _local_2.visible = true;
            };
        }

        private function showLimitedItem(_arg_1:Boolean, _arg_2:IStuffData):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_6:_SafeStr_3133 = (_SafeStr_5484.findChildByName("unique_item_background_container") as _SafeStr_3133);
            var _local_5:_SafeStr_3133 = (_SafeStr_5484.findChildByName("unique_item_overlay_container") as _SafeStr_3133);
            if (((!(_local_6)) || (!(_local_5))))
            {
                return;
            };
            if (!_arg_1)
            {
                _local_6.visible = false;
                _local_5.visible = false;
            }
            else
            {
                _local_6.visible = true;
                _local_5.visible = true;
                _local_3 = _SafeStr_3199(_local_5.findChildByName("unique_item_plaque_widget"));
                _local_4 = ILimitedItemPreviewOverlayWidget(_local_3.widget);
                _local_4.serialNumber = _arg_2.uniqueSerialNumber;
                _local_4.seriesSize = _arg_2.uniqueSeriesSize;
            };
        }

        private function showRarityItem(_arg_1:Boolean, _arg_2:IStuffData):void
        {
            var _local_3:* = null;
            var _local_4:* = null;
            var _local_5:_SafeStr_3133 = (_SafeStr_5484.findChildByName("rarity_item_overlay_container") as _SafeStr_3133);
            if (!_local_5)
            {
                return;
            };
            if (!_arg_1)
            {
                _local_5.visible = false;
            }
            else
            {
                _local_5.visible = true;
                _local_3 = _SafeStr_3199(_local_5.findChildByName("rarity_item_overlay_widget"));
                _local_4 = IRarityItemPreviewOverlayWidget(_local_3.widget);
                _local_4.rarityLevel = _arg_2.rarityLevel;
            };
        }

        public function set groupBadgeId(_arg_1:String):void
        {
            var _local_3:_SafeStr_3199 = (_SafeStr_5484.findChildByName("group_badge_image") as _SafeStr_3199);
            var _local_2:_SafeStr_3349 = (_local_3.widget as _SafeStr_3349);
            _local_2.badgeId = _arg_1;
            _local_2.groupId = _SafeStr_4981.furniData.groupId;
            _local_3.visible = true;
        }


    }
}//package com.sulake.habbo.ui.widget.infostand

// _SafeStr_1704 = "_-dL" (String#1691, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3270 = "_-j1T" (String#7568, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5226 = "_-Ld" (String#2223, DoABC#4)
// _SafeStr_5482 = "_-gL" (String#29908, DoABC#4)
// _SafeStr_5483 = "_-Jx" (String#4574, DoABC#4)
// _SafeStr_5484 = "_-d1w" (String#599, DoABC#4)
// _SafeStr_5485 = "_-FZ" (String#843, DoABC#4)
// _SafeStr_5486 = "_-le" (String#5109, DoABC#4)
// _SafeStr_5487 = "_-Ts" (String#19231, DoABC#4)
// _SafeStr_9033 = "_-MJ" (String#39301, DoABC#4)
// _SafeStr_9034 = "_-G15" (String#39476, DoABC#4)
// _SafeStr_9035 = "_-dm" (String#31838, DoABC#4)


