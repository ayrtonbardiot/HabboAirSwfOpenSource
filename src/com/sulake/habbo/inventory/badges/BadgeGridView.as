// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.inventory.badges.BadgeGridView

package com.sulake.habbo.inventory.badges
{
    import com.sulake.core.window.components.IItemGridWindow;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class BadgeGridView 
    {

        private var _SafeStr_3882:BadgesView;
        private var _SafeStr_5384:IItemGridWindow;
        private var _items:Vector.<Badge>;
        private var _passedItems:Vector.<Badge>;
        private var _SafeStr_6535:IItemListWindow;
        private var _SafeStr_6537:IRegionWindow;
        private var _SafeStr_6536:int = 200;
        private var _SafeStr_4780:int = -1;
        private var _currentPageItems:Vector.<Badge>;
        private var _SafeStr_5447:String = "";

        public function BadgeGridView(_arg_1:BadgesView, _arg_2:IItemGridWindow, _arg_3:IItemListWindow)
        {
            _SafeStr_3882 = _arg_1;
            _SafeStr_5384 = _arg_2;
            _SafeStr_5384.shouldRebuildGridOnResize = false;
            _items = new Vector.<Badge>(0);
            _passedItems = new Vector.<Badge>(0);
            _SafeStr_6535 = _arg_3;
            if (_SafeStr_6535)
            {
                _SafeStr_6537 = (_SafeStr_6535.removeListItemAt(0) as IRegionWindow);
            };
        }

        public function get visibleCount():int
        {
            return (_SafeStr_5384.numGridItems);
        }

        public function get currentPageItems():Vector.<Badge>
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

        public function setFilter(_arg_1:int, _arg_2:String, _arg_3:String):void
        {
            _SafeStr_5447 = ((_arg_3 == null) ? "" : _arg_3.toLowerCase());
            update();
        }

        public function itemWasUpdated(_arg_1:Badge):void
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

        public function setItems(_arg_1:Vector.<Badge>):void
        {
            _items = _arg_1;
            update();
        }

        private function update():void
        {
            var _local_2:* = null;
            var _local_3:Boolean;
            var _local_4:int;
            var _local_1:Vector.<Badge> = new Vector.<Badge>(0);
            for each (_local_2 in _items)
            {
                if (passFilter(_local_2))
                {
                    _local_1.push(_local_2);
                };
            };
            if (_local_1.length == _passedItems.length)
            {
                _local_3 = false;
                _local_4 = 0;
                while (_local_4 < _local_1.length)
                {
                    if (_local_1[_local_4] != _passedItems[_local_4])
                    {
                        _local_3 = true;
                        break;
                    };
                    _local_4++;
                };
                if (!_local_3)
                {
                    return;
                };
            };
            _passedItems = _local_1;
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
            _currentPageItems = new Vector.<Badge>(0);
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

        private function updatePassedItems(_arg_1:Badge):void
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

        private function passFilter(_arg_1:Badge):Boolean
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if ((((_arg_1 == null) || (_arg_1.badgeName == null)) || (_arg_1.badgeDescription == null)))
            {
                return (false);
            };
            if (_SafeStr_5447.length > 0)
            {
                _local_2 = _arg_1.badgeName.toLowerCase();
                _local_3 = _arg_1.badgeDescription.toLowerCase();
                if (((_local_2.indexOf(_SafeStr_5447) == -1) && (_local_3.indexOf(_SafeStr_5447) == -1)))
                {
                    return (false);
                };
            };
            return (true);
        }


    }
}//package com.sulake.habbo.inventory.badges

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_4780 = "_-fK" (String#917, DoABC#4)
// _SafeStr_5384 = "_-Ng" (String#1406, DoABC#4)
// _SafeStr_5447 = "_-62" (String#1087, DoABC#4)
// _SafeStr_6535 = "_-m1l" (String#2878, DoABC#4)
// _SafeStr_6536 = "_-6G" (String#8813, DoABC#4)
// _SafeStr_6537 = "_-y2" (String#9653, DoABC#4)


