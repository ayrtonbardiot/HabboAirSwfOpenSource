﻿// by nota

//com.sulake.habbo.inventory.common.ThumbListManager

package com.sulake.habbo.inventory.common
{
    import flash.display.BitmapData;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import com.sulake.habbo.inventory.IThumbListDrawableItem;

    public class ThumbListManager 
    {

        private var _SafeStr_6772:IThumbListDataProvider;
        private var _SafeStr_6769:int;
        private var _SafeStr_6768:int = 1;
        private var _SafeStr_6771:BitmapData;
        private var _SafeStr_8629:int;
        private var _listItemWidth:int;
        private var _viewWidth:int;
        private var _SafeStr_6767:int;
        private var _thumbWidth:int;
        private var _SafeStr_6770:int;
        private var _SafeStr_6766:BitmapData;
        private var _SafeStr_6773:BitmapData;

        public function ThumbListManager(_arg_1:IAssetLibrary, _arg_2:IThumbListDataProvider, _arg_3:String, _arg_4:String, _arg_5:int, _arg_6:int)
        {
            _SafeStr_6772 = _arg_2;
            var _local_7:BitmapDataAsset = BitmapDataAsset(_arg_1.getAssetByName(_arg_3));
            if (_local_7 != null)
            {
                _SafeStr_6766 = BitmapData(_local_7.content);
            };
            var _local_8:BitmapDataAsset = BitmapDataAsset(_arg_1.getAssetByName(_arg_4));
            if (_local_8 != null)
            {
                _SafeStr_6773 = BitmapData(_local_8.content);
            };
            _thumbWidth = _SafeStr_6766.width;
            _SafeStr_6770 = _SafeStr_6766.height;
            _viewWidth = _arg_5;
            _SafeStr_6767 = _arg_6;
            _SafeStr_6769 = Math.floor((_viewWidth / _thumbWidth));
            _SafeStr_6771 = new BitmapData(_viewWidth, _SafeStr_6767);
        }

        public function dispose():void
        {
            _SafeStr_6772 = null;
            _SafeStr_6771 = null;
        }

        public function updateImageFromList():void
        {
            var _local_5:int;
            var _local_3:int;
            var _local_1:* = null;
            var _local_2:* = null;
            _SafeStr_6768 = resolveRowCountFromList();
            if (_SafeStr_6768 == 0)
            {
                _SafeStr_6771 = new BitmapData(_viewWidth, _SafeStr_6767);
                return;
            };
            _SafeStr_6771 = new BitmapData(Math.max((_SafeStr_6769 * _thumbWidth), _viewWidth), Math.max((_SafeStr_6768 * _SafeStr_6770), _SafeStr_6767), true, 0xFFFFFF);
            _SafeStr_6771.fillRect(_SafeStr_6771.rect, 0xFFFFFFFF);
            var _local_6:int;
            var _local_4:Array = getList();
            _local_5 = 0;
            while (_local_5 < _SafeStr_6768)
            {
                _local_3 = 0;
                while (_local_3 < _SafeStr_6769)
                {
                    if (_local_6 < _local_4.length)
                    {
                        _local_1 = _local_4[_local_6];
                        if (_local_1 != null)
                        {
                            _local_2 = createThumbImage(_local_1.iconImage, _local_1.isSelected);
                            _SafeStr_6771.copyPixels(_local_2, _local_2.rect, new Point((_local_3 * _thumbWidth), (_local_5 * _SafeStr_6770)), null, null, true);
                        };
                        _local_6++;
                    };
                    _local_3++;
                };
                _local_5++;
            };
        }

        public function addItemAsFirst(_arg_1:IThumbListDrawableItem):void
        {
            var _local_2:* = null;
            var _local_4:* = null;
            if (_arg_1 == null)
            {
                return;
            };
            var _local_5:Point = resolveLastItemGridLoc();
            if (((_local_5.x == _SafeStr_6769) && (_SafeStr_6771.height < (_local_5.y * _SafeStr_6770))))
            {
                _local_2 = new BitmapData(_SafeStr_6771.width, (_SafeStr_6771.height + _SafeStr_6770));
            }
            else
            {
                _local_2 = new BitmapData(_SafeStr_6771.width, _SafeStr_6771.height);
            };
            var _local_3:BitmapData = createThumbImage(_arg_1.iconImage, _arg_1.isSelected);
            _local_2.copyPixels(_local_3, _local_3.rect, new Point(0, 0), null, null, true);
            _local_4 = new Rectangle(0, 0, (_thumbWidth * (_SafeStr_6769 - 1)), _SafeStr_6770);
            _local_2.copyPixels(_SafeStr_6771, _local_4, new Point(_thumbWidth, 0), null, null, true);
            _local_4 = new Rectangle((_thumbWidth * (_SafeStr_6769 - 1)), 0, _thumbWidth, _SafeStr_6771.height);
            _local_2.copyPixels(_SafeStr_6771, _local_4, new Point(0, _SafeStr_6770), null, null, true);
            _local_4 = new Rectangle(0, _SafeStr_6770, (_thumbWidth * (_SafeStr_6769 - 1)), (_SafeStr_6771.height - _SafeStr_6770));
            _local_2.copyPixels(_SafeStr_6771, _local_4, new Point(_thumbWidth, _SafeStr_6770), null, null, true);
            _SafeStr_6771 = _local_2;
        }

        public function replaceItemImage(_arg_1:int, _arg_2:IThumbListDrawableItem):void
        {
            if (_arg_2 == null)
            {
                return;
            };
            var _local_4:Point = resolveGridLocationFromIndex(_arg_1);
            var _local_5:Point = new Point((_local_4.x * _thumbWidth), (_local_4.y * _SafeStr_6770));
            var _local_3:BitmapData = createThumbImage(_arg_2.iconImage, _arg_2.isSelected);
            _SafeStr_6771.copyPixels(_local_3, _local_3.rect, _local_5, null, null, true);
        }

        public function getListImage():BitmapData
        {
            return (_SafeStr_6771);
        }

        public function removeItemInIndex(_arg_1:int):void
        {
            var _local_2:Point = resolveGridLocationFromIndex(_arg_1);
            removeItemInImage(_local_2);
        }

        public function removeItemInLocation(_arg_1:Point):void
        {
            var _local_2:Point = resolveGridLocationFromImage(_arg_1);
            removeItemInImage(_local_2);
        }

        public function updateListItem(_arg_1:int):void
        {
            var _local_2:IThumbListDrawableItem = getDrawableItem(_arg_1);
            replaceItemImage(_arg_1, _local_2);
        }

        private function getList():Array
        {
            var _local_1:* = null;
            if (_SafeStr_6772 != null)
            {
                _local_1 = _SafeStr_6772.getDrawableList();
            };
            return ((_local_1) ? _local_1 : []);
        }

        private function getDrawableItem(_arg_1:int):IThumbListDrawableItem
        {
            var _local_2:Array = getList();
            if (((_arg_1 >= 0) && (_arg_1 < _local_2.length)))
            {
                return (_local_2[_arg_1] as IThumbListDrawableItem);
            };
            return (null);
        }

        private function resolveRowCountFromList():int
        {
            var _local_1:Array = getList();
            return (int(Math.ceil((_local_1.length / _SafeStr_6769))));
        }

        private function resolveLastItemGridLoc():Point
        {
            var _local_2:Array = getList();
            return (resolveGridLocationFromIndex((_local_2.length - 1)));
        }

        public function resolveIndexFromImageLocation(_arg_1:Point):int
        {
            var _local_3:Point = resolveGridLocationFromImage(_arg_1);
            return ((_local_3.y * _SafeStr_6769) + _local_3.x);
        }

        private function resolveGridLocationFromImage(_arg_1:Point):Point
        {
            var _local_2:int = int(Math.floor((_arg_1.y / _SafeStr_6770)));
            var _local_3:int = int(Math.floor((_arg_1.x / _thumbWidth)));
            return (new Point(_local_3, _local_2));
        }

        private function resolveGridLocationFromIndex(_arg_1:int):Point
        {
            var _local_2:int = int(Math.floor((_arg_1 / _SafeStr_6769)));
            var _local_3:int = (_arg_1 % _SafeStr_6769);
            return (new Point(_local_3, _local_2));
        }

        private function removeItemInImage(_arg_1:Point):void
        {
            var _local_7:* = null;
            var _local_3:* = null;
            var _local_6:int;
            var _local_8:int;
            var _local_2:* = null;
            var _local_9:* = null;
            var _local_5:* = null;
            var _local_12:* = null;
            if (_arg_1.x >= _SafeStr_6769)
            {
                return;
            };
            if (_arg_1.y >= _SafeStr_6768)
            {
                return;
            };
            var _local_11:int = ((_SafeStr_6769 - _arg_1.x) - 1);
            _local_7 = new Rectangle(((_arg_1.x + 1) * _thumbWidth), (_arg_1.y * _SafeStr_6770), (_local_11 * _thumbWidth), _SafeStr_6770);
            _local_3 = new Point((_arg_1.x * _thumbWidth), (_arg_1.y * _SafeStr_6770));
            var _local_4:BitmapData = new BitmapData((_local_7.width + _thumbWidth), _local_7.height);
            _local_4.fillRect(_local_4.rect, 0xFFFFFFFF);
            _local_4.copyPixels(_SafeStr_6771, _local_7, new Point(0, 0), null, null, true);
            _SafeStr_6771.copyPixels(_local_4, _local_4.rect, _local_3, null, null, true);
            if (_arg_1.y < (_SafeStr_6768 - 1))
            {
                _local_6 = (_SafeStr_6771.width - _thumbWidth);
                _local_8 = (_SafeStr_6771.height - ((_arg_1.y + 1) * _SafeStr_6770));
                _local_2 = new BitmapData(_local_6, _local_8);
                _local_7 = new Rectangle(_thumbWidth, ((_arg_1.y + 1) * _SafeStr_6770), _local_2.width, _local_2.height);
                _local_2.copyPixels(_SafeStr_6771, _local_7, new Point(0, 0), null, null, true);
                _local_9 = new BitmapData(_thumbWidth, _local_7.height);
                _local_7.x = 0;
                _local_7.width = _thumbWidth;
                _local_9.copyPixels(_SafeStr_6771, _local_7, new Point(0, 0), null, null, true);
                _SafeStr_6771.fillRect(new Rectangle(0, (_SafeStr_6771.height - _SafeStr_6770), _SafeStr_6771.width, _SafeStr_6770), 0xFFFFFFFF);
                _local_3 = new Point((_SafeStr_6771.width - _thumbWidth), (_local_7.y - _SafeStr_6770));
                _SafeStr_6771.copyPixels(_local_9, _local_9.rect, _local_3, null, null, true);
                _local_3 = new Point(0, _local_7.y);
                _SafeStr_6771.copyPixels(_local_2, _local_2.rect, _local_3, null, null, true);
            };
            var _local_10:int = (getList().length - 1);
            if (_local_10 > 0)
            {
                _arg_1 = resolveGridLocationFromIndex(_local_10);
                if (_arg_1.x == (_SafeStr_6769 - 1))
                {
                    _local_5 = new BitmapData(_SafeStr_6771.width, (_SafeStr_6771.height - _SafeStr_6770));
                    _local_7 = new Rectangle(0, 0, _SafeStr_6771.width, (_SafeStr_6771.height - _SafeStr_6770));
                    _local_5.copyPixels(_SafeStr_6771, _local_7, new Point(0, 0), null, null, true);
                    _SafeStr_6771 = _local_5;
                    _SafeStr_6768--;
                };
            };
            if (_SafeStr_6771.height < _SafeStr_6767)
            {
                _local_12 = new BitmapData(_SafeStr_6771.width, _SafeStr_6767);
                _local_12.fillRect(_local_12.rect, 0xFFFFFFFF);
                _local_12.copyPixels(_SafeStr_6771, _SafeStr_6771.rect, new Point(0, 0), null, null, true);
                _SafeStr_6771 = _local_12;
            };
        }

        private function createThumbImage(_arg_1:BitmapData=null, _arg_2:Boolean=false):BitmapData
        {
            var _local_3:* = null;
            var _local_4:BitmapData = new BitmapData(_SafeStr_6766.width, _SafeStr_6766.height);
            if (_arg_2)
            {
                _local_4.copyPixels(_SafeStr_6773, _SafeStr_6766.rect, new Point(0, 0), null, null, false);
            }
            else
            {
                _local_4.copyPixels(_SafeStr_6766, _SafeStr_6766.rect, new Point(0, 0), null, null, false);
            };
            if (_arg_1 != null)
            {
                _local_3 = new Point(((_local_4.width - _arg_1.width) / 2), ((_local_4.height - _arg_1.height) / 2));
                _local_4.copyPixels(_arg_1, _arg_1.rect, _local_3, null, null, true);
            };
            return (_local_4);
        }


    }
}//package com.sulake.habbo.inventory.common

// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_6766 = "_-yj" (String#7617, DoABC#4)
// _SafeStr_6767 = "_-12M" (String#10159, DoABC#4)
// _SafeStr_6768 = "_-u1z" (String#6638, DoABC#4)
// _SafeStr_6769 = "_-A1j" (String#4802, DoABC#4)
// _SafeStr_6770 = "_-22L" (String#3379, DoABC#4)
// _SafeStr_6771 = "_-M1B" (String#1794, DoABC#4)
// _SafeStr_6772 = "_-zk" (String#11307, DoABC#4)
// _SafeStr_6773 = "_-K1B" (String#22490, DoABC#4)
// _SafeStr_8629 = "_-L1f" (String#39181, DoABC#4)


