// by nota

//com.sulake.habbo.inventory.bots.BotsView

package com.sulake.habbo.inventory.bots
{
    import com.sulake.habbo.inventory.IInventoryView;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.avatar._SafeStr_1701;
    import com.sulake.core.utils._SafeStr_24;
    import _-Lc._SafeStr_1620;
    import flash.display.BitmapData;
    import com.sulake.habbo.avatar._SafeStr_3138;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Point;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components._SafeStr_3122;

    public class BotsView implements IInventoryView, _SafeStr_1875 
    {

        private const STATE_NULL:int = 0;
        private const STATE_INITIALIZING:int = 1;
        private const STATE_EMPTY:int = 2;
        private const STATE_CONTENT:int = 3;

        private var _windowManager:_SafeStr_1695;
        private var _SafeStr_3745:_SafeStr_21;
        private var _SafeStr_3882:_SafeStr_3133;
        private var _SafeStr_4619:BotsModel;
        private var _disposed:Boolean = false;
        private var _SafeStr_5384:IItemGridWindow;
        private var _roomEngine:IRoomEngine;
        private var _avatarRenderer:_SafeStr_1701;
        private var _gridItems:_SafeStr_24;
        private var _SafeStr_5575:BotGridItem;
        private var _SafeStr_4468:int = 0;
        private var _SafeStr_6114:int;
        private var _SafeStr_3883:Boolean = false;

        public function BotsView(_arg_1:BotsModel, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:IRoomEngine, _arg_5:_SafeStr_1701)
        {
            _SafeStr_4619 = _arg_1;
            _SafeStr_3745 = _arg_3;
            _windowManager = _arg_2;
            _roomEngine = _arg_4;
            _avatarRenderer = _arg_5;
            _gridItems = new _SafeStr_24();
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get isVisible():Boolean
        {
            return (((_SafeStr_3882) && (!(_SafeStr_3882.parent == null))) && (_SafeStr_3882.visible));
        }

        public function dispose():void
        {
            _windowManager = null;
            _avatarRenderer = null;
            _roomEngine = null;
            _SafeStr_3745 = null;
            _SafeStr_4619 = null;
            _SafeStr_3882 = null;
            _disposed = true;
        }

        public function update():void
        {
            if (!_SafeStr_3883)
            {
                return;
            };
            updateGrid();
            updatePreview(_SafeStr_5575);
            updateContainerVisibility();
        }

        public function removeItem(_arg_1:int):void
        {
            if (!_SafeStr_3883)
            {
                return;
            };
            var _local_2:BotGridItem = (_gridItems.remove(_arg_1) as BotGridItem);
            if (_local_2 == null)
            {
                return;
            };
            _SafeStr_5384.removeGridItem(_local_2.window);
            if (_SafeStr_5575 == _local_2)
            {
                _SafeStr_5575 = null;
                selectFirst();
            };
        }

        public function addItem(_arg_1:_SafeStr_1620):void
        {
            if (!_SafeStr_3883)
            {
                return;
            };
            if (_arg_1 == null)
            {
                return;
            };
            if (_gridItems.getValue(_arg_1.id) != null)
            {
                return;
            };
            var _local_2:BotGridItem = new BotGridItem(this, _arg_1, _windowManager, _SafeStr_3745, _SafeStr_4619.isUnseen(_arg_1.id));
            if (_local_2 != null)
            {
                _SafeStr_5384.addGridItem(_local_2.window);
                _gridItems.add(_arg_1.id, _local_2);
                if (_SafeStr_5575 == null)
                {
                    selectFirst();
                };
            };
        }

        public function placeItemToRoom(_arg_1:int, _arg_2:Boolean=false):void
        {
            _SafeStr_4619.placeItemToRoom(_arg_1, _arg_2);
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
            return (_SafeStr_3882);
        }

        public function setSelectedGridItem(_arg_1:BotGridItem):void
        {
            if (!_SafeStr_3883)
            {
                return;
            };
            if (_SafeStr_5575 != null)
            {
                _SafeStr_5575.setSelected(false);
            };
            _SafeStr_5575 = _arg_1;
            if (_SafeStr_5575 != null)
            {
                _SafeStr_5575.setSelected(true);
            };
            updatePreview(_arg_1);
        }

        public function updateState():void
        {
            var _local_1:int;
            if (!_SafeStr_3883)
            {
                return;
            };
            var _local_2:_SafeStr_24 = _SafeStr_4619.items;
            if (!_SafeStr_4619.isListInitialized())
            {
                _local_1 = 1;
            }
            else
            {
                if (((!(_local_2)) || (_local_2.length == 0)))
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
            if (_SafeStr_4468 == 3)
            {
                updateGrid();
                updatePreview();
            };
        }

        public function getGridItemImage(_arg_1:_SafeStr_1620):BitmapData
        {
            var _local_2:int = 3;
            return (getItemImage(_arg_1, _local_2, false, "h"));
        }

        public function getItemImage(_arg_1:_SafeStr_1620, _arg_2:int, _arg_3:Boolean, _arg_4:String):BitmapData
        {
            var _local_5:* = null;
            var _local_6:_SafeStr_3138 = _avatarRenderer.createAvatarImage(_arg_1.figure, _arg_4, _arg_1.gender, this);
            _local_6.setDirection("full", _arg_2);
            if (_arg_3)
            {
                _local_5 = _local_6.getCroppedImage("full");
            }
            else
            {
                _local_5 = _local_6.getCroppedImage("head");
            };
            _local_6.dispose();
            return (_local_5);
        }

        public function avatarImageReady(_arg_1:String):void
        {
            if (disposed)
            {
                return;
            };
            for each (var _local_2:BotGridItem in _gridItems)
            {
                if (_local_2.data.figure == _arg_1)
                {
                    _local_2.setImage(getGridItemImage(_local_2.data));
                };
            };
        }

        private function selectFirst():void
        {
            if (((_gridItems == null) || (_gridItems.length == 0)))
            {
                updatePreview();
                return;
            };
            setSelectedGridItem(_gridItems.getWithIndex(0));
        }

        public function selectById(_arg_1:int):void
        {
            setSelectedGridItem(_gridItems.getValue(_arg_1));
        }

        private function updateGrid():void
        {
            var _local_4:int;
            var _local_3:* = null;
            if (_SafeStr_3882 == null)
            {
                return;
            };
            var _local_1:Array = _gridItems.getKeys();
            var _local_2:Array = ((_SafeStr_4619.items) ? _SafeStr_4619.items.getKeys() : []);
            _SafeStr_5384.lock();
            for each (_local_4 in _local_1)
            {
                if (_local_2.indexOf(_local_4) == -1)
                {
                    removeItem(_local_4);
                };
            };
            for each (_local_4 in _local_2)
            {
                if (_local_1.indexOf(_local_4) == -1)
                {
                    addItem(_SafeStr_4619.items.getValue(_local_4));
                };
                _local_3 = _gridItems.getValue(_local_4);
                _local_3.setUnseen(_SafeStr_4619.isUnseen(_local_4));
            };
            _SafeStr_5384.unlock();
        }

        private function startPlacingHandler(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_5575 == null)
            {
                return;
            };
            var _local_2:_SafeStr_1620 = _SafeStr_5575.data;
            if (_local_2 == null)
            {
                return;
            };
            placeItemToRoom(_local_2.id);
        }

        private function windowEventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
        }

        private function updateContainerVisibility():void
        {
            if (_SafeStr_4619.controller.currentCategoryId != "bots")
            {
                return;
            };
            var _local_1:_SafeStr_3133 = _SafeStr_4619.controller.view.loadingContainer;
            var _local_3:_SafeStr_3133 = _SafeStr_4619.controller.view.emptyContainer;
            var _local_4:_SafeStr_3109 = _SafeStr_3882.findChildByName("grid");
            var _local_2:_SafeStr_3109 = _SafeStr_3882.findChildByName("preview_container");
            switch (_SafeStr_4468)
            {
                case 1:
                    if (_local_1)
                    {
                        _local_1.visible = true;
                    };
                    if (_local_3)
                    {
                        _local_3.visible = false;
                    };
                    _local_4.visible = false;
                    _local_2.visible = false;
                    return;
                case 2:
                    if (_local_1)
                    {
                        _local_1.visible = false;
                    };
                    if (_local_3)
                    {
                        _local_3.visible = true;
                    };
                    _local_4.visible = false;
                    _local_2.visible = false;
                    return;
                case 3:
                    if (_local_1)
                    {
                        _local_1.visible = false;
                    };
                    if (_local_3)
                    {
                        _local_3.visible = false;
                    };
                    _local_4.visible = true;
                    _local_2.visible = true;
                default:
            };
        }

        private function updatePreview(_arg_1:BotGridItem=null):void
        {
            var _local_3:* = null;
            var _local_11:* = null;
            var _local_13:* = null;
            var _local_10:Boolean;
            var _local_4:* = null;
            var _local_5:* = null;
            if (_SafeStr_3882 == null)
            {
                return;
            };
            _SafeStr_6114 = -1;
            if (((_arg_1 == null) || (_arg_1.data == null)))
            {
                _local_3 = new BitmapData(1, 1);
                _local_11 = "";
                _local_13 = "";
                _local_10 = false;
            }
            else
            {
                _local_4 = _arg_1.data;
                _local_11 = _local_4.name;
                _local_13 = _local_4.motto;
                _local_3 = getItemImage(_local_4, 4, true, "h");
                _local_10 = true;
            };
            var _local_9:_SafeStr_3264 = (_SafeStr_3882.findChildByName("preview_image") as _SafeStr_3264);
            if (_local_9 != null)
            {
                _local_5 = new BitmapData(_local_9.width, _local_9.height);
                _local_5.fillRect(_local_5.rect, 0);
                _local_5.copyPixels(_local_3, _local_3.rect, new Point(((_local_5.width / 2) - (_local_3.width / 2)), ((_local_5.height / 2) - (_local_3.height / 2))));
                _local_9.bitmap = _local_5;
            };
            _local_3.dispose();
            var _local_6:ITextWindow = (_SafeStr_3882.findChildByName("bot_name") as ITextWindow);
            if (_local_6 != null)
            {
                _local_6.caption = _local_11;
            };
            _local_6 = (_SafeStr_3882.findChildByName("bot_description") as ITextWindow);
            if (_local_6 != null)
            {
                _local_6.caption = _local_13;
            };
            var _local_8:Boolean;
            var _local_12:Boolean;
            if (_SafeStr_4619.roomSession != null)
            {
                _local_8 = _SafeStr_4619.roomSession.areBotsAllowed;
                _local_12 = _SafeStr_4619.roomSession.isRoomOwner;
            };
            var _local_2:String = "";
            if (!_local_12)
            {
                if (_local_8)
                {
                    _local_2 = "${inventory.bots.allowed}";
                }
                else
                {
                    _local_2 = "${inventory.bots.forbidden}";
                };
            };
            _local_6 = (_SafeStr_3882.findChildByName("preview_info") as ITextWindow);
            if (_local_6 != null)
            {
                _local_6.caption = _local_2;
            };
            var _local_7:_SafeStr_3122 = (_SafeStr_3882.findChildByName("place_button") as _SafeStr_3122);
            if (_local_7 != null)
            {
                if (((_local_10) && ((_local_12) || (_local_8))))
                {
                    _local_7.enable();
                }
                else
                {
                    _local_7.disable();
                };
            };
        }

        private function addUnseenItemSymbols():void
        {
        }

        private function init():void
        {
            var _local_1:* = null;
            _SafeStr_3882 = _SafeStr_4619.controller.view.getView("bots");
            _SafeStr_3882.visible = false;
            _SafeStr_3882.procedure = windowEventHandler;
            addUnseenItemSymbols();
            _SafeStr_5384 = (_SafeStr_3882.findChildByName("grid") as IItemGridWindow);
            _local_1 = (_SafeStr_3882.findChildByName("place_button") as _SafeStr_3122);
            if (_local_1 != null)
            {
                _local_1.addEventListener("WME_CLICK", startPlacingHandler);
            };
            var _local_2:_SafeStr_3264 = (_SafeStr_3882.findChildByName("preview_image") as _SafeStr_3264);
            if (_local_2 != null)
            {
                _local_2.addEventListener("WME_DOWN", startPlacingHandler);
            };
            updatePreview();
            updateState();
            selectFirst();
            _SafeStr_3883 = true;
        }


    }
}//package com.sulake.habbo.inventory.bots

// _SafeStr_1620 = "_-V1f" (String#6472, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_1701 = "_-FF" (String#1596, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3745 = "_-4b" (String#920, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_4468 = "_-X12" (String#2196, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)
// _SafeStr_5384 = "_-Ng" (String#1406, DoABC#4)
// _SafeStr_5575 = "_-c4" (String#1493, DoABC#4)
// _SafeStr_6114 = "_-Pn" (String#7893, DoABC#4)


