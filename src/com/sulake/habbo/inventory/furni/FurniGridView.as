// by nota

//com.sulake.habbo.inventory.furni.FurniGridView

package com.sulake.habbo.inventory.furni
{
    import com.sulake.core.window.components.IItemGridWindow;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.inventory.items.GroupItem;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class FurniGridView 
    {

        private static const PLACEMENT_ANYWHERE:int = 0;
        private static const PLACEMENT_IN_ROOM:int = 1;
        private static const PLACEMENT_NOT_IN_ROOM:int = 2;

        private var _SafeStr_5384:IItemGridWindow;
        private var _items:Vector.<GroupItem>;
        private var _showFloorItems:Boolean = true;
        private var _showWallItems:Boolean = true;
        private var _SafeStr_6743:int;
        private var _showingRentedItems:Boolean = false;
        private var _passedItems:Vector.<GroupItem>;
        private var _SafeStr_6535:IItemListWindow;
        private var _SafeStr_6537:IRegionWindow;
        private var _SafeStr_6536:int = 200;
        private var _SafeStr_4780:int = -1;
        private var _currentPageItems:Vector.<GroupItem>;
        private var _SafeStr_5447:String = "";

        public function FurniGridView(_arg_1:IItemGridWindow, _arg_2:IItemListWindow)
        {
            _SafeStr_5384 = _arg_1;
            _SafeStr_5384.shouldRebuildGridOnResize = false;
            _items = new Vector.<GroupItem>(0);
            _passedItems = new Vector.<GroupItem>(0);
            _SafeStr_6535 = _arg_2;
            if (_SafeStr_6535)
            {
                _SafeStr_6537 = (_SafeStr_6535.removeListItemAt(0) as IRegionWindow);
            };
        }

        public function get visibleCount():int
        {
            return (_SafeStr_5384.numGridItems);
        }

        public function get currentPageItems():Vector.<GroupItem>
        {
            return (_currentPageItems);
        }

        private function get pageCount():int
        {
            return ((_passedItems.length / _SafeStr_6536) + 1);
        }

        public function dispose():void
        {
            _SafeStr_5384 = null;
            _items = null;
        }

        public function clearGrid():void
        {
            if (_SafeStr_5384 != null)
            {
                _SafeStr_5384.removeGridItems();
            };
            _SafeStr_5384.destroyGridItems();
        }

        public function setFilter(_arg_1:int, _arg_2:String, _arg_3:Boolean, _arg_4:String, _arg_5:int):void
        {
            _showFloorItems = ((_arg_1 == 0) || (_arg_1 == 1));
            _showWallItems = ((_arg_1 == 0) || (_arg_1 == 2));
            _showingRentedItems = _arg_3;
            _SafeStr_6743 = _arg_5;
            _SafeStr_5447 = _arg_4.toLowerCase();
            update();
        }

        public function itemWasUpdated(_arg_1:GroupItem):void
        {
            if (passFilter(_arg_1))
            {
                update();
            };
        }

        public function getFirstThumb():_SafeStr_3133
        {
            if (_SafeStr_5384.numGridItems == 0)
            {
                return (null);
            };
            return (_SafeStr_5384.getGridItemAt(0) as _SafeStr_3133);
        }

        public function setItems(_arg_1:Vector.<GroupItem>):void
        {
            _items = _arg_1;
            update();
        }

        private function update():void
        {
            var currentItems:Vector.<GroupItem> = new Vector.<GroupItem>(0);
            for each (var item:GroupItem in _items)
            {
                if (passFilter(item))
                {
                    currentItems.push(item);
                };
            };
            if (_showingRentedItems)
            {
                currentItems = currentItems.sort(function (_arg_1:GroupItem, _arg_2:GroupItem):Number
                {
                    var _local_5:FurnitureItem = _arg_1.peek();
                    var _local_4:FurnitureItem = _arg_2.peek();
                    var _local_3:int = (_local_4.hasRentPeriodStarted - _local_5.hasRentPeriodStarted);
                    return ((_local_3 != 0) ? _local_3 : (_local_5.secondsToExpiration - _local_4.secondsToExpiration));
                });
            };
            if (currentItems.length == _passedItems.length)
            {
                var changes:Boolean = false;
                var i:int = 0;
                while (i < currentItems.length)
                {
                    if (currentItems[i] != _passedItems[i])
                    {
                        changes = true;
                        break;
                    };
                    i++;
                };
                if (!changes)
                {
                    return;
                };
            };
            _passedItems = currentItems;
            changeToPage(_SafeStr_4780, true);
            updatePaging();
        }

        private function changeToPage(_arg_1:int, _arg_2:Boolean=false):void
        {
            var _local_5:int;
            if (_arg_1 > -1)
            {
                if (((_SafeStr_4780 == _arg_1) && (!(_arg_2))))
                {
                    return;
                };
            }
            else
            {
                _arg_1 = 0;
            };
            _SafeStr_4780 = _arg_1;
            if (_SafeStr_4780 >= pageCount)
            {
                _SafeStr_4780 = (pageCount - 1);
            };
            _SafeStr_4780 = Math.max(_SafeStr_4780, 0);
            _currentPageItems = new Vector.<GroupItem>(0);
            clearGrid();
            var _local_3:int = (_SafeStr_4780 * _SafeStr_6536);
            var _local_4:int = (_local_3 + _SafeStr_6536);
            _local_4 = Math.min(_local_4, _passedItems.length);
            _local_5 = _local_3;
            while (_local_5 < _local_4)
            {
                _SafeStr_5384.addGridItem(_passedItems[_local_5].window);
                _currentPageItems.push(_passedItems[_local_5]);
                _local_5++;
            };
        }

        private function updatePassedItems(_arg_1:GroupItem):void
        {
        }

        private function updatePaging():void
        {
            var _local_4:* = null;
            var _local_3:int;
            var _local_2:* = null;
            if (!_SafeStr_6535)
            {
                return;
            };
            var _local_1:int = pageCount;
            _SafeStr_6535.visible = (_local_1 > 1);
            if (_SafeStr_4780 >= _local_1)
            {
                _SafeStr_4780 = (_local_1 - 1);
            };
            _SafeStr_4780 = Math.max(_SafeStr_4780, 0);
            if (pageCount != _SafeStr_6535.numListItems)
            {
                for each (_local_4 in _SafeStr_6535)
                {
                    _local_4.removeEventListener("WME_CLICK", onPageEventProc);
                };
                _SafeStr_6535.destroyListItems();
                _local_3 = 0;
                while (_local_3 < _local_1)
                {
                    _local_4 = (_SafeStr_6537.clone() as IRegionWindow);
                    _local_4.addEventListener("WME_CLICK", onPageEventProc);
                    _local_4.addEventListener("WME_OVER", onPageEventProc);
                    _local_4.addEventListener("WME_OUT", onPageEventProc);
                    _local_4.id = _local_3;
                    _local_4.name = ("page_" + _local_3);
                    _SafeStr_6535.addListItem(_local_4);
                    _local_3++;
                };
            };
            _local_3 = 0;
            while (_local_3 < _local_1)
            {
                _local_4 = (_SafeStr_6535.getListItemAt(_local_3) as IRegionWindow);
                _local_2 = (_local_4.findChildByTag("PAGE") as ITextWindow);
                _local_2.caption = _local_3.toString();
                if (_local_3 == _SafeStr_4780)
                {
                    _local_2.underline = true;
                    _local_2.textColor = 0xFF0000;
                }
                else
                {
                    _local_2.underline = false;
                    _local_2.textColor = 0;
                };
                _local_3++;
            };
        }

        private function onPageEventProc(_arg_1:WindowMouseEvent):void
        {
            var _local_3:int = _arg_1.window.id;
            var _local_2:ITextWindow = ((_arg_1.target as _SafeStr_3133).findChildByTag("PAGE") as ITextWindow);
            switch (_arg_1.type)
            {
                case "WME_CLICK":
                    changeToPage(_local_3);
                    updatePaging();
                    return;
                case "WME_OVER":
                    _local_2.textColor = 0xFF0000;
                    return;
                case "WME_OUT":
                    if (_local_3 != _SafeStr_4780)
                    {
                        _local_2.textColor = 0;
                    };
                    return;
            };
        }

        private function passFilter(_arg_1:GroupItem):Boolean
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (((!(_showFloorItems)) && (!(_arg_1.isWallItem))))
            {
                return (false);
            };
            if (((!(_showWallItems)) && (_arg_1.isWallItem)))
            {
                return (false);
            };
            if (_showingRentedItems != _arg_1.isRented)
            {
                return (false);
            };
            if (((_SafeStr_6743 == 1) && (_arg_1.flatId == -1)))
            {
                return (false);
            };
            if (((_SafeStr_6743 == 2) && (_arg_1.flatId > -1)))
            {
                return (false);
            };
            if (_SafeStr_5447.length > 0)
            {
                _local_2 = _arg_1.name.toLowerCase();
                _local_3 = _arg_1.description.toLowerCase();
                if (((_local_2.indexOf(_SafeStr_5447) == -1) && (_local_3.indexOf(_SafeStr_5447) == -1)))
                {
                    return (false);
                };
            };
            return (true);
        }


    }
}//package com.sulake.habbo.inventory.furni

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4780 = "_-fK" (String#917, DoABC#4)
// _SafeStr_5384 = "_-Ng" (String#1406, DoABC#4)
// _SafeStr_5447 = "_-62" (String#1087, DoABC#4)
// _SafeStr_6535 = "_-m1l" (String#2878, DoABC#4)
// _SafeStr_6536 = "_-6G" (String#8813, DoABC#4)
// _SafeStr_6537 = "_-y2" (String#9653, DoABC#4)
// _SafeStr_6743 = "_-M16" (String#15187, DoABC#4)


