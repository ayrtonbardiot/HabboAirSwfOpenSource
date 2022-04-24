// by nota

//com.sulake.habbo.window.widgets.SeparatorWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.utils.IIterator;
    import flash.geom.Rectangle;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.geom.Point;
    import com.sulake.core.window._SafeStr_3109;

    public class SeparatorWidget implements ISeparatorWidget 
    {

        public static const TYPE:String = "separator";
        private static const VERTICAL_KEY:String = "separator:vertical";
        private static const VERTICAL_DEFAULT:PropertyStruct = new PropertyStruct("separator:vertical", false, "Boolean");
        private static const BORDER_IMAGE_HORIZONTAL:String = "illumina_light_separator_horizontal";
        private static const BORDER_IMAGE_VERTICAL:String = "illumina_light_separator_vertical";

        private var _disposed:Boolean;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:_SafeStr_3133;
        private var _SafeStr_5234:_SafeStr_3264;
        private var _SafeStr_5675:BitmapData;
        private var _children:_SafeStr_3133;
        private var _SafeStr_5676:Boolean = VERTICAL_DEFAULT.value;

        public function SeparatorWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = (_windowManager.buildFromXML((_windowManager.assets.getAssetByName("separator_xml").content as XML)) as _SafeStr_3133);
            _SafeStr_5234 = (_SafeStr_5428.getChildByName("canvas") as _SafeStr_3264);
            _children = (_SafeStr_5428.getChildByName("children") as _SafeStr_3133);
            _SafeStr_5234.addEventListener("WE_RESIZE", onChange);
            _SafeStr_5234.addEventListener("WE_RESIZED", onChange);
            _children.addEventListener("WE_CHILD_ADDED", onChange);
            _children.addEventListener("WE_CHILD_REMOVED", onChange);
            _children.addEventListener("WE_CHILD_RELOCATED", onChange);
            _children.addEventListener("WE_CHILD_RESIZED", onChange);
            _SafeStr_5427.rootWindow = _SafeStr_5428;
            _SafeStr_5428.width = _SafeStr_5427.width;
            _SafeStr_5428.height = _SafeStr_5427.height;
        }

        private function onChange(_arg_1:_SafeStr_3116):void
        {
            refresh();
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_SafeStr_5675 != null)
                {
                    _SafeStr_5675.dispose();
                    _SafeStr_5675 = null;
                };
                if (_SafeStr_5234 != null)
                {
                    _SafeStr_5234.removeEventListener("WE_RESIZE", onChange);
                    _SafeStr_5234.removeEventListener("WE_RESIZED", onChange);
                    _SafeStr_5234 = null;
                };
                if (_children != null)
                {
                    _children.removeEventListener("WE_CHILD_ADDED", onChange);
                    _children.removeEventListener("WE_CHILD_REMOVED", onChange);
                    _children.removeEventListener("WE_CHILD_RELOCATED", onChange);
                    _children.removeEventListener("WE_CHILD_RESIZED", onChange);
                    _children = null;
                };
                if (_SafeStr_5428 != null)
                {
                    _SafeStr_5428.dispose();
                    _SafeStr_5428 = null;
                };
                if (_SafeStr_5427 != null)
                {
                    _SafeStr_5427.rootWindow = null;
                    _SafeStr_5427 = null;
                };
                _windowManager = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get iterator():IIterator
        {
            return (_children.iterator);
        }

        public function get properties():Array
        {
            var _local_1:Array = [];
            if (_disposed)
            {
                return (_local_1);
            };
            _local_1.push(VERTICAL_DEFAULT.withValue(_SafeStr_5676));
            return (_local_1);
        }

        public function set properties(_arg_1:Array):void
        {
            if (_disposed)
            {
                return;
            };
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "separator:vertical":
                        vertical = _local_2.value;
                };
            };
        }

        public function get vertical():Boolean
        {
            return (_SafeStr_5676);
        }

        public function set vertical(_arg_1:Boolean):void
        {
            _SafeStr_5676 = _arg_1;
            refresh();
        }

        private function refresh():void
        {
            var _local_1:* = null;
            var _local_4:* = null;
            if (_disposed)
            {
                return;
            };
            if ((((_SafeStr_5675 == null) || (!(_SafeStr_5675.width == _SafeStr_5234.width))) || (!(_SafeStr_5675.height == _SafeStr_5234.height))))
            {
                if (_SafeStr_5675 != null)
                {
                    _SafeStr_5675.dispose();
                };
                _SafeStr_5675 = new BitmapData(Math.max(1, _SafeStr_5234.width), Math.max(1, _SafeStr_5234.height), true, 0);
                _SafeStr_5234.bitmap = _SafeStr_5675;
            };
            _SafeStr_5675.lock();
            _SafeStr_5675.fillRect(new Rectangle(0, 0, _SafeStr_5234.width, _SafeStr_5234.height), 0);
            var _local_3:BitmapDataAsset = (_windowManager.assets.getAssetByName(((_SafeStr_5676) ? "illumina_light_separator_vertical" : "illumina_light_separator_horizontal")) as BitmapDataAsset);
            if (_local_3 != null)
            {
                _local_1 = (_local_3.content as BitmapData);
                if (_SafeStr_5676)
                {
                    _local_4 = new Point(((_SafeStr_5234.width / 2) - 1), 0);
                    while (_local_4.y < _SafeStr_5234.height)
                    {
                        _SafeStr_5675.copyPixels(_local_1, _local_3.rectangle, _local_4);
                        _local_4.y = (_local_4.y + _local_3.rectangle.height);
                    };
                }
                else
                {
                    _local_4 = new Point(0, ((_SafeStr_5234.height / 2) - 1));
                    while (_local_4.x < _SafeStr_5234.width)
                    {
                        _SafeStr_5675.copyPixels(_local_1, _local_3.rectangle, _local_4);
                        _local_4.x = (_local_4.x + _local_3.rectangle.width);
                    };
                };
            };
            for each (var _local_2:_SafeStr_3109 in _children.iterator)
            {
                if (_local_2.visible)
                {
                    _SafeStr_5675.fillRect(_local_2.rectangle, 0);
                };
            };
            _SafeStr_5675.unlock();
            _SafeStr_5234.invalidate();
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_5234 = "_-gu" (String#735, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_5675 = "_-3" (String#2348, DoABC#4)
// _SafeStr_5676 = "_-su" (String#2714, DoABC#4)


