// by nota

//com.sulake.habbo.inventory.furni.FurniView

package com.sulake.habbo.inventory.furni
{
    import com.sulake.habbo.inventory.IInventoryView;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.window.widgets.ILimitedItemPreviewOverlayWidget;
    import com.sulake.habbo.window.widgets.IRarityItemPreviewOverlayWidget;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.room.preview.RoomPreviewer;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.inventory.items.GroupItem;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import flash.filters.GlowFilter;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.room.object.data.MapStuffData;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import com.sulake.core.window.components._SafeStr_3269;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.window.widgets.IRoomPreviewerWidget;
    import com.sulake.habbo.session.furniture._SafeStr_3130;
    import com.sulake.core.window.components.IInteractiveWindow;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.utils.FriendlyTime;

    public class FurniView implements IInventoryView, _SafeStr_41 
    {

        private static const STATE_NULL:int = 0;
        private static const STATE_INITIALIZING:int = 1;
        private static const STATE_EMPTY:int = 2;
        private static const STATE_CONTENT:int = 3;
        private static const UNSEEN_SYMBOL_MARGIN:int = 4;

        private var _SafeStr_5526:String = "";
        private var _windowManager:_SafeStr_1695;
        private var _SafeStr_3745:IAssetLibrary;
        private var _SafeStr_3882:_SafeStr_3133;
        private var _SafeStr_5384:FurniGridView;
        private var _SafeStr_4619:FurniModel;
        private var _marketplace:MarketplaceModel;
        private var _roomEngine:IRoomEngine;
        private var _disposed:Boolean = false;
        private var _SafeStr_4468:int = 0;
        private var _SafeStr_5524:ILimitedItemPreviewOverlayWidget;
        private var _SafeStr_5525:IRarityItemPreviewOverlayWidget;
        private var _SafeStr_5527:IItemListWindow;
        private var _placeInRoomButton:_SafeStr_3122;
        private var _gotoRoomButton:_SafeStr_3122;
        private var _sellInMarketplaceButton:_SafeStr_3122;
        private var _offerInTradingButton:_SafeStr_3122;
        private var _offerInTradingCountButton:ITextFieldWindow;
        private var _useFurnitureButton:_SafeStr_3122;
        private var _extendRentPeriodButton:_SafeStr_3122;
        private var _buyRentedItemButton:_SafeStr_3122;
        private var _SafeStr_3883:Boolean = false;
        private var _SafeStr_3840:RoomPreviewer;
        private var _rentablesPlacementSelection:int = 0;

        public function FurniView(_arg_1:FurniModel, _arg_2:MarketplaceModel, _arg_3:_SafeStr_1695, _arg_4:IAssetLibrary, _arg_5:IRoomEngine)
        {
            _SafeStr_4619 = _arg_1;
            _marketplace = _arg_2;
            _SafeStr_3745 = _arg_4;
            _windowManager = _arg_3;
            _roomEngine = _arg_5;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get isVisible():Boolean
        {
            return (((_SafeStr_3882) && (!(_SafeStr_3882.parent == null))) && (_SafeStr_3882.visible));
        }

        public function get isInitialized():Boolean
        {
            return (_SafeStr_3883);
        }

        public function get currentPageItems():Vector.<GroupItem>
        {
            return ((_SafeStr_5384) ? _SafeStr_5384.currentPageItems : null);
        }

        public function get grid():FurniGridView
        {
            return (_SafeStr_5384);
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (((_SafeStr_4619) && (_SafeStr_4619.controller)))
                {
                    _SafeStr_4619.controller.removeUpdateReceiver(this);
                };
                _SafeStr_4619 = null;
                _marketplace = null;
                _SafeStr_3745 = null;
                _windowManager = null;
                _roomEngine = null;
                if (_SafeStr_5524)
                {
                    _SafeStr_5524.dispose();
                    _SafeStr_5524 = null;
                };
                if (_SafeStr_5525)
                {
                    _SafeStr_5525.dispose();
                    _SafeStr_5525 = null;
                };
                if (_SafeStr_3882)
                {
                    _SafeStr_3882.dispose();
                    _SafeStr_3882 = null;
                };
                _disposed = true;
            };
        }

        public function getWindowContainer():_SafeStr_3133
        {
            if (!_SafeStr_3883)
            {
                init();
            };
            if (_SafeStr_3882 == null)
            {
                return (null);
            };
            if (_SafeStr_3882.disposed)
            {
                return (null);
            };
            updateActionButtons(false);
            return (_SafeStr_3882);
        }

        public function setViewToState():void
        {
            var _local_1:int;
            if (!_SafeStr_4619.isListInited())
            {
                _local_1 = 1;
            }
            else
            {
                if (((!(_SafeStr_4619.furniData)) || (_SafeStr_4619.furniData.length == 0)))
                {
                    _local_1 = 2;
                }
                else
                {
                    _local_1 = 3;
                };
            };
            if (_SafeStr_4468 == _local_1)
            {
                return;
            };
            _SafeStr_4468 = _local_1;
            updateContainerVisibility();
        }

        public function clearViews():void
        {
            updateActionView();
        }

        public function getFirstThumb():_SafeStr_3133
        {
            return ((_SafeStr_5384 != null) ? _SafeStr_5384.getFirstThumb() : null);
        }

        public function updateActionView():void
        {
            var _local_4:* = null;
            var _local_14:* = null;
            var _local_18:* = null;
            var _local_16:* = null;
            var _local_5:* = null;
            var _local_10:* = null;
            var _local_19:* = null;
            var _local_8:* = null;
            var _local_17:* = null;
            var _local_3:* = null;
            var _local_20:* = null;
            var _local_12:* = null;
            var _local_9:int;
            var _local_1:* = null;
            var _local_11:* = null;
            var _local_13:* = null;
            if (_SafeStr_3882 == null)
            {
                return;
            };
            if (_SafeStr_3882.disposed)
            {
                return;
            };
            updateContainerVisibility();
            var _local_6:Boolean;
            var _local_7:GroupItem = _SafeStr_4619.getSelectedItem();
            if (((!(_local_7 == null)) && (!(_local_7.peek() == null))))
            {
                if (_local_7.selectedItemIndex >= 0)
                {
                    _local_4 = _local_7.getAt(_local_7.selectedItemIndex);
                    if (!_local_4)
                    {
                        _local_4 = _local_7.peek();
                    };
                }
                else
                {
                    _local_4 = _local_7.peek();
                };
                _local_6 = true;
                _local_5 = _roomEngine.getWallItemType(_local_4.type);
                var _local_21:* = ((_local_5) && (!(_local_5.indexOf("external_image_wallitem") == -1)));
                _SafeStr_3882.findChildByName("viewItemButton").visible = _local_21;
                _SafeStr_3882.findChildByName("nextItemButton").visible = _local_21;
                _SafeStr_3882.findChildByName("furni_preview_widget").visible = true;
                _local_10 = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId, "room_wall_type");
                _local_19 = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId, "room_floor_type");
                _local_8 = _roomEngine.getRoomStringValue(_roomEngine.activeRoomId, "room_landscape_type");
                _local_10 = (((_local_10) && (_local_10.length > 0)) ? _local_10 : "101");
                _local_19 = (((_local_19) && (_local_19.length > 0)) ? _local_19 : "101");
                _local_8 = (((_local_8) && (_local_8.length > 0)) ? _local_8 : "1.1");
                _SafeStr_3840.reset(false);
                _SafeStr_3840.updateObjectRoom(_local_19, _local_10, _local_8);
                if ((((_local_4.category == 2) || (_local_4.category == 3)) || (_local_4.category == 4)))
                {
                    _SafeStr_3840.updateRoomWallsAndFloorVisibility(true, true);
                    _local_17 = ((_local_4.category == 3) ? _local_7.stuffData.getLegacyString() : _local_19);
                    _local_3 = ((_local_4.category == 2) ? _local_7.stuffData.getLegacyString() : _local_10);
                    _local_20 = ((_local_4.category == 4) ? _local_7.stuffData.getLegacyString() : _local_8);
                    _SafeStr_3840.updateObjectRoom(_local_17, _local_3, _local_20);
                    if (_local_4.category == 4)
                    {
                        _local_12 = _SafeStr_4619.controller.getFurnitureDataByName("ads_twi_windw", "i");
                        _SafeStr_3840.addWallItemIntoRoom(_local_12.id, new Vector3d(90, 0, 0), _local_12.customParams);
                    };
                }
                else
                {
                    if (_local_7.isWallItem)
                    {
                        _SafeStr_3840.updateRoomWallsAndFloorVisibility(true, true);
                        _SafeStr_3840.addWallItemIntoRoom(_local_7.type, new Vector3d(90, 0, 0), _local_4.stuffData.getLegacyString());
                    }
                    else
                    {
                        _SafeStr_3840.updateRoomWallsAndFloorVisibility(false, true);
                        _SafeStr_3840.addFurnitureIntoRoom(_local_7.type, new Vector3d(90, 0, 0), _local_7.stuffData, _local_7.extra.toString());
                    };
                };
                _local_14 = (_SafeStr_3882.findChildByName("tradeable_icon") as IStaticBitmapWrapperWindow);
                _local_18 = (_SafeStr_3882.findChildByName("tradeable_number") as ITextWindow);
                _local_16 = (_SafeStr_3882.findChildByName("tradeable_info_region") as IRegionWindow);
                if ((((!(_local_14 == null)) && (!(_local_18 == null))) && (!(_local_16 == null))))
                {
                    _local_9 = _local_7.getTradeableCount();
                    if (_local_9 == 0)
                    {
                        _local_14.assetUri = "inventory_furni_no_trade_icon";
                        _local_18.visible = false;
                        _local_16.toolTipCaption = "${inventory.furni.preview.not_tradeable}";
                        _local_18.filters = [];
                    }
                    else
                    {
                        _local_14.assetUri = "inventory_furni_trade_icon";
                        _local_18.visible = true;
                        _local_18.text = _local_9;
                        _local_16.toolTipCaption = "${inventory.furni.preview.tradeable_amount}";
                        _local_18.filters = [new GlowFilter(0xFFFFFF, 1, 3, 3, 300)];
                    };
                };
                _local_1 = _SafeStr_3199(_SafeStr_3882.findChildByName("unique_limited_item_overlay_widget"));
                if (((_local_4.stuffData) && (_local_4.stuffData.uniqueSerialNumber > 0)))
                {
                    if (_SafeStr_5524 == null)
                    {
                        _SafeStr_5524 = ILimitedItemPreviewOverlayWidget(_local_1.widget);
                    };
                    _SafeStr_5524.serialNumber = _local_4.stuffData.uniqueSerialNumber;
                    _SafeStr_5524.seriesSize = _local_4.stuffData.uniqueSeriesSize;
                    _local_1.visible = true;
                }
                else
                {
                    _local_1.visible = false;
                };
                _local_11 = _SafeStr_3199(_SafeStr_3882.findChildByName("rarity_item_overlay_widget"));
                if (((_local_4.stuffData) && (_local_4.stuffData.rarityLevel >= 0)))
                {
                    if (_SafeStr_5525 == null)
                    {
                        _SafeStr_5525 = IRarityItemPreviewOverlayWidget(_local_11.widget);
                    };
                    _SafeStr_5525.rarityLevel = _local_4.stuffData.rarityLevel;
                    _local_11.visible = true;
                }
                else
                {
                    _local_11.visible = false;
                };
            }
            else
            {
                _local_21 = false;
                _SafeStr_3882.findChildByName("viewItemButton").visible = _local_21;
                _SafeStr_3882.findChildByName("nextItemButton").visible = _local_21;
                _SafeStr_3882.findChildByName("furni_preview_widget").visible = _local_21;
                _local_14 = (_SafeStr_3882.findChildByName("tradeable_icon") as IStaticBitmapWrapperWindow);
                _local_18 = (_SafeStr_3882.findChildByName("tradeable_number") as ITextWindow);
                _local_16 = (_SafeStr_3882.findChildByName("tradeable_info_region") as IRegionWindow);
                if ((((_local_14) && (_local_18)) && (_local_16)))
                {
                    _local_14.assetUri = "";
                    _local_18.visible = false;
                };
            };
            var _local_2:Boolean = _SafeStr_4619.isTradingOpen;
            updateActionButtons(_local_6);
            if (((_local_7) && (_local_4)))
            {
                _SafeStr_3882.findChildByName("furni_name").caption = _local_7.name;
                if (((_local_4) && (_roomEngine.getWallItemType(_local_4.type) == "external_image_wallitem")))
                {
                    _SafeStr_3882.findChildByName("furni_description").caption = _local_4.stuffData.getJSONValue("m");
                }
                else
                {
                    _SafeStr_3882.findChildByName("furni_description").caption = _local_7.description;
                };
            }
            else
            {
                _SafeStr_3882.findChildByName("furni_name").caption = "";
                _SafeStr_3882.findChildByName("furni_description").caption = "";
            };
            var _local_15:ITextWindow = (_SafeStr_3882.findChildByName("furni_extra") as ITextWindow);
            if (_local_15 != null)
            {
                if ((((!(_local_4 == null)) && (!(_local_4.stuffData == null))) && (_local_4.stuffData.rarityLevel >= 0)))
                {
                    _local_13 = (_local_4.stuffData as MapStuffData).getValue("rarity");
                    if (_local_13 != null)
                    {
                        _windowManager.registerLocalizationParameter("inventory.rarity", "rarity", _local_4.stuffData.rarityLevel);
                        _local_15.text = _SafeStr_4619.localization.getLocalization("inventory.rarity");
                        _local_15.visible = true;
                    };
                }
                else
                {
                    _local_15.text = "";
                };
            };
            updateRentedItem();
        }

        public function displayItemInfo(_arg_1:GroupItem):void
        {
            if (_SafeStr_3882 == null)
            {
                return;
            };
            if (_SafeStr_3882.disposed)
            {
                return;
            };
            var _local_2:FurnitureItem = _arg_1.peek();
            if (_local_2.isWallItem)
            {
                _SafeStr_3840.addWallItemIntoRoom(_local_2.type, new Vector3d(90, 0, 0), _local_2.stuffData.getLegacyString());
            }
            else
            {
                _SafeStr_3840.addFurnitureIntoRoom(_local_2.type, new Vector3d(90, 0, 0), _local_2.stuffData);
            };
            _placeInRoomButton.disable();
            _offerInTradingButton.disable();
            _offerInTradingCountButton.disable();
        }

        public function addItems(_arg_1:Vector.<GroupItem>):void
        {
            if (_SafeStr_5384)
            {
                _SafeStr_5384.setItems(_arg_1);
            };
        }

        public function updateGridFilters():void
        {
            if (((_SafeStr_3882 == null) || (_SafeStr_3882.disposed)))
            {
                return;
            };
            var _local_4:_SafeStr_3269 = (_SafeStr_3882.findChildByName("filter.options") as _SafeStr_3269);
            var _local_2:_SafeStr_3269 = (_SafeStr_3882.findChildByName("placement.options") as _SafeStr_3269);
            var _local_3:String = _SafeStr_3882.findChildByName("filter").caption;
            var _local_1:String = _local_4.enumerateSelection()[_local_4.selection];
            _SafeStr_5384.setFilter(_local_4.selection, _local_1, _SafeStr_4619.showingRentedFurni, _local_3, _local_2.selection);
        }

        public function resetFilters(_arg_1:String):void
        {
            var _local_3:_SafeStr_3269 = (_SafeStr_3882.findChildByName("filter.options") as _SafeStr_3269);
            var _local_2:_SafeStr_3269 = (_SafeStr_3882.findChildByName("placement.options") as _SafeStr_3269);
            _local_3.selection = 0;
            switch (_arg_1)
            {
                case "furni":
                    _local_2.selection = ((_local_2.numMenuItems > 2) ? 2 : 0);
                    _local_2.disable();
                    break;
                case "rentables":
                    _local_2.selection = _rentablesPlacementSelection;
                    _local_2.enable();
            };
            if (_SafeStr_5526 != _arg_1)
            {
                _SafeStr_3882.findChildByName("filter").caption = "";
                _SafeStr_3882.findChildByName("clear_filter_button").visible = false;
            };
            _SafeStr_5526 = _arg_1;
            updateGridFilters();
        }

        private function init():void
        {
            _SafeStr_3882 = _SafeStr_4619.controller.view.getView("furni");
            _SafeStr_3882.visible = false;
            _SafeStr_3882.procedure = windowEventProc;
            var _local_1:IItemGridWindow = (_SafeStr_3882.findChildByName("item_grid") as IItemGridWindow);
            var _local_3:IItemListWindow = (_SafeStr_3882.findChildByName("item_grid_pages") as IItemListWindow);
            _SafeStr_5384 = new FurniGridView(_local_1, _local_3);
            populateFilterOptions();
            _SafeStr_5527 = (_SafeStr_3882.findChildByName("preview_element_list") as IItemListWindow);
            _placeInRoomButton = (_SafeStr_5527.removeListItem(_SafeStr_5527.getListItemByName("placeinroom_btn")) as _SafeStr_3122);
            _extendRentPeriodButton = (_SafeStr_5527.removeListItem(_SafeStr_5527.getListItemByName("extendrent_btn")) as _SafeStr_3122);
            _buyRentedItemButton = (_SafeStr_5527.removeListItem(_SafeStr_5527.getListItemByName("buyrenteditem_btn")) as _SafeStr_3122);
            _gotoRoomButton = (_SafeStr_5527.removeListItem(_SafeStr_5527.getListItemByName("goto_room_btn")) as _SafeStr_3122);
            _useFurnitureButton = (_SafeStr_5527.removeListItem(_SafeStr_5527.getListItemByName("use_btn")) as _SafeStr_3122);
            _offerInTradingCountButton = (_SafeStr_5527.removeListItem(_SafeStr_5527.getListItemByName("offertotrade_cnt")) as ITextFieldWindow);
            _offerInTradingButton = (_SafeStr_5527.removeListItem(_SafeStr_5527.getListItemByName("offertotrade_btn")) as _SafeStr_3122);
            _sellInMarketplaceButton = (_SafeStr_5527.removeListItem(_SafeStr_5527.getListItemByName("sell_btn")) as _SafeStr_3122);
            var _local_2:IRoomPreviewerWidget = ((_SafeStr_3882.findChildByName("furni_preview_widget") as _SafeStr_3199).widget as IRoomPreviewerWidget);
            _SafeStr_3840 = _local_2.roomPreviewer;
            _SafeStr_4619.controller.registerUpdateReceiver(this, 1);
            setViewToState();
            _SafeStr_3883 = true;
        }

        private function fixPreviewHeightInTrading():void
        {
            var _local_1:_SafeStr_3199 = (_SafeStr_3882.findChildByName("furni_preview_widget") as _SafeStr_3199);
            var _local_2:IRoomPreviewerWidget = ((_SafeStr_3882.findChildByName("furni_preview_widget") as _SafeStr_3199).widget as IRoomPreviewerWidget);
            _local_2.roomPreviewer.modifyRoomCanvas(_local_1.width, _local_1.height);
        }

        private function updateActionButtons(_arg_1:Boolean):void
        {
            if (_SafeStr_4619.isTradingOpen)
            {
                fixPreviewHeightInTrading();
            };
            removeButtons();
            var _local_2:Boolean = _SafeStr_4619.isTradingOpen;
            var _local_6:GroupItem = _SafeStr_4619.getSelectedItem();
            var _local_3:FurnitureItem;
            if (_local_6)
            {
                _local_3 = _local_6.peek();
            };
            if (_local_3 == null)
            {
                return;
            };
            var _local_10:_SafeStr_3130 = _SafeStr_4619.controller.getFurnitureData(_local_3.type, ((_local_3.isWallItem) ? "i" : "s"));
            var _local_9:Boolean = ((((((_arg_1) && (_marketplace)) && (_marketplace.isEnabled)) && (_local_3.sellable)) && (!(_SafeStr_4619.controller.sessionData.isAccountSafetyLocked()))) && (!(_local_2)));
            var _local_5:Boolean = (((_SafeStr_4619.isPrivateRoom) && (_arg_1)) && (((((_local_3.category == 16) || (_local_3.category == 14)) || (_local_3.category == 15)) || (_local_3.category == 13)) || (_local_3.category == 20)));
            var _local_4:Boolean = true;
            if (_local_3.isRented)
            {
                if (_local_3.flatId > -1)
                {
                    _local_4 = false;
                };
            };
            var _local_11:* = (_local_3.flatId > -1);
            var _local_7:Boolean = ((((_local_3.isRented) && (_local_4)) && (_local_10)) && (_local_10.rentCouldBeUsedForBuyout));
            var _local_8:Boolean = ((((_local_3.isRented) && (_local_4)) && (_local_10)) && (_local_10.purchaseCouldBeUsedForBuyout));
            if (((_local_10) && (_local_10.isExternalImageType)))
            {
                _local_9 = false;
            };
            updateButtonAvailability(_placeInRoomButton, ((!(_local_2)) && (_local_4)));
            updateButtonAvailability(_extendRentPeriodButton, ((!(_local_2)) && (_local_7)));
            updateButtonAvailability(_buyRentedItemButton, ((!(_local_2)) && (_local_8)));
            updateButtonAvailability(_gotoRoomButton, ((!(_local_2)) && (_local_11)));
            updateButtonAvailability(_offerInTradingCountButton, ((_local_2) && (_SafeStr_4619.controller.getBoolean("multi.item.trading.enabled"))));
            updateButtonAvailability(_offerInTradingButton, _local_2);
            updateButtonAvailability(_sellInMarketplaceButton, _local_9);
            updateButtonAvailability(_useFurnitureButton, _local_5);
            if (((_arg_1) && (_SafeStr_4619.isPrivateRoom)))
            {
                _placeInRoomButton.enable();
            }
            else
            {
                _placeInRoomButton.disable();
            };
            if (((((_arg_1) && (!(_local_6 == null))) && (!(_local_3 == null))) && (_SafeStr_4619.canUserOfferToTrade())))
            {
                if (((_local_6.getUnlockedCount()) && (_local_3.tradeable)))
                {
                    _offerInTradingButton.enable();
                    _offerInTradingCountButton.enable();
                }
                else
                {
                    _offerInTradingButton.disable();
                    _offerInTradingCountButton.disable();
                };
            }
            else
            {
                _offerInTradingButton.disable();
                _offerInTradingCountButton.disable();
            };
        }

        private function updateButtonAvailability(_arg_1:IInteractiveWindow, _arg_2:Boolean):void
        {
            if (_SafeStr_5527.getListItemByName(_arg_1.name) == null)
            {
                if (_arg_2)
                {
                    _SafeStr_5527.addListItem(_arg_1);
                };
            }
            else
            {
                if (!_arg_2)
                {
                    _SafeStr_5527.removeListItem(_arg_1);
                };
            };
        }

        private function removeButtons():void
        {
            _SafeStr_5527.removeListItem(_placeInRoomButton);
            _SafeStr_5527.removeListItem(_extendRentPeriodButton);
            _SafeStr_5527.removeListItem(_buyRentedItemButton);
            _SafeStr_5527.removeListItem(_gotoRoomButton);
            _SafeStr_5527.removeListItem(_useFurnitureButton);
            _SafeStr_5527.removeListItem(_offerInTradingCountButton);
            _SafeStr_5527.removeListItem(_offerInTradingButton);
            _SafeStr_5527.removeListItem(_sellInMarketplaceButton);
        }

        private function updateContainerVisibility():void
        {
            if (!_SafeStr_3883)
            {
                return;
            };
            if (((!(_SafeStr_4619.controller.currentCategoryId == "furni")) && (!(_SafeStr_4619.controller.currentCategoryId == "rentables"))))
            {
                return;
            };
            var _local_1:_SafeStr_3133 = _SafeStr_4619.controller.view.loadingContainer;
            var _local_4:_SafeStr_3133 = _SafeStr_4619.controller.view.emptyContainer;
            var _local_5:_SafeStr_3133 = (_SafeStr_3882.findChildByName("grid_container") as _SafeStr_3133);
            var _local_2:_SafeStr_3133 = (_SafeStr_3882.findChildByName("preview_container") as _SafeStr_3133);
            var _local_3:_SafeStr_3133 = (_SafeStr_3882.findChildByName("options_container") as _SafeStr_3133);
            switch (_SafeStr_4468)
            {
                case 1:
                    if (_local_1)
                    {
                        _local_1.visible = true;
                    };
                    if (_local_4)
                    {
                        _local_4.visible = false;
                    };
                    _local_5.visible = false;
                    _local_2.visible = false;
                    _local_3.visible = false;
                    return;
                case 2:
                    if (_local_1)
                    {
                        _local_1.visible = false;
                    };
                    if (_local_4)
                    {
                        _local_4.visible = true;
                    };
                    _local_5.visible = false;
                    _local_2.visible = false;
                    _local_3.visible = false;
                    return;
                case 3:
                    if (_local_1)
                    {
                        _local_1.visible = false;
                    };
                    if (_local_4)
                    {
                        _local_4.visible = false;
                    };
                    _local_5.visible = true;
                    _local_2.visible = true;
                    _local_3.visible = true;
                default:
            };
        }

        private function showNextPreviewItem():void
        {
            _SafeStr_4619.getSelectedItem().selectedItemIndex++;
            updateActionView();
        }

        private function windowEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_8:int;
            var _local_9:* = null;
            var _local_3:* = null;
            var _local_6:* = null;
            var _local_7:* = null;
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "placeinroom_btn":
                    case "furni_preview_region":
                        if (!_SafeStr_4619.isTradingOpen)
                        {
                            _SafeStr_4619.requestSelectedFurniPlacement(false);
                        };
                        break;
                    case "nextItemButton":
                        showNextPreviewItem();
                        break;
                    case "viewItemButton":
                        _local_4 = _SafeStr_4619.getSelectedItem();
                        _local_5 = _local_4.getAt(_local_4.selectedItemIndex);
                        if (!_local_5)
                        {
                            _local_5 = _local_4.peek();
                        };
                        _roomEngine.showUseProductSelection(_local_5.ref, _local_5.type, _local_5.id);
                        break;
                    case "goto_room_btn":
                        _SafeStr_4619.gotoRoom();
                        break;
                    case "offertotrade_btn":
                        _local_8 = Math.max(1, _offerInTradingCountButton.caption);
                        if (_local_8 != _offerInTradingCountButton.caption)
                        {
                            _offerInTradingCountButton.caption = _local_8;
                        };
                        _SafeStr_4619.requestSelectedFurniToTrading(_local_8, _offerInTradingCountButton);
                        break;
                    case "sell_btn":
                        _SafeStr_4619.requestSelectedFurniSelling();
                        break;
                    case "use_btn":
                        _SafeStr_4619.showUseProductSelection();
                        break;
                    case "extendrent_btn":
                        _SafeStr_4619.extendRentPeriod();
                        break;
                    case "buyrenteditem_btn":
                        _SafeStr_4619.buyRentedItem();
                        break;
                    case "clear_filter_button":
                        _SafeStr_3882.findChildByName("filter").caption = "";
                        _arg_2.visible = false;
                        updateGridFilters();
                        break;
                    default:
                        _SafeStr_4619.cancelFurniInMover();
                };
            }
            else
            {
                if (_arg_1.type == "WME_DOWN")
                {
                    switch (_arg_2.name)
                    {
                        case "furni_preview_region":
                            _local_9 = _SafeStr_4619.getSelectedItem();
                            if (_local_9 == null)
                            {
                                return;
                            };
                            _local_3 = _local_9.peek();
                            if ((((_local_3.category == 2) || (_local_3.category == 3)) || (_local_3.category == 4)))
                            {
                                return;
                            };
                            if (!_SafeStr_4619.isTradingOpen)
                            {
                                _SafeStr_4619.requestSelectedFurniPlacement(false);
                            };
                    };
                }
                else
                {
                    if (_arg_1.type == "WKE_KEY_UP")
                    {
                        _local_6 = (_arg_1 as WindowKeyboardEvent);
                        switch (_arg_2.name)
                        {
                            case "filter":
                                _SafeStr_3882.findChildByName("clear_filter_button").visible = (_arg_2.caption.length > 0);
                                if (_local_6.keyCode == 13)
                                {
                                    updateGridFilters();
                                };
                        };
                    };
                };
            };
            if (_arg_1.type == "WE_SELECTED")
            {
                switch (_arg_2.name)
                {
                    case "filter.options":
                        updateGridFilters();
                        return;
                    case "placement.options":
                        _local_7 = (_SafeStr_3882.findChildByName("placement.options") as _SafeStr_3269);
                        if (_SafeStr_4619.controller.currentCategoryId == "rentables")
                        {
                            _rentablesPlacementSelection = _local_7.selection;
                        };
                        updateGridFilters();
                        return;
                };
            };
        }

        private function populateFilterOptions():void
        {
            var _local_3:_SafeStr_3269 = (_SafeStr_3882.findChildByName("filter.options") as _SafeStr_3269);
            var _local_1:Array = [];
            _local_1.push(_SafeStr_4619.controller.localization.getLocalization("inventory.filter.option.everything", "Everything"));
            _local_1.push(_SafeStr_4619.controller.localization.getLocalization("inventory.furni.tab.floor", "Floor"));
            _local_1.push(_SafeStr_4619.controller.localization.getLocalization("inventory.furni.tab.wall", "Wall"));
            _local_3.populate(_local_1);
            _local_3.selection = 0;
            var _local_2:_SafeStr_3269 = (_SafeStr_3882.findChildByName("placement.options") as _SafeStr_3269);
            _local_1 = [];
            _local_1.push(_SafeStr_4619.controller.localization.getLocalization("inventory.placement.option.anywhere", "Anywhere"));
            _local_1.push(_SafeStr_4619.controller.localization.getLocalization("inventory.placement.option.inroom", "In room"));
            _local_1.push(_SafeStr_4619.controller.localization.getLocalization("inventory.placement.option.notinroom", "Not in room"));
            _local_2.populate(_local_1);
            _local_2.selection = 2;
            _rentablesPlacementSelection = 2;
            _SafeStr_3882.findChildByName("filter").caption = "";
            _SafeStr_3882.findChildByName("items.shown").visible = false;
            _SafeStr_3882.invalidate();
        }

        public function updateRentedItem():void
        {
            var _local_2:GroupItem = _SafeStr_4619.getSelectedItem();
            var _local_1:FurnitureItem;
            if (_local_2)
            {
                _local_1 = _local_2.peek();
            };
            if (_local_1 == null)
            {
                return;
            };
            if (!_local_1.isRented)
            {
                return;
            };
            var _local_3:_SafeStr_3109 = (_SafeStr_3882.findChildByName("furni_extra") as ITextWindow);
            _local_3.visible = true;
            if (_local_1.hasRentPeriodStarted)
            {
                _SafeStr_4619.controller.localization.registerParameter("inventory.rent.expiration", "time", FriendlyTime.getFriendlyTime(_SafeStr_4619.controller.localization, _local_1.secondsToExpiration));
                _local_3.caption = _SafeStr_4619.controller.localization.getLocalization("inventory.rent.expiration");
            }
            else
            {
                _SafeStr_4619.controller.localization.registerParameter("inventory.rent.inactive", "time", FriendlyTime.getFriendlyTime(_SafeStr_4619.controller.localization, _local_1.secondsToExpiration));
                _local_3.caption = _SafeStr_4619.controller.localization.getLocalization("inventory.rent.inactive");
            };
        }

        public function update(_arg_1:uint):void
        {
            if (_SafeStr_3840 != null)
            {
                _SafeStr_3840.updatePreviewRoomView();
            };
        }


    }
}//package com.sulake.habbo.inventory.furni

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3154 = "_-kO" (String#2057, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_3745 = "_-4b" (String#920, DoABC#4)
// _SafeStr_3840 = "_-t6" (String#1593, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4468 = "_-X12" (String#2196, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_5384 = "_-Ng" (String#1406, DoABC#4)
// _SafeStr_5524 = "_-P1A" (String#7397, DoABC#4)
// _SafeStr_5525 = "_-U1Z" (String#8202, DoABC#4)
// _SafeStr_5526 = "_-o1E" (String#21971, DoABC#4)
// _SafeStr_5527 = "_-92" (String#2752, DoABC#4)


