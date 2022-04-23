// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.groups.ColorGridCtrl

package com.sulake.habbo.groups
{
    import com.sulake.core.window._SafeStr_3133;
    import __AS3__.vec.Vector;
    import _-W1K._SafeStr_1581;
    import com.sulake.core.window.components.IItemGridWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.ColorTransform;
    import com.sulake.core.assets.BitmapDataAsset;
    import com.sulake.core.runtime.exceptions.Exception;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events._SafeStr_3116;

    public class ColorGridCtrl 
    {

        private var _SafeStr_4144:HabboGroupsManager;
        private var _SafeStr_5625:_SafeStr_3133;
        private var _parentCallback:Function;
        private var _SafeStr_6303:Vector.<_SafeStr_1581>;
        private var _SafeStr_5979:IItemGridWindow;
        private var _SafeStr_5977:int = -1;
        private var _SafeStr_6306:BitmapData;
        private var _SafeStr_6304:BitmapData;
        private var _SafeStr_6305:BitmapData;
        private var _disposed:Boolean = false;

        public function ColorGridCtrl(_arg_1:HabboGroupsManager, _arg_2:Function)
        {
            _SafeStr_4144 = _arg_1;
            _parentCallback = _arg_2;
        }

        public function get selectedColorIndex():int
        {
            return (_SafeStr_5977);
        }

        public function get isInitialized():Boolean
        {
            return ((!(_SafeStr_6303 == null)) && (!(_SafeStr_5979 == null)));
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_SafeStr_5979)
                {
                    _SafeStr_5979.destroyGridItems();
                    _SafeStr_5979 = null;
                };
                if (_SafeStr_6304)
                {
                    _SafeStr_6304.dispose();
                    _SafeStr_6304 = null;
                };
                if (_SafeStr_6305)
                {
                    _SafeStr_6305.dispose();
                    _SafeStr_6305 = null;
                };
                if (_SafeStr_6304)
                {
                    _SafeStr_6304.dispose();
                    _SafeStr_6304 = null;
                };
                if (_SafeStr_6306)
                {
                    _SafeStr_6306.dispose();
                    _SafeStr_6306 = null;
                };
                _SafeStr_4144 = null;
                _SafeStr_5625 = null;
                _disposed = true;
            };
        }

        public function createAndAttach(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:Vector.<_SafeStr_1581>):void
        {
            var _local_4:* = null;
            if (((((!(_SafeStr_5979 == null)) || (_arg_1 == null)) || (_arg_2 == null)) || (_arg_3 == null)))
            {
                return;
            };
            _SafeStr_5625 = _arg_1;
            _SafeStr_6303 = _arg_3;
            _SafeStr_5979 = (_SafeStr_5625.findChildByName(_arg_2) as IItemGridWindow);
            _SafeStr_6304 = getBitmap("color_chooser_bg");
            _SafeStr_6305 = getBitmap("color_chooser_fg");
            _SafeStr_6306 = getBitmap("color_chooser_selected");
            for each (var _local_5:_SafeStr_1581 in _SafeStr_6303)
            {
                _local_4 = (_SafeStr_4144.getXmlWindow("badge_color_item") as _SafeStr_3133);
                _local_4.procedure = onClick;
                _local_4.background = true;
                _local_4.color = 4290689957;
                _local_4.width = _SafeStr_6304.width;
                _local_4.height = _SafeStr_6304.height;
                setGridItemBitmap(_local_4, "background", _SafeStr_6304, true, null);
                setGridItemBitmap(_local_4, "foreground", _SafeStr_6305, true, _local_5);
                setGridItemBitmap(_local_4, "selected", _SafeStr_6306, false, null);
                _SafeStr_5979.addGridItem(_local_4);
            };
        }

        private function setGridItemBitmap(_arg_1:_SafeStr_3133, _arg_2:String, _arg_3:BitmapData, _arg_4:Boolean, _arg_5:_SafeStr_1581=null):void
        {
            var _local_7:* = null;
            var _local_6:_SafeStr_3264 = (_arg_1.findChildByName(_arg_2) as _SafeStr_3264);
            if (_local_6 != null)
            {
                _local_7 = _arg_3.clone();
                if (_arg_5 != null)
                {
                    _local_7.colorTransform(_local_7.rect, new ColorTransform((_arg_5.red / 0xFF), (_arg_5.green / 0xFF), (_arg_5.blue / 0xFF)));
                };
                _local_6.bitmap = _local_7;
                _local_6.visible = _arg_4;
            };
        }

        public function setSelectedColorIndex(_arg_1:int, _arg_2:Boolean=true):void
        {
            if (_arg_1 < 0)
            {
                _arg_1 = 0;
            };
            if (((!(_SafeStr_5977 == _arg_1)) && (_arg_1 < _SafeStr_5979.numGridItems)))
            {
                setSelectedItemVisibility(_SafeStr_5977, false);
                _SafeStr_5977 = _arg_1;
                setSelectedItemVisibility(_SafeStr_5977, true);
            };
            if (((_arg_2) && (!(_parentCallback == null))))
            {
                (_parentCallback(this));
            };
        }

        public function setSelectedColorById(_arg_1:int):void
        {
            var _local_2:int;
            if (!isInitialized)
            {
                return;
            };
            _local_2 = 0;
            while (_local_2 < _SafeStr_6303.length)
            {
                if (_SafeStr_6303[_local_2].id == _arg_1)
                {
                    setSelectedColorIndex(_local_2);
                    return;
                };
                _local_2++;
            };
            setSelectedColorIndex(0);
        }

        public function getSelectedColorId():int
        {
            var _local_1:_SafeStr_1581 = getSelectedColorData();
            if (_local_1 != null)
            {
                return (_local_1.id);
            };
            return (0);
        }

        public function getSelectedColorData():_SafeStr_1581
        {
            if ((((!(_SafeStr_6303 == null)) && (_SafeStr_5977 >= 0)) && (_SafeStr_5977 < _SafeStr_6303.length)))
            {
                return (_SafeStr_6303[_SafeStr_5977]);
            };
            return (null);
        }

        private function getBitmap(_arg_1:String):BitmapData
        {
            var _local_3:* = null;
            var _local_2:BitmapDataAsset = (_SafeStr_4144.assets.getAssetByName(_arg_1) as BitmapDataAsset);
            if (_local_2)
            {
                _local_3 = (_local_2.content as BitmapData);
                if (_local_3 != null)
                {
                    return (_local_3);
                };
            };
            throw (new Exception((("Failed to load bitmap asset " + _arg_1) + " in ColorGridWidget")));
        }

        private function setSelectedItemVisibility(_arg_1:int, _arg_2:Boolean):void
        {
            var _local_3:* = null;
            if (((_arg_1 < 0) || (_arg_1 >= _SafeStr_5979.numGridItems)))
            {
                return;
            };
            var _local_4:_SafeStr_3133 = (_SafeStr_5979.getGridItemAt(_arg_1) as _SafeStr_3133);
            if (_local_4 != null)
            {
                _local_3 = (_local_4.findChildByName("selected") as _SafeStr_3109);
                if (_local_3 != null)
                {
                    _local_3.visible = _arg_2;
                };
            };
        }

        private function onClick(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            setSelectedColorIndex(_SafeStr_5979.getGridItemIndex(_arg_2));
        }


    }
}//package com.sulake.habbo.groups

// _SafeStr_1581 = "_-A1O" (String#5922, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4144 = "_-n1T" (String#228, DoABC#4)
// _SafeStr_5625 = "_-sM" (String#6957, DoABC#4)
// _SafeStr_5977 = "_-zj" (String#2847, DoABC#4)
// _SafeStr_5979 = "_-l1b" (String#3183, DoABC#4)
// _SafeStr_6303 = "_-A2" (String#7172, DoABC#4)
// _SafeStr_6304 = "_-r17" (String#5181, DoABC#4)
// _SafeStr_6305 = "_-B15" (String#8818, DoABC#4)
// _SafeStr_6306 = "_-K1b" (String#9265, DoABC#4)


