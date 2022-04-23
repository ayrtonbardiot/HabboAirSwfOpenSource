// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.inventory.items.GroupItem

package com.sulake.habbo.inventory.items
{
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.inventory.furni.FurniModel;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;
    import flash.display.BitmapData;
    import com.sulake.core.window._SafeStr_3109;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets.ILimitedItemGridOverlayWidget;
    import com.sulake.habbo.window.widgets.IRarityItemGridOverlayWidget;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;

    public class GroupItem implements _SafeStr_3140 
    {

        private static const THUMB_WINDOW_LAYOUT:String = "inventory_thumb_xml";
        private static const THUMB_COLOR_NORMAL:int = 0xCCCCCC;
        private static const THUMB_COLOR_UNSEEN:int = 10275685;

        private const THUMB_BLEND_ITEMS_AVAILABLE:Number = 1;
        private const THUMB_BLEND_ITEMS_NOT_AVAILABLE:Number = 0.2;

        protected var _items:_SafeStr_24;
        protected var _window:_SafeStr_3133;
        protected var _SafeStr_4619:FurniModel;
        private var _SafeStr_4028:int;
        private var _roomEngine:IRoomEngine;
        private var _SafeStr_5213:Boolean;
        private var _selected:Boolean;
        private var _SafeStr_4158:int;
        private var _SafeStr_4601:IStuffData;
        private var _SafeStr_4268:Number;
        private var _SafeStr_5212:int = 0;
        private var _SafeStr_5214:BitmapData;
        private var _SafeStr_4720:int;
        private var _SafeStr_5211:Boolean;
        private var _SafeStr_5217:Boolean;
        private var _icon:BitmapData;
        private var _SafeStr_4620:_SafeStr_3109;
        private var _hasUnseenItems:Boolean;
        private var _SafeStr_5216:Boolean;
        private var _SafeStr_5037:String = "center";
        private var _SafeStr_3883:Boolean = false;
        private var _name:String = "";
        private var _description:String = "";
        private var _SafeStr_5218:int = -1;
        private var _SafeStr_5215:int = -1;

        public function GroupItem(_arg_1:FurniModel, _arg_2:int, _arg_3:int, _arg_4:IRoomEngine, _arg_5:IStuffData, _arg_6:Number, _arg_7:BitmapData, _arg_8:Boolean, _arg_9:String)
        {
            _SafeStr_4619 = _arg_1;
            _SafeStr_4028 = _arg_2;
            _roomEngine = _arg_4;
            _items = new _SafeStr_24();
            _SafeStr_4158 = _arg_3;
            _SafeStr_4601 = _arg_5;
            _SafeStr_4268 = _arg_6;
            _SafeStr_5037 = _arg_9;
            _icon = _arg_7;
            _SafeStr_5217 = _arg_8;
            switch (_SafeStr_4158)
            {
                case 2:
                    _name = _SafeStr_4619.controller.localization.getLocalization("inventory.furni.item.wallpaper.name");
                    _description = _SafeStr_4619.controller.localization.getLocalization("inventory.furni.item.wallpaper.desc");
                    break;
                case 3:
                    _name = _SafeStr_4619.controller.localization.getLocalization("inventory.furni.item.floor.name");
                    _description = _SafeStr_4619.controller.localization.getLocalization("inventory.furni.item.floor.desc");
                    break;
                case 4:
                    _name = _SafeStr_4619.controller.localization.getLocalization("inventory.furni.item.landscape.name");
                    _description = _SafeStr_4619.controller.localization.getLocalization("inventory.furni.item.landscape.desc");
                default:
            };
            _SafeStr_4619.soundManager.events.addEventListener("SIR_TRAX_SONG_INFO_RECEIVED", onSongInfoReceivedEvent);
        }

        public function get isImageInited():Boolean
        {
            return ((_SafeStr_3883) && (_SafeStr_5211));
        }

        public function get isImageFinished():Boolean
        {
            return (_SafeStr_5212 == -1);
        }

        public function get window():_SafeStr_3133
        {
            if (!_SafeStr_3883)
            {
                initWindow();
            };
            if (_window == null)
            {
                return (null);
            };
            if (_window.disposed)
            {
                return (null);
            };
            return (_window);
        }

        public function get isLocked():Boolean
        {
            return (_SafeStr_5213);
        }

        public function set isLocked(_arg_1:Boolean):void
        {
            _SafeStr_5213 = _arg_1;
        }

        public function get isSelected():Boolean
        {
            return (_selected);
        }

        public function set isSelected(_arg_1:Boolean):void
        {
            if (_selected != _arg_1)
            {
                _selected = _arg_1;
                updateSelectionVisual();
            };
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        public function get iconImage():BitmapData
        {
            return (_SafeStr_5214);
        }

        public function set iconImage(_arg_1:BitmapData):void
        {
            _SafeStr_5214 = _arg_1;
        }

        public function get iconCallbackId():int
        {
            return (_SafeStr_5212);
        }

        public function set iconCallbackId(_arg_1:int):void
        {
            _SafeStr_5212 = _arg_1;
        }

        public function get previewCallbackId():int
        {
            return (_SafeStr_4720);
        }

        public function set previewCallbackId(_arg_1:int):void
        {
            _SafeStr_4720 = _arg_1;
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }

        public function get stuffData():IStuffData
        {
            return (_SafeStr_4601);
        }

        public function get extra():Number
        {
            return (_SafeStr_4268);
        }

        public function get hasUnseenItems():Boolean
        {
            return (_hasUnseenItems);
        }

        public function set hasUnseenItems(_arg_1:Boolean):void
        {
            if (_hasUnseenItems != _arg_1)
            {
                _hasUnseenItems = _arg_1;
                updateBackgroundVisual();
            };
        }

        public function get alignment():String
        {
            return (_SafeStr_5037);
        }

        public function get isWallItem():Boolean
        {
            var _local_1:FurnitureItem = getAt(0);
            return ((_local_1) ? _local_1.isWallItem : false);
        }

        public function get flatId():int
        {
            var _local_1:FurnitureItem = getAt(0);
            return ((_local_1) ? _local_1.flatId : -1);
        }

        public function get isGroupable():Boolean
        {
            var _local_1:FurnitureItem = getAt(0);
            return ((_local_1) ? _local_1.groupable : true);
        }

        public function get isRented():Boolean
        {
            var _local_1:FurnitureItem = getAt(0);
            return ((_local_1) ? _local_1.isRented : false);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get description():String
        {
            return (_description);
        }

        public function dispose():void
        {
            if (_SafeStr_4619.soundManager)
            {
                if (_SafeStr_4619.soundManager.events != null)
                {
                    _SafeStr_4619.soundManager.events.removeEventListener("SIR_TRAX_SONG_INFO_RECEIVED", onSongInfoReceivedEvent);
                };
            };
            _SafeStr_4619 = null;
            _SafeStr_4620 = null;
            _roomEngine = null;
            if (_items)
            {
                _items.dispose();
                _items = null;
            };
            _SafeStr_4601 = null;
            if (_window)
            {
                _window.dispose();
            };
        }

        public function removeIntervalProcedure():void
        {
            if (_window)
            {
                _window.procedure = null;
            };
        }

        public function initImage(_arg_1:Boolean=true):void
        {
            var _local_2:* = null;
            if (_SafeStr_5214 != null)
            {
                return;
            };
            if (_SafeStr_5211)
            {
                return;
            };
            if (isWallItem)
            {
                _local_2 = _roomEngine.getWallItemIcon(_SafeStr_4028, this, _SafeStr_4601.getLegacyString());
            }
            else
            {
                _local_2 = _roomEngine.getFurnitureIcon(_SafeStr_4028, this, _SafeStr_4268, _SafeStr_4601);
            };
            if (_local_2.id > 0)
            {
                if (_arg_1)
                {
                    setLoadingImage(_local_2.data);
                };
                _SafeStr_5212 = _local_2.id;
            }
            else
            {
                setFinalImage(_local_2.data);
                _SafeStr_5212 = -1;
            };
            _SafeStr_5211 = true;
        }

        public function push(_arg_1:FurnitureItem, _arg_2:Boolean=false):void
        {
            var _local_3:FurnitureItem = _items.getValue(_arg_1.id);
            if (_local_3 == null)
            {
                _items.add(_arg_1.id, _arg_1);
            }
            else
            {
                _local_3.locked = false;
            };
            updateItemCountVisual();
            updateSelectionVisual();
            if (((_name == null) || (_name.length == 0)))
            {
                _name = getFurniItemName();
            };
            if (((_description == null) || (_description.length == 0)))
            {
                _description = getFurniItemDesc();
            };
            if (_arg_2 != _hasUnseenItems)
            {
                _hasUnseenItems = _arg_2;
                updateBackgroundVisual();
            };
        }

        public function unshift(_arg_1:FurnitureItem):void
        {
            var _local_2:FurnitureItem = _items.getValue(_arg_1.id);
            if (_local_2 == null)
            {
                _items.unshift(_arg_1.id, _arg_1);
            }
            else
            {
                _local_2.locked = false;
            };
            updateAllThumbDataVisuals();
        }

        public function pop():FurnitureItem
        {
            var _local_1:* = null;
            if (_items.length > 0)
            {
                _local_1 = (_items.getWithIndex((_items.length - 1)) as FurnitureItem);
                _items.remove(_local_1.id);
            };
            updateAllThumbDataVisuals();
            return (_local_1);
        }

        public function peek():FurnitureItem
        {
            var _local_1:* = null;
            if (_items.length > 0)
            {
                _local_1 = (_items.getWithIndex((_items.length - 1)) as FurnitureItem);
                updateAllThumbDataVisuals();
            };
            return (_local_1);
        }

        public function getAt(_arg_1:int):FurnitureItem
        {
            return (_items.getWithIndex(_arg_1));
        }

        public function getItemsForTrade(_arg_1:int):Vector.<_SafeStr_3154>
        {
            var _local_5:int;
            var _local_2:* = null;
            var _local_3:Vector.<_SafeStr_3154> = new Vector.<_SafeStr_3154>();
            var _local_6:_SafeStr_3154 = getOneForTrade();
            if (_local_6 == null)
            {
                return (_local_3);
            };
            var _local_4:int;
            _local_5 = 0;
            while (_local_5 < _items.length)
            {
                if (_local_4 >= _arg_1) break;
                _local_2 = _items.getWithIndex(_local_5);
                if ((((!(_local_2.locked)) && (_local_2.tradeable)) && (_local_2.type == _local_6.type)))
                {
                    _local_4++;
                    _local_3.push(_local_2);
                };
                _local_5++;
            };
            return (_local_3);
        }

        public function getOneForTrade():FurnitureItem
        {
            var _local_2:* = null;
            var _local_3:int;
            var _local_1:* = null;
            if (((_SafeStr_5215 >= 0) && (_SafeStr_5215 < _items.length)))
            {
                _local_2 = _items.getWithIndex(_SafeStr_5215);
                if (((!(_local_2.locked)) && (_local_2.tradeable)))
                {
                    return (_local_2);
                };
            };
            _local_3 = 0;
            while (_local_3 < _items.length)
            {
                _local_1 = _items.getWithIndex(_local_3);
                if (((!(_local_1.locked)) && (_local_1.tradeable)))
                {
                    return (_local_1);
                };
                _local_3++;
            };
            return (null);
        }

        public function getOneForRecycle():FurnitureItem
        {
            var _local_2:int;
            var _local_1:* = null;
            _local_2 = 0;
            while (_local_2 < _items.length)
            {
                _local_1 = _items.getWithIndex(_local_2);
                if (((!(_local_1.locked)) && (_local_1.recyclable)))
                {
                    addLockTo(_local_1.id);
                    return (_local_1);
                };
                _local_2++;
            };
            return (null);
        }

        public function getOneForSelling():FurnitureItem
        {
            var _local_2:int;
            var _local_1:* = null;
            _local_2 = 0;
            while (_local_2 < _items.length)
            {
                _local_1 = _items.getWithIndex(_local_2);
                if (((!(_local_1.locked)) && (_local_1.sellable)))
                {
                    return (_local_1);
                };
                _local_2++;
            };
            return (null);
        }

        public function getFurniIds():Array
        {
            var _local_2:Array = [];
            for each (var _local_1:FurnitureItem in _items)
            {
                _local_2.push(_local_1.id);
            };
            return (_local_2);
        }

        public function getNonRentedFurnitureIds():Array
        {
            var _local_2:Array = [];
            for each (var _local_1:FurnitureItem in _items)
            {
                if (!_local_1.isRented)
                {
                    _local_2.push(_local_1.id);
                };
            };
            return (_local_2);
        }

        public function addLockTo(_arg_1:int):Boolean
        {
            var _local_3:int;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 < _items.length)
            {
                _local_2 = _items.getWithIndex(_local_3);
                if (_local_2.id == _arg_1)
                {
                    _local_2.locked = true;
                    updateItemCountVisual();
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function updateLocks(_arg_1:Array):void
        {
            var _local_5:Boolean;
            var _local_2:* = null;
            var _local_4:Boolean;
            var _local_3:int = (_items.length - 1);
            while (_local_3 >= 0)
            {
                _local_2 = _items.getWithIndex(_local_3);
                _local_4 = (_arg_1.indexOf(_local_2.ref) >= 0);
                if (_local_2.locked != _local_4)
                {
                    _local_2.locked = _local_4;
                    _local_5 = true;
                };
                _local_3--;
            };
            if (_local_5)
            {
                updateItemCountVisual();
            };
        }

        public function removeLockFrom(_arg_1:int):Boolean
        {
            var _local_3:int;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 < _items.length)
            {
                _local_2 = _items.getWithIndex(_local_3);
                if (_local_2.id == _arg_1)
                {
                    _local_2.locked = false;
                    updateItemCountVisual();
                    return (true);
                };
                _local_3++;
            };
            return (false);
        }

        public function removeAllLocks():void
        {
            var _local_3:Boolean;
            var _local_2:int;
            var _local_1:* = null;
            _local_2 = (_items.length - 1);
            while (_local_2 >= 0)
            {
                _local_1 = _items.getWithIndex(_local_2);
                if (_local_1.locked)
                {
                    _local_1.locked = false;
                    _local_3 = true;
                };
                _local_2--;
            };
            if (_local_3)
            {
                updateItemCountVisual();
            };
        }

        public function getTotalCount():int
        {
            var _local_2:int;
            var _local_3:int;
            var _local_1:* = null;
            if (category == 5)
            {
                _local_2 = 0;
                _local_3 = 0;
                while (_local_3 < _items.length)
                {
                    _local_1 = (_items.getWithIndex(_local_3) as FurnitureItem);
                    _local_2 = (_local_2 + _local_1.stuffData.getLegacyString());
                    _local_3++;
                };
                return (_local_2);
            };
            return (_items.length);
        }

        public function getRecyclableCount():int
        {
            var _local_3:int;
            var _local_1:* = null;
            var _local_2:int;
            _local_3 = 0;
            while (_local_3 < _items.length)
            {
                _local_1 = (_items.getWithIndex(_local_3) as FurnitureItem);
                if (((_local_1.recyclable) && (!(_local_1.locked))))
                {
                    _local_2++;
                };
                _local_3++;
            };
            return (_local_2);
        }

        public function getTradeableCount():int
        {
            var _local_3:int;
            var _local_1:* = null;
            var _local_2:int;
            _local_3 = 0;
            while (_local_3 < _items.length)
            {
                _local_1 = (_items.getWithIndex(_local_3) as FurnitureItem);
                if (((_local_1.tradeable) && (!(_local_1.locked))))
                {
                    _local_2++;
                };
                _local_3++;
            };
            return (_local_2);
        }

        public function remove(_arg_1:int):FurnitureItem
        {
            var _local_2:FurnitureItem = _items.getValue(_arg_1);
            if (_local_2)
            {
                _items.remove(_arg_1);
                updateAllThumbDataVisuals();
                return (_local_2);
            };
            return (null);
        }

        public function getItem(_arg_1:int):FurnitureItem
        {
            return (_items.getValue(_arg_1));
        }

        public function replaceItem(_arg_1:int, _arg_2:FurnitureItem):void
        {
            _items.add(_arg_1, _arg_2);
            updateAllThumbDataVisuals();
        }

        public function getMinimumItemsToShowCounter():int
        {
            return (2);
        }

        public function getUnlockedCount():int
        {
            var _local_1:* = null;
            var _local_3:int;
            if (category == 5)
            {
                return (getTotalCount());
            };
            var _local_2:int;
            _local_3 = 0;
            while (_local_3 < _items.length)
            {
                _local_1 = _items.getWithIndex(_local_3);
                if (!_local_1.locked)
                {
                    _local_2++;
                };
                _local_3++;
            };
            return (_local_2);
        }

        public function updateAllThumbDataVisuals():void
        {
            if (_window == null)
            {
                return;
            };
            if (_window.disposed)
            {
                return;
            };
            updateItemImageVisual();
            updateBackgroundVisual();
            updateItemCountVisual();
            updateSelectionVisual();
            updateRentStateVisual();
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            if (_window == null)
            {
                return;
            };
            if (_window.disposed)
            {
                return;
            };
            if (_SafeStr_5212 != _arg_1)
            {
                return;
            };
            _SafeStr_5214 = _arg_2;
            updateItemImageVisual();
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        private function setFinalImage(_arg_1:BitmapData):void
        {
            _SafeStr_5214 = _arg_1;
            _SafeStr_5211 = true;
            _SafeStr_5212 = -1;
            updateItemImageVisual();
        }

        private function setLoadingImage(_arg_1:BitmapData):void
        {
            _SafeStr_5214 = _arg_1;
            _SafeStr_5211 = true;
            updateItemImageVisual();
        }

        private function updateRentStateVisual():void
        {
            if (((_window == null) || (_window.disposed)))
            {
                return;
            };
            var _local_2:FurnitureItem = getAt(0);
            var _local_1:IStaticBitmapWrapperWindow = (_window.findChildByName("rent_state") as IStaticBitmapWrapperWindow);
            if (((!(_local_2)) || (!(isRented))))
            {
                _local_1.visible = false;
                return;
            };
            _local_1.visible = ((_local_2.secondsToExpiration >= 0) && (_local_2.hasRentPeriodStarted));
            var _local_3:int = _SafeStr_4619.controller.getInteger("purchase.rent.warning_duration_seconds", 172800);
            _local_1.assetUri = ((_local_2.secondsToExpiration < _local_3) ? "inventory_thumb_rent_ending" : "inventory_thumb_rent_started");
        }

        private function updateItemCountVisual():void
        {
            var _local_4:* = null;
            if (!_window)
            {
                return;
            };
            var _local_5:int = getUnlockedCount();
            var _local_1:* = (_local_5 >= getMinimumItemsToShowCounter());
            var _local_3:_SafeStr_3109 = _window.findChildByName("number_container");
            _local_3.visible = _local_1;
            if (_local_1)
            {
                _local_4 = (_window.findChildByName("number") as ITextWindow);
                _local_4.text = _local_5;
            };
            var _local_2:_SafeStr_3264 = (_window.findChildByName("bitmap") as _SafeStr_3264);
            if (_local_5 <= 0)
            {
                _local_2.blend = 0.2;
            }
            else
            {
                _local_2.blend = 1;
            };
        }

        private function updateBackgroundVisual():void
        {
            if (!_window)
            {
                return;
            };
            if (!_SafeStr_4620)
            {
                _SafeStr_4620 = _window.findChildByTag("BG_COLOR");
            };
            _SafeStr_4620.color = ((_hasUnseenItems) ? 10275685 : 0xCCCCCC);
        }

        private function updateSelectionVisual():void
        {
            if (!_window)
            {
                return;
            };
            _window.findChildByName("outline").visible = isSelected;
        }

        private function updateItemImageVisual():void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            var _local_5:* = null;
            var _local_1:* = null;
            if (!_window)
            {
                return;
            };
            if (stuffData.uniqueSerialNumber > 0)
            {
                _local_4 = _SafeStr_3199(_window.findChildByName("unique_item_overlay_container"));
                _local_2 = ILimitedItemGridOverlayWidget(_local_4.widget);
                _local_4.visible = true;
                _local_2.serialNumber = stuffData.uniqueSerialNumber;
                _local_2.animated = true;
                _window.findChildByName("unique_item_background_bitmap").visible = true;
            }
            else
            {
                if (stuffData.rarityLevel >= 0)
                {
                    _local_5 = _SafeStr_3199(_window.findChildByName("rarity_item_overlay_container"));
                    _local_1 = IRarityItemGridOverlayWidget(_local_5.widget);
                    _local_1.rarityLevel = stuffData.rarityLevel;
                    _local_5.visible = true;
                };
            };
            var _local_3:_SafeStr_3264 = (_window.findChildByName("bitmap") as _SafeStr_3264);
            if (_local_3)
            {
                _local_3.bitmap = _SafeStr_5214;
            };
        }

        private function itemEventProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:Boolean;
            switch (_arg_1.type)
            {
                case "WME_UP":
                    _SafeStr_5216 = false;
                    _SafeStr_4619.cancelFurniInMover();
                    return;
                case "WME_DOWN":
                    _SafeStr_4619.removeSelections();
                    isSelected = true;
                    _SafeStr_5216 = true;
                    _SafeStr_4619.updateActionView();
                    _SafeStr_4619.categorySelection = this;
                    return;
                case "WME_OUT":
                    if (((!(_SafeStr_5216)) || (_SafeStr_4619.isTradingOpen)))
                    {
                        return;
                    };
                    _local_3 = _SafeStr_4619.requestSelectedFurniPlacement(true);
                    if (_local_3)
                    {
                        _SafeStr_5216 = false;
                    };
                    return;
                case "WME_CLICK":
                    _SafeStr_5216 = false;
                    return;
                case "WME_DOUBLE_CLICK":
                    _SafeStr_4619.requestCurrentActionOnSelection();
                    _SafeStr_5216 = false;
                    return;
            };
        }

        private function initWindow():void
        {
            createWindow();
            if (_icon != null)
            {
                setFinalImage(_icon);
            }
            else
            {
                if (!_SafeStr_5217)
                {
                    initImage();
                };
            };
            _window.procedure = itemEventProc;
            _window.name = ((_roomEngine.getFurnitureType(type) + ".") + category);
            if (((stuffData) && (!(stuffData.getLegacyString() == ""))))
            {
                _window.name = (_window.name + (".s" + stuffData));
            };
            if (!isNaN(extra))
            {
                _window.name = (_window.name + (".e" + extra));
            };
            updateBackgroundVisual();
            updateItemCountVisual();
            updateItemImageVisual();
            updateSelectionVisual();
            _SafeStr_3883 = true;
        }

        protected function createWindow():void
        {
            _window = _SafeStr_4619.createItemWindow("inventory_thumb_xml");
        }

        private function getFurniItemName():String
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_1:FurnitureItem = peek();
            if (_local_1 == null)
            {
                return ("");
            };
            switch (_SafeStr_4158)
            {
                case 6:
                    _local_2 = (("poster_" + _local_1.stuffData.getLegacyString()) + "_name");
                    break;
                case 8:
                    _local_3 = _SafeStr_4619.soundManager.musicController.getSongInfo(_local_1.extra);
                    if (_local_3 != null)
                    {
                        return (_local_3.name);
                    };
                    getSongInfo(_local_1);
                    return ("");
                default:
                    if (isWallItem)
                    {
                        _local_2 = ("wallItem.name." + _local_1.type);
                    }
                    else
                    {
                        _local_2 = ("roomItem.name." + _local_1.type);
                    };
            };
            return (_SafeStr_4619.controller.localization.getLocalization(_local_2));
        }

        private function getFurniItemDesc():String
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_1:FurnitureItem = peek();
            if (_local_1 == null)
            {
                return ("");
            };
            switch (_SafeStr_4158)
            {
                case 6:
                    _local_2 = (("poster_" + _local_1.stuffData.getLegacyString()) + "_desc");
                    break;
                case 8:
                    _local_3 = _SafeStr_4619.soundManager.musicController.getSongInfo(_local_1.extra);
                    if (_local_3 != null)
                    {
                        return (_local_3.creator);
                    };
                    getSongInfo(_local_1);
                    return ("");
                default:
                    if (isWallItem)
                    {
                        _local_2 = ("wallItem.desc." + _local_1.type);
                    }
                    else
                    {
                        _local_2 = ("roomItem.desc." + _local_1.type);
                    };
            };
            return (_SafeStr_4619.controller.localization.getLocalization(_local_2));
        }

        private function getSongInfo(_arg_1:FurnitureItem):void
        {
            var _local_2:int;
            var _local_3:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            _SafeStr_5218 = -1;
            if (_arg_1 != null)
            {
                if (_arg_1.category == 8)
                {
                    _local_2 = _arg_1.extra;
                    _local_3 = _SafeStr_4619.soundManager.musicController.getSongInfo(_local_2);
                    if (_local_3 == null)
                    {
                        _SafeStr_4619.soundManager.musicController.requestSongInfoWithoutSamples(_local_2);
                        _SafeStr_5218 = _local_2;
                    };
                };
            };
        }

        private function onSongInfoReceivedEvent(_arg_1:SongInfoReceivedEvent):void
        {
            if (_arg_1.id == _SafeStr_5218)
            {
                _SafeStr_5218 = -1;
                _name = getFurniItemName();
                _description = getFurniItemDesc();
                if (_SafeStr_4619.getSelectedItem() == this)
                {
                    _SafeStr_4619.updateActionView();
                };
            };
        }

        public function get selectedItemIndex():int
        {
            return (_SafeStr_5215);
        }

        public function set selectedItemIndex(_arg_1:int):void
        {
            if (_arg_1 >= _items.length)
            {
                _arg_1 = 0;
            };
            _SafeStr_5215 = _arg_1;
        }


    }
}//package com.sulake.habbo.inventory.items

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3154 = "_-kO" (String#2057, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_4268 = "_-8L" (String#3669, DoABC#4)
// _SafeStr_4601 = "_-o1B" (String#1746, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_4620 = "_-1k" (String#1879, DoABC#4)
// _SafeStr_4720 = "_-q1e" (String#2637, DoABC#4)
// _SafeStr_5037 = "_-O11" (String#4228, DoABC#4)
// _SafeStr_5211 = "_-MI" (String#7945, DoABC#4)
// _SafeStr_5212 = "_-kV" (String#5911, DoABC#4)
// _SafeStr_5213 = "_-h18" (String#9789, DoABC#4)
// _SafeStr_5214 = "_-D1k" (String#2378, DoABC#4)
// _SafeStr_5215 = "_-m1N" (String#4397, DoABC#4)
// _SafeStr_5216 = "_-MZ" (String#6393, DoABC#4)
// _SafeStr_5217 = "_-o1T" (String#21916, DoABC#4)
// _SafeStr_5218 = "_-H1N" (String#9040, DoABC#4)


