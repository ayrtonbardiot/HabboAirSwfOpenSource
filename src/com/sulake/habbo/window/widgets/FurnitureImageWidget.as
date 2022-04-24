// by nota

//com.sulake.habbo.window.widgets.FurnitureImageWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import flash.display.BitmapData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class FurnitureImageWidget implements _SafeStr_3354, _SafeStr_3140 
    {

        public static const TYPE:String = "furniture_image";
        private static const _SafeStr_9176:String = "furniture_image:furnitureType";
        private static const SCALE_KEY:String = "furniture_image:scale";
        private static const _SafeStr_9171:String = "furniture_image:direction";
        private static const _SafeStr_6182:Array = ["northeast", "east", "southeast", "south", "southwest", "west", "northwest", "north"];
        private static const SCALES:Array = [32, 64];
        private static const FURNITURE_TYPE_DEFAULT:PropertyStruct = new PropertyStruct("furniture_image:furnitureType", "table_plasto_square", "String", false);
        private static const SCALE_DEFAULT:PropertyStruct = new PropertyStruct("furniture_image:scale", 64, "int", false, SCALES);
        private static const DIRECTION_DEFAULT:PropertyStruct = new PropertyStruct("furniture_image:direction", _SafeStr_6182[2], "String", false, _SafeStr_6182);
        private static const ITEM_TYPE_FLOOR:int = 0;
        private static const ITEM_TYPE_WALL:int = 1;

        private var _disposed:Boolean;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:_SafeStr_3133;
        private var _bitmap:_SafeStr_3264;
        private var _region:IRegionWindow;
        private var _SafeStr_6183:String = "table_plasto_square";
        private var _SafeStr_4045:int = SCALE_DEFAULT.value;
        private var _direction:int = _SafeStr_6182.indexOf(DIRECTION_DEFAULT.value);
        private var _SafeStr_5989:_SafeStr_24;
        private var _SafeStr_4268:String;
        private var _SafeStr_4110:int = 0;
        private var _SafeStr_4601:IStuffData = null;

        public function FurnitureImageWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5989 = new _SafeStr_24();
            _SafeStr_5428 = (_windowManager.buildFromXML((_windowManager.assets.getAssetByName("furniture_image_xml").content as XML)) as _SafeStr_3133);
            _bitmap = (_SafeStr_5428.findChildByName("bitmap") as _SafeStr_3264);
            _region = (_SafeStr_5428.findChildByName("region") as IRegionWindow);
            _region.addEventListener("WME_CLICK", onClick);
            refresh();
            _SafeStr_5427.rootWindow = _SafeStr_5428;
            _SafeStr_5428.width = _SafeStr_5427.width;
            _SafeStr_5428.height = _SafeStr_5427.height;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_region != null)
                {
                    _region.removeEventListener("WME_CLICK", onClick);
                    _region.dispose();
                    _region = null;
                };
                _bitmap = null;
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
            _local_1.push(FURNITURE_TYPE_DEFAULT.withValue(_SafeStr_6183));
            _local_1.push(SCALE_DEFAULT.withValue(_SafeStr_4045));
            _local_1.push(DIRECTION_DEFAULT.withValue(_SafeStr_6182[_direction]));
            return (_local_1);
        }

        public function set properties(_arg_1:Array):void
        {
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "furniture_image:furnitureType":
                        furnitureType = _local_2.value;
                        break;
                    case "furniture_image:scale":
                        scale = _local_2.value;
                        break;
                    case "furniture_image:direction":
                        direction = _SafeStr_6182.indexOf(_local_2.value);
                };
            };
        }

        public function get furnitureType():String
        {
            return (_SafeStr_6183);
        }

        public function set furnitureType(_arg_1:String):void
        {
            _SafeStr_6183 = _arg_1;
            refresh();
        }

        public function get scale():int
        {
            return (_SafeStr_4045);
        }

        public function set scale(_arg_1:int):void
        {
            _SafeStr_4045 = _arg_1;
            refresh();
        }

        public function get direction():int
        {
            return (_direction);
        }

        public function set direction(_arg_1:int):void
        {
            _direction = _arg_1;
            refresh();
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            var _local_3:String = _SafeStr_5989.getValue(_arg_1);
            if (_local_3 == _SafeStr_6183)
            {
                refresh();
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        private function refresh():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            var _local_5:int;
            var _local_4:int;
            var _local_3:* = null;
            _bitmap.bitmap = null;
            if (_windowManager.roomEngine != null)
            {
                _local_2 = "std";
                _local_5 = _windowManager.roomEngine.getFurnitureTypeId(_SafeStr_6183);
                if (_SafeStr_4110 == 0)
                {
                    _local_1 = _windowManager.roomEngine.getFurnitureImage(_local_5, new Vector3d((_direction * 45), 0, 0), _SafeStr_4045, this, 0, _SafeStr_4268, -1, -1, _SafeStr_4601);
                }
                else
                {
                    _local_1 = _windowManager.roomEngine.getWallItemImage(_local_5, new Vector3d((_direction * 45), 0, 0), _SafeStr_4045, this, 0, ((_SafeStr_4601) ? _SafeStr_4601.getLegacyString() : ""));
                };
                if (_local_1 != null)
                {
                    _local_4 = _local_1.id;
                    _SafeStr_5989.remove(_local_4);
                    if (_local_4 > 0)
                    {
                        _SafeStr_5989.add(_local_4, _SafeStr_6183);
                    };
                    _bitmap.bitmap = _local_1.data;
                    _bitmap.disposesBitmap = true;
                };
            };
            if (((_bitmap.bitmap == null) || (_bitmap.bitmap.width < 2)))
            {
                _local_3 = (("placeholder_furni" + ((_SafeStr_4045 == 32) ? "_small" : "")) + "_png");
                _bitmap.bitmap = (_windowManager.assets.getAssetByName(_local_3).content as BitmapData);
                _bitmap.disposesBitmap = false;
            };
            _bitmap.invalidate();
            _SafeStr_5427.width = _bitmap.bitmap.width;
            _SafeStr_5427.height = _bitmap.bitmap.height;
        }

        private function onClick(_arg_1:WindowMouseEvent):void
        {
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3354 = "_-Y15" (String#16477, DoABC#4)
// _SafeStr_4045 = "_-22r" (String#725, DoABC#4)
// _SafeStr_4110 = "_-BF" (String#2380, DoABC#4)
// _SafeStr_4268 = "_-8L" (String#3669, DoABC#4)
// _SafeStr_4601 = "_-o1B" (String#1746, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_5989 = "_-o1c" (String#2112, DoABC#4)
// _SafeStr_6182 = "_-qF" (String#3305, DoABC#4)
// _SafeStr_6183 = "_-AL" (String#9308, DoABC#4)
// _SafeStr_9171 = "_-VE" (String#24594, DoABC#4)
// _SafeStr_9176 = "_-i2" (String#32329, DoABC#4)


