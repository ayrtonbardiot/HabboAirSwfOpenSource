// by nota

//com.sulake.habbo.window.widgets.ProgressIndicatorWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.habbo.window.enum._SafeStr_3476;
    import com.sulake.habbo.window.enum._SafeStr_3420;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.utils._SafeStr_3250;

    public class ProgressIndicatorWidget implements _SafeStr_3275 
    {

        public static const TYPE:String = "progress_indicator";
        private static const STYLE_KEY:String = "progress_indicator:style";
        private static const SIZE_KEY:String = "progress_indicator:size";
        private static const _SafeStr_9182:String = "progress_indicator:position";
        private static const MODE_KEY:String = "progress_indicator:mode";
        private static const STYLE_DEFAULT:PropertyStruct = new PropertyStruct("progress_indicator:style", "flat", "String", false, _SafeStr_3476.ALL);
        private static const SIZE_DEFAULT:PropertyStruct = new PropertyStruct("progress_indicator:size", 1, "uint");
        private static const POSITION_DEFAULT:PropertyStruct = new PropertyStruct("progress_indicator:position", 0, "uint");
        private static const MODE_DEFAULT:PropertyStruct = new PropertyStruct("progress_indicator:mode", "position", "String", false, _SafeStr_3420.ALL);
        private static const MAXIMUM_SIZE:uint = 1000;

        private var _disposed:Boolean;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:IItemListWindow;
        private var _position:uint = POSITION_DEFAULT.value;
        private var _style:String = STYLE_DEFAULT.value;
        private var _SafeStr_3771:String = MODE_DEFAULT.value;

        public function ProgressIndicatorWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = (_windowManager.buildFromXML((_windowManager.assets.getAssetByName("progress_indicator_xml").content as XML)) as IItemListWindow);
            _SafeStr_5427.setParamFlag(147456);
            _SafeStr_5427.rootWindow = _SafeStr_5428;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
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
            return (EmptyIterator.INSTANCE);
        }

        public function get properties():Array
        {
            var _local_1:Array = [];
            if (_disposed)
            {
                return (_local_1);
            };
            _local_1.push(STYLE_DEFAULT.withValue(_style));
            _local_1.push(SIZE_DEFAULT.withValue(size));
            _local_1.push(POSITION_DEFAULT.withValue(_position));
            _local_1.push(MODE_DEFAULT.withValue(_SafeStr_3771));
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
                    case "progress_indicator:style":
                        style = _local_2.value;
                        break;
                    case "progress_indicator:size":
                        size = _local_2.value;
                        break;
                    case "progress_indicator:position":
                        position = _local_2.value;
                        break;
                    case "progress_indicator:mode":
                        mode = _local_2.value;
                };
            };
        }

        public function get style():String
        {
            return (_style);
        }

        public function set style(_arg_1:String):void
        {
            _style = _arg_1;
            refresh();
        }

        public function get size():uint
        {
            return (_SafeStr_5428.numListItems);
        }

        public function set size(_arg_1:uint):void
        {
            _arg_1 = Math.min(Math.max(_arg_1, 1), 1000);
            if (_arg_1 != size)
            {
                while (_arg_1 < size)
                {
                    _SafeStr_5428.removeListItemAt((size - 1));
                };
                while (_arg_1 > size)
                {
                    _SafeStr_5428.addListItem(_SafeStr_5428.getListItemAt(0).clone());
                };
                refresh();
            };
        }

        public function get position():uint
        {
            return (_position);
        }

        public function set position(_arg_1:uint):void
        {
            _position = _arg_1;
            refresh();
        }

        public function get mode():String
        {
            return (_SafeStr_3771);
        }

        public function set mode(_arg_1:String):void
        {
            _SafeStr_3771 = _arg_1;
            refresh();
        }

        private function refresh():void
        {
            var _local_3:int;
            var _local_4:* = null;
            var _local_2:Boolean;
            var _local_1:* = null;
            _local_3 = 0;
            while (_local_3 < size)
            {
                _local_4 = (_SafeStr_5428.getListItemAt(_local_3) as IStaticBitmapWrapperWindow);
                switch (_SafeStr_3771)
                {
                    case "position":
                        _local_2 = ((_local_3 + 1) == position);
                        break;
                    case "progress":
                        _local_2 = (_local_3 < position);
                };
                _local_4.assetUri = (("progress_disk_" + _style) + ((_local_2) ? "_on" : "_off"));
                _local_1 = _SafeStr_3250(_local_4).bitmapData;
                _local_4.width = _local_1.width;
                _local_4.height = _local_1.height;
                _SafeStr_5428.height = _local_1.height;
                _local_3++;
            };
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3250 = "_-J1u" (String#3192, DoABC#4)
// _SafeStr_3275 = "_-2J" (String#8317, DoABC#4)
// _SafeStr_3420 = "_-v1g" (String#20438, DoABC#4)
// _SafeStr_3476 = "_-F1y" (String#18615, DoABC#4)
// _SafeStr_3771 = "_-9Y" (String#962, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_9182 = "_-e1G" (String#36993, DoABC#4)


