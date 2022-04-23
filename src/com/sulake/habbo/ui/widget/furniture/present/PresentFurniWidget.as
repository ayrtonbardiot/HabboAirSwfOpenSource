// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.furniture.present.PresentFurniWidget

package com.sulake.habbo.ui.widget.furniture.present
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.inventory._SafeStr_1708;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.localization._SafeStr_18;
    import flash.events.IEventDispatcher;
    import com.sulake.habbo.ui.widget.events.RoomWidgetPresentDataUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
    import com.sulake.habbo.ui.widget.events.RoomWidgetEcotronBoxDataUpdateEvent;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Point;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.ui.handler.FurniturePresentWidgetHandler;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.inventory.items._SafeStr_3154;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.communication.messages.IMessageComposer;
    import _-XO._SafeStr_982;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.habbo.avatar._SafeStr_3138;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetPresentOpenMessage;

    public class PresentFurniWidget extends RoomWidgetBase implements _SafeStr_1875 
    {

        private static const _SafeStr_8317:String = "floor";
        private static const TYPE_WALLPAPER:String = "wallpaper";
        private static const TYPE_LANDSCAPE:String = "landscape";

        private var _habboConfiguration:_SafeStr_19;
        private var _catalog:IHabboCatalog;
        private var _inventory:_SafeStr_1708;
        private var _roomEngine:IRoomEngine;
        private var _window:_SafeStr_3263;
        private var _SafeStr_4157:int = -1;
        private var _SafeStr_4862:int = 0;
        private var _SafeStr_4110:String;
        private var _text:String;
        private var _SafeStr_4360:Boolean;
        private var _SafeStr_4950:Boolean = false;
        private var _SafeStr_4952:String;
        private var _senderName:String;
        private var _SafeStr_4951:int = -1;
        private var _SafeStr_4953:String = "";
        private var _placedInRoom:Boolean = false;

        public function PresentFurniWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_18, _arg_5:_SafeStr_19, _arg_6:IHabboCatalog, _arg_7:_SafeStr_1708, _arg_8:IRoomEngine)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            _habboConfiguration = _arg_5;
            _catalog = _arg_6;
            _inventory = _arg_7;
            _roomEngine = _arg_8;
        }

        override public function dispose():void
        {
            hideInterface();
            _habboConfiguration = null;
            _catalog = null;
            _inventory = null;
            _roomEngine = null;
            super.dispose();
        }

        override public function registerUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.addEventListener("RWPDUE_PACKAGEINFO", onObjectUpdate);
            _arg_1.addEventListener("RWPDUE_CONTENTS", onObjectUpdate);
            _arg_1.addEventListener("RWPDUE_CONTENTS_IMAGE", onObjectUpdate);
            _arg_1.addEventListener("RWPDUE_CONTENTS_CLUB", onObjectUpdate);
            _arg_1.addEventListener("RWPDUE_CONTENTS_FLOOR", onObjectUpdate);
            _arg_1.addEventListener("RWPDUE_CONTENTS_LANDSCAPE", onObjectUpdate);
            _arg_1.addEventListener("RWPDUE_CONTENTS_WALLPAPER", onObjectUpdate);
            _arg_1.addEventListener("RWROUE_FURNI_REMOVED", onRoomObjectRemoved);
            _arg_1.addEventListener("RWEBDUE_PACKAGEINFO", onEcotronUpdate);
            super.registerUpdateEvents(_arg_1);
        }

        override public function unregisterUpdateEvents(_arg_1:IEventDispatcher):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            _arg_1.removeEventListener("RWPDUE_PACKAGEINFO", onObjectUpdate);
            _arg_1.removeEventListener("RWPDUE_CONTENTS", onObjectUpdate);
            _arg_1.removeEventListener("RWPDUE_CONTENTS_IMAGE", onObjectUpdate);
            _arg_1.removeEventListener("RWPDUE_CONTENTS_CLUB", onObjectUpdate);
            _arg_1.removeEventListener("RWPDUE_CONTENTS_FLOOR", onObjectUpdate);
            _arg_1.removeEventListener("RWPDUE_CONTENTS_LANDSCAPE", onObjectUpdate);
            _arg_1.removeEventListener("RWPDUE_CONTENTS_WALLPAPER", onObjectUpdate);
            _arg_1.removeEventListener("RWEBDUE_PACKAGEINFO", onEcotronUpdate);
            _arg_1.removeEventListener("RWROUE_FURNI_REMOVED", onRoomObjectRemoved);
        }

        private function onObjectUpdate(_arg_1:RoomWidgetPresentDataUpdateEvent):void
        {
            switch (_arg_1.type)
            {
                case "RWPDUE_PACKAGEINFO":
                    hideInterface();
                    _SafeStr_4950 = false;
                    _SafeStr_4157 = _arg_1.objectId;
                    _text = _arg_1.text;
                    _SafeStr_4360 = _arg_1.controller;
                    _senderName = _arg_1.purchaserName;
                    _SafeStr_4952 = _arg_1.purchaserFigure;
                    showInterface();
                    showIcon(_arg_1.iconBitmapData);
                    return;
                case "RWPDUE_CONTENTS_FLOOR":
                    if (!_SafeStr_4950)
                    {
                        return;
                    };
                    _SafeStr_4157 = _arg_1.objectId;
                    _SafeStr_4862 = _arg_1.classId;
                    _SafeStr_4110 = _arg_1.itemType;
                    _text = _arg_1.text;
                    _SafeStr_4360 = _arg_1.controller;
                    _SafeStr_4951 = _arg_1.placedItemId;
                    _SafeStr_4953 = _arg_1.placedItemType;
                    _placedInRoom = _arg_1.placedInRoom;
                    showGiftOpenedInterface();
                    showCustomIcon("packagecard_icon_floor");
                    return;
                case "RWPDUE_CONTENTS_LANDSCAPE":
                    if (!_SafeStr_4950)
                    {
                        return;
                    };
                    _SafeStr_4157 = _arg_1.objectId;
                    _SafeStr_4862 = _arg_1.classId;
                    _SafeStr_4110 = _arg_1.itemType;
                    _text = _arg_1.text;
                    _SafeStr_4360 = _arg_1.controller;
                    _SafeStr_4951 = _arg_1.placedItemId;
                    _SafeStr_4953 = _arg_1.placedItemType;
                    _placedInRoom = _arg_1.placedInRoom;
                    showGiftOpenedInterface();
                    showCustomIcon("packagecard_icon_landscape");
                    return;
                case "RWPDUE_CONTENTS_WALLPAPER":
                    if (!_SafeStr_4950)
                    {
                        return;
                    };
                    _SafeStr_4157 = _arg_1.objectId;
                    _SafeStr_4862 = _arg_1.classId;
                    _SafeStr_4110 = _arg_1.itemType;
                    _text = _arg_1.text;
                    _SafeStr_4360 = _arg_1.controller;
                    _SafeStr_4951 = _arg_1.placedItemId;
                    _SafeStr_4953 = _arg_1.placedItemType;
                    _placedInRoom = _arg_1.placedInRoom;
                    showGiftOpenedInterface();
                    showCustomIcon("packagecard_icon_wallpaper");
                    return;
                case "RWPDUE_CONTENTS_CLUB":
                    if (!_SafeStr_4950)
                    {
                        return;
                    };
                    _SafeStr_4157 = _arg_1.objectId;
                    _SafeStr_4862 = _arg_1.classId;
                    _SafeStr_4110 = _arg_1.itemType;
                    _text = _arg_1.text;
                    _SafeStr_4360 = _arg_1.controller;
                    showGiftOpenedInterface();
                    showCustomIcon("packagecard_icon_hc");
                    return;
                case "RWPDUE_CONTENTS":
                    if (!_SafeStr_4950)
                    {
                        return;
                    };
                    _SafeStr_4157 = _arg_1.objectId;
                    _SafeStr_4862 = _arg_1.classId;
                    _SafeStr_4110 = _arg_1.itemType;
                    _text = _arg_1.text;
                    _SafeStr_4360 = _arg_1.controller;
                    _SafeStr_4951 = _arg_1.placedItemId;
                    _SafeStr_4953 = _arg_1.placedItemType;
                    _placedInRoom = _arg_1.placedInRoom;
                    showGiftOpenedInterface();
                    showIcon(_arg_1.iconBitmapData);
                    return;
                case "RWPDUE_CONTENTS_IMAGE":
                    if (!_SafeStr_4950)
                    {
                        return;
                    };
                    showIcon(_arg_1.iconBitmapData);
                    return;
            };
        }

        private function onRoomObjectRemoved(_arg_1:RoomWidgetRoomObjectUpdateEvent):void
        {
            if (_arg_1.id == _SafeStr_4157)
            {
                hideInterface();
            };
            if (_arg_1.id == _SafeStr_4951)
            {
                if (_placedInRoom)
                {
                    _placedInRoom = false;
                    updateRoomAndInventoryButtons();
                };
            };
        }

        private function onEcotronUpdate(_arg_1:RoomWidgetEcotronBoxDataUpdateEvent):void
        {
            switch (_arg_1.type)
            {
                case "RWEBDUE_PACKAGEINFO":
                    hideInterface();
                    return;
            };
        }

        private function showCustomIcon(_arg_1:String):void
        {
            var _local_2:* = null;
            var _local_3:BitmapDataAsset = (assets.getAssetByName(_arg_1) as BitmapDataAsset);
            if (_local_3 != null)
            {
                _local_2 = (_local_3.content as BitmapData);
            };
            showIcon(_local_2);
        }

        private function showIcon(_arg_1:BitmapData):void
        {
            if (_arg_1 == null)
            {
                _arg_1 = new BitmapData(1, 1);
            };
            if (((_window == null) || (_window.disposed)))
            {
                return;
            };
            var _local_2:_SafeStr_3264 = (_window.findChildByName("gift_image") as _SafeStr_3264);
            if (_local_2 == null)
            {
                return;
            };
            if (_local_2.bitmap != null)
            {
                _local_2.bitmap.dispose();
            };
            _local_2.bitmap = new BitmapData(_local_2.width, _local_2.height, true, 0);
            var _local_3:Point = new Point(((_local_2.width - _arg_1.width) / 2), ((_local_2.height - _arg_1.height) / 2));
            _local_2.bitmap.copyPixels(_arg_1, _arg_1.rect, _local_3);
        }

        private function showGiftOpenedInterface():void
        {
            var _local_11:* = null;
            var _local_3:* = null;
            var _local_1:* = null;
            var _local_2:* = null;
            var _local_10:Boolean;
            var _local_4:* = null;
            if (_SafeStr_4157 < 0)
            {
                return;
            };
            if (_window != null)
            {
                _window.dispose();
            };
            var _local_9:XmlAsset = (assets.getAssetByName("packagecard_new_opened") as XmlAsset);
            _window = (windowManager.buildFromXML((_local_9.content as XML)) as _SafeStr_3263);
            _window.center();
            if (!isUnknownSender())
            {
                _local_11 = "widget.furni.present.window.title_from";
                _SafeStr_4020.registerParameter(_local_11, "name", _senderName);
                _window.caption = _SafeStr_4020.getLocalization(_local_11, _senderName);
            };
            var _local_6:_SafeStr_3109 = _window.findChildByName("header_button_close");
            if (_local_6 != null)
            {
                _local_6.addEventListener("WME_CLICK", onClose);
            };
            var _local_7:_SafeStr_3264 = (_window.findChildByName("image_bg") as _SafeStr_3264);
            if (_local_7 != null)
            {
                _local_3 = (assets.getAssetByName("gift_icon_background") as BitmapDataAsset);
                if (_local_3 != null)
                {
                    _local_1 = (_local_3.content as BitmapData);
                    if (_local_7.bitmap)
                    {
                        _local_7.bitmap.dispose();
                    };
                    _local_7.bitmap = _local_1.clone();
                };
            };
            var _local_5:ITextWindow = (_window.findChildByName("gift_message") as ITextWindow);
            if (_local_5 != null)
            {
                _local_5.text = "";
                if (_text != null)
                {
                    _local_2 = "widget.furni.present.message_opened";
                    _local_10 = isSpacesItem();
                    if (_local_10)
                    {
                        _local_2 = "widget.furni.present.spaces.message_opened";
                    };
                    _SafeStr_4020.registerParameter(_local_2, "product", _text);
                    if (_SafeStr_4110 == "h")
                    {
                        _local_5.text = _text;
                    }
                    else
                    {
                        _local_5.text = _SafeStr_4020.getLocalization(_local_2, _text);
                    };
                }
                else
                {
                    _local_5.visible = false;
                };
            };
            var _local_8:_SafeStr_3109 = _window.findChildByName("give_gift_button");
            if (_local_8 != null)
            {
                if (!isUnknownSender())
                {
                    _local_4 = "widget.furni.present.give_gift";
                    _SafeStr_4020.registerParameter(_local_4, "name", _senderName);
                    _local_8.caption = _SafeStr_4020.getLocalization(_local_4, _senderName);
                    _local_8.addEventListener("WME_CLICK", onGiveGiftOpened);
                }
                else
                {
                    _local_8.visible = false;
                };
            };
            prepareAvatarImageContainer();
            updateGiftDialogAvatarImage(_SafeStr_4952);
            updateRoomAndInventoryButtons();
            selectGiftedObject();
        }

        private function isSpacesItem():Boolean
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_1:Boolean;
            if (_SafeStr_4110 == "i")
            {
                _local_2 = (_SafeStr_3914 as FurniturePresentWidgetHandler).container.sessionDataManager.getWallItemData(_SafeStr_4862);
                if (_local_2 != null)
                {
                    _local_3 = _local_2.className;
                    _local_1 = (((_local_3 == "floor") || (_local_2.className == "landscape")) || (_local_2.className == "wallpaper"));
                };
            };
            return (_local_1);
        }

        private function isClubItem():Boolean
        {
            return (_SafeStr_4110 == "h");
        }

        private function updateRoomAndInventoryButtons():void
        {
            if (((_window == null) || (_window.disposed)))
            {
                return;
            };
            var _local_4:Boolean = isSpacesItem();
            var _local_7:Boolean = isClubItem();
            var _local_10:_SafeStr_3109 = _window.findChildByName("keep_in_room_button");
            if (_local_10 != null)
            {
                _local_10.addEventListener("WME_CLICK", onKeepInRoom);
                _local_10.visible = _placedInRoom;
                if (((_local_4) || (_local_7)))
                {
                    _local_10.visible = false;
                };
            };
            var _local_1:_SafeStr_3109 = _window.findChildByName("place_in_room_button");
            if (_local_1 != null)
            {
                _local_1.addEventListener("WME_CLICK", onPlaceInRoom);
                _local_1.visible = (!(_placedInRoom));
                if (_local_4)
                {
                    _local_1.disable();
                };
                if (((_local_4) || (_local_7)))
                {
                    _local_1.visible = false;
                };
            };
            var _local_2:_SafeStr_3109 = _window.findChildByName("put_in_inventory_button");
            if (_local_2 != null)
            {
                _local_2.addEventListener("WME_CLICK", onPutInInventory);
                _local_2.enable();
                if (((_local_4) || (_local_7)))
                {
                    _local_2.visible = false;
                };
            };
            var _local_8:_SafeStr_3109 = _window.findChildByName("separator");
            if (_local_8 != null)
            {
                _local_8.visible = isUnknownSender();
            };
            var _local_5:_SafeStr_3109 = (_window.findChildByName("give_container") as _SafeStr_3109);
            if (_local_5 != null)
            {
                _local_5.visible = (!(isUnknownSender()));
            };
            var _local_6:IItemListWindow = (_window.findChildByName("button_list") as IItemListWindow);
            if (_local_6 != null)
            {
                _local_6.arrangeListItems();
            };
            var _local_3:IItemListWindow = (_window.findChildByName("give_element_list") as IItemListWindow);
            if (_local_3 != null)
            {
                _local_3.arrangeListItems();
            };
            var _local_9:IItemListWindow = (_window.findChildByName("element_list") as IItemListWindow);
            if (_local_9 != null)
            {
                _local_9.arrangeListItems();
            };
            _window.resizeToFitContent();
        }

        private function resetAndHideInterface():void
        {
            _SafeStr_4950 = false;
            _SafeStr_4951 = -1;
            _placedInRoom = false;
            hideInterface();
        }

        private function onKeepInRoom(_arg_1:_SafeStr_3116):void
        {
            resetAndHideInterface();
        }

        private function onPlaceInRoom(_arg_1:_SafeStr_3116):void
        {
            var _local_3:* = null;
            var _local_2:_SafeStr_3109 = _arg_1.target;
            _local_2.disable();
            if (((_SafeStr_4951 > 0) && (!(_placedInRoom))))
            {
                _local_3 = null;
                switch (_SafeStr_4953)
                {
                    case "s":
                        _local_3 = _inventory.getFloorItemById(-(_SafeStr_4951));
                        if (requestSelectedFurniPlacement(_local_3))
                        {
                            _inventory.removeUnseenFurniCounter(_SafeStr_4951);
                        };
                        break;
                    case "i":
                        _local_3 = _inventory.getWallItemById(_SafeStr_4951);
                        if (requestSelectedFurniPlacement(_local_3))
                        {
                            _inventory.removeUnseenFurniCounter(_SafeStr_4951);
                        };
                        break;
                    case "p":
                        if (_inventory.placePetToRoom(_SafeStr_4951, false))
                        {
                            _inventory.removeUnseenPetCounter(_SafeStr_4951);
                        };
                        break;
                    default:
                };
            };
            resetAndHideInterface();
        }

        public function requestSelectedFurniPlacement(_arg_1:_SafeStr_3154):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            var _local_2:Boolean;
            if ((((_arg_1.category == 3) || (_arg_1.category == 2)) || (_arg_1.category == 4)))
            {
                _local_2 = false;
            }
            else
            {
                _local_2 = _inventory.requestSelectedFurniToMover(_arg_1);
            };
            return (_local_2);
        }

        private function onPutInInventory(_arg_1:_SafeStr_3116):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_3:* = null;
            var _local_2:_SafeStr_3109 = _arg_1.target;
            _local_2.disable();
            if (((_SafeStr_4951 > 0) && (_placedInRoom)))
            {
                if (_SafeStr_4953 == "p")
                {
                    (_SafeStr_3914 as FurniturePresentWidgetHandler).container.roomSession.pickUpPet(_SafeStr_4951);
                }
                else
                {
                    _local_4 = (_SafeStr_3914 as FurniturePresentWidgetHandler).container.roomSession.roomId;
                    _local_5 = 10;
                    _local_3 = _roomEngine.getRoomObject(_local_4, _SafeStr_4951, _local_5);
                    if (_local_3 != null)
                    {
                        _roomEngine.modifyRoomObject(_local_3.getId(), _local_5, "OBJECT_PICKUP");
                    };
                };
            };
            resetAndHideInterface();
        }

        private function showInterface():void
        {
            var _local_10:* = null;
            var _local_8:* = null;
            var _local_2:* = null;
            var _local_5:* = null;
            var _local_3:* = null;
            var _local_12:* = null;
            if (_SafeStr_4157 < 0)
            {
                return;
            };
            if (_window != null)
            {
                _window.dispose();
            };
            var _local_6:XmlAsset = (assets.getAssetByName("packagecard_new") as XmlAsset);
            _window = (windowManager.buildFromXML((_local_6.content as XML)) as _SafeStr_3263);
            _window.center();
            if (!isUnknownSender())
            {
                _local_10 = "widget.furni.present.window.title_from";
                _SafeStr_4020.registerParameter(_local_10, "name", _senderName);
                _window.caption = _SafeStr_4020.getLocalization(_local_10, _senderName);
            };
            var _local_4:_SafeStr_3109 = _window.findChildByName("header_button_close");
            if (_local_4 != null)
            {
                _local_4.addEventListener("WME_CLICK", onClose);
            };
            var _local_9:IStaticBitmapWrapperWindow = (_window.findChildByName("gift_card") as IStaticBitmapWrapperWindow);
            if (_local_9)
            {
                _local_8 = _habboConfiguration.getProperty("catalog.gift_wrapping_new.gift_card");
                if (_local_8 != "")
                {
                    _local_9.assetUri = (("${image.library.url}Giftcards/" + _local_8) + ".png");
                };
            };
            prepareAvatarImageContainer();
            if (isUnknownSender())
            {
                updateUnknownSenderAvatarImage();
            }
            else
            {
                updateGiftDialogAvatarImage(_SafeStr_4952);
            };
            var _local_1:ITextWindow = (_window.findChildByName("message_text") as ITextWindow);
            if (_local_1 != null)
            {
                _local_1.text = _text;
            };
            var _local_11:ITextWindow = (_window.findChildByName("message_from") as ITextWindow);
            if (_local_11 != null)
            {
                _local_11.text = "";
                if (!isUnknownSender())
                {
                    _local_2 = "widget.furni.present.message_from";
                    _SafeStr_4020.registerParameter(_local_2, "name", _senderName);
                    _local_11.text = _SafeStr_4020.getLocalization(_local_2, _senderName);
                    _local_11.addEventListener("WME_CLICK", onSenderNameClick);
                }
                else
                {
                    _local_11.visible = false;
                };
            };
            var _local_7:IItemListWindow = (_window.findChildByName("button_list") as IItemListWindow);
            if (_local_7 != null)
            {
                _local_5 = _local_7.getListItemByName("give_gift_button");
                if (_local_5 != null)
                {
                    if (!isUnknownSender())
                    {
                        _local_3 = "widget.furni.present.give_gift";
                        _SafeStr_4020.registerParameter(_local_3, "name", _senderName);
                        _local_5.caption = _SafeStr_4020.getLocalization(_local_3, _senderName);
                    };
                    if (_SafeStr_4360)
                    {
                        _local_5.addEventListener("WME_CLICK", onGiveGift);
                    };
                    if (((!(_SafeStr_4360)) || (isUnknownSender())))
                    {
                        _local_5.visible = false;
                    };
                };
                _local_12 = _window.findChildByName("open_gift_button");
                if (_local_12 != null)
                {
                    if (_SafeStr_4360)
                    {
                        _local_12.addEventListener("WME_CLICK", onOpenGift);
                    }
                    else
                    {
                        _local_12.visible = false;
                    };
                };
                _local_7.arrangeListItems();
            };
            _window.resizeToFitContent();
        }

        private function isUnknownSender():Boolean
        {
            return ((_senderName == null) || (_senderName.length == 0));
        }

        private function onClose(_arg_1:_SafeStr_3116):void
        {
            _SafeStr_4950 = false;
            hideInterface();
        }

        private function onGiveGift(_arg_1:_SafeStr_3116):void
        {
            openGiftShop();
            HabboTracking.getInstance().trackEventLog("Catalog", "click", "client.return_gift_from_open_giftcard.clicked");
        }

        private function onGiveGiftOpened(_arg_1:_SafeStr_3116):void
        {
            openGiftShop();
            HabboTracking.getInstance().trackEventLog("Catalog", "click", "client.return_gift_from_opened_present.clicked");
        }

        private function openGiftShop():void
        {
            if (!isUnknownSender())
            {
                _catalog.giftReceiver = _senderName;
            };
            _catalog.openCatalogPage("gift_shop");
        }

        private function send(_arg_1:IMessageComposer):void
        {
            var _local_2:* = null;
            if (_catalog != null)
            {
                _local_2 = _catalog.connection;
                if (_local_2 != null)
                {
                    _local_2.send(_arg_1);
                };
            };
        }

        private function getExtendedProfile():void
        {
            if (!isUnknownSender())
            {
                send(new _SafeStr_982(_senderName));
            };
        }

        private function onSenderImageClick(_arg_1:_SafeStr_3116):void
        {
            getExtendedProfile();
        }

        private function onSenderNameClick(_arg_1:_SafeStr_3116):void
        {
            getExtendedProfile();
        }

        private function onOpenGift(_arg_1:_SafeStr_3116):void
        {
            sendOpen();
        }

        public function getAvatarFaceBitmap(_arg_1:String):BitmapData
        {
            var _local_3:_SafeStr_1701 = (_SafeStr_3914 as FurniturePresentWidgetHandler).container.avatarRenderManager;
            if ((((_local_3 == null) || (_arg_1 == null)) || (_arg_1.length == 0)))
            {
                return (null);
            };
            var _local_2:BitmapData;
            var _local_4:_SafeStr_3138 = _local_3.createAvatarImage(_arg_1, "h", null, this);
            if (_local_4 != null)
            {
                _local_2 = _local_4.getCroppedImage("head");
                _local_4.dispose();
            };
            return (_local_2);
        }

        public function avatarImageReady(_arg_1:String):void
        {
            if (((_window == null) || (_window.disposed)))
            {
                return;
            };
            if (_arg_1 == _SafeStr_4952)
            {
                updateGiftDialogAvatarImage(_arg_1);
            };
        }

        private function prepareAvatarImageContainer():void
        {
            var _local_1:IRegionWindow = (_window.findChildByName("avatar_image_region") as IRegionWindow);
            if (_local_1 != null)
            {
                if (!isUnknownSender())
                {
                    _local_1.addEventListener("WME_CLICK", onSenderImageClick);
                }
                else
                {
                    _local_1.disable();
                };
            };
        }

        private function updateGiftDialogAvatarImage(_arg_1:String):void
        {
            var _local_2:BitmapData = getAvatarFaceBitmap(_arg_1);
            if (_local_2 != null)
            {
                updateAvatarImage(_local_2);
            };
        }

        private function updateUnknownSenderAvatarImage():void
        {
            var _local_1:* = null;
            var _local_2:BitmapDataAsset = (_assets.getAssetByName("gift_incognito") as BitmapDataAsset);
            if (_local_2 != null)
            {
                _local_1 = (_local_2.content as BitmapData);
                if (_local_1 != null)
                {
                    updateAvatarImage(_local_1.clone());
                };
            };
        }

        private function updateAvatarImage(_arg_1:BitmapData):void
        {
            if (_arg_1 == null)
            {
                return;
            };
            var _local_3:_SafeStr_3264 = (_window.findChildByName("avatar_image") as _SafeStr_3264);
            if (_local_3 == null)
            {
                return;
            };
            _local_3.bitmap = _arg_1;
            _local_3.width = _arg_1.width;
            _local_3.height = _arg_1.height;
            var _local_2:_SafeStr_3133 = (_window.findChildByName("avatar_image_region") as _SafeStr_3133);
            if (_local_2 != null)
            {
                _local_2.width = _arg_1.width;
                _local_2.height = _arg_1.height;
            };
        }

        private function hideInterface():void
        {
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            if (!_SafeStr_4950)
            {
                _SafeStr_4157 = -1;
            };
            _text = "";
            _SafeStr_4360 = false;
        }

        private function sendOpen():void
        {
            var _local_1:* = null;
            if ((((_SafeStr_4950) || (_SafeStr_4157 == -1)) || (!(_SafeStr_4360))))
            {
                return;
            };
            _SafeStr_4950 = true;
            hideInterface();
            if (messageListener != null)
            {
                _local_1 = new RoomWidgetPresentOpenMessage("RWPOM_OPEN_PRESENT", _SafeStr_4157);
                messageListener.processWidgetMessage(_local_1);
            };
        }

        private function selectGiftedObject():void
        {
            var _local_5:int;
            var _local_3:int;
            var _local_4:int;
            var _local_2:* = null;
            var _local_1:* = null;
            if (((_SafeStr_4951 > 0) && (_placedInRoom)))
            {
                _local_5 = _roomEngine.activeRoomId;
                if (_SafeStr_4953 == "p")
                {
                    _local_3 = _roomEngine.getRoomObjectCount(_local_5, 100);
                    _local_4 = 0;
                    while (_local_4 < _local_3)
                    {
                        _local_2 = _roomEngine.getRoomObjectWithIndex(_local_5, _local_4, 100);
                        _local_1 = (_SafeStr_3914 as FurniturePresentWidgetHandler).container.roomSession.userDataManager.getUserDataByIndex(_local_2.getId());
                        if (((!(_local_1 == null)) && (_local_1.webID == _SafeStr_4951)))
                        {
                            _roomEngine.selectRoomObject(_local_5, _local_1.roomObjectId, 100);
                            break;
                        };
                        _local_4++;
                    };
                }
                else
                {
                    _roomEngine.selectRoomObject(_local_5, _SafeStr_4951, 10);
                };
            };
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.present

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1708 = "_-Nb" (String#2308, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3130 = "_-fG" (String#751, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3154 = "_-kO" (String#2057, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_4020 = "_-el" (String#1659, DoABC#4)
// _SafeStr_4110 = "_-BF" (String#2380, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4862 = "_-Q1H" (String#2645, DoABC#4)
// _SafeStr_4950 = "_-b1N" (String#3005, DoABC#4)
// _SafeStr_4951 = "_-A7" (String#2579, DoABC#4)
// _SafeStr_4952 = "_-P1Y" (String#12200, DoABC#4)
// _SafeStr_4953 = "_-s13" (String#3835, DoABC#4)
// _SafeStr_8317 = "_-Do" (String#22459, DoABC#4)
// _SafeStr_982 = "_-IY" (String#18855, DoABC#4)


