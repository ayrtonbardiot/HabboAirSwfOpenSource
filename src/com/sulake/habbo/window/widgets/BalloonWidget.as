// by nota

//com.sulake.habbo.window.widgets.BalloonWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.habbo.window.enum._SafeStr_3472;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.events._SafeStr_3116;
    import flash.geom.Rectangle;
    import com.sulake.habbo.utils._SafeStr_401;

    public class BalloonWidget implements _SafeStr_3325 
    {

        public static const TYPE:String = "balloon";
        private static const ARROW_PIVOT_KEY:String = "balloon:arrow_pivot";
        private static const ARROW_DISPLACEMENT_KEY:String = "balloon:arrow_displacement";
        private static const ARROW_PIVOT_DEFAULT:PropertyStruct = new PropertyStruct("balloon:arrow_pivot", "up, center", "String", false, _SafeStr_3472.ALL);
        private static const ARROW_DISPLACEMENT_DEFAULT:PropertyStruct = new PropertyStruct("balloon:arrow_displacement", 0, "int");
        private static const ARROW_ASSET_PREFIX:String = "illumina_light_balloon_arrow_";
        private static const ARROW_FREE_PADDING:int = 6;
        private static const ARROW_LENGTH:int = 6;
        private static const ARROW_WIDTH:int = 9;

        private var _disposed:Boolean;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5890:Boolean = false;
        private var _SafeStr_5891:Boolean = false;
        private var _SafeStr_5428:_SafeStr_3133;
        private var _SafeStr_5887:_SafeStr_3133;
        private var _SafeStr_5892:IStaticBitmapWrapperWindow;
        private var _SafeStr_5888:String = ARROW_PIVOT_DEFAULT.value;
        private var _SafeStr_5889:int = ARROW_DISPLACEMENT_DEFAULT.value;

        public function BalloonWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = (_windowManager.buildFromXML((_windowManager.assets.getAssetByName("balloon_xml").content as XML)) as _SafeStr_3133);
            _SafeStr_5892 = (_SafeStr_5428.findChildByName("bitmap") as IStaticBitmapWrapperWindow);
            _SafeStr_5887 = (_SafeStr_5428.findChildByName("border") as _SafeStr_3133);
            syncFlags();
            _SafeStr_5427.addEventListener("WE_RESIZE", onChange);
            _SafeStr_5427.addEventListener("WE_RESIZED", onChange);
            _SafeStr_5887.addEventListener("WE_RESIZE", onChange);
            _SafeStr_5887.addEventListener("WE_RESIZED", onChange);
            _SafeStr_5427.rootWindow = _SafeStr_5428;
            _SafeStr_5428.width = _SafeStr_5427.width;
            _SafeStr_5428.height = _SafeStr_5427.height;
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_SafeStr_5887 != null)
                {
                    _SafeStr_5887.removeEventListener("WE_RESIZE", onChange);
                    _SafeStr_5887.removeEventListener("WE_RESIZED", onChange);
                    _SafeStr_5887 = null;
                };
                _SafeStr_5892 = null;
                if (_SafeStr_5428 != null)
                {
                    _SafeStr_5428.dispose();
                    _SafeStr_5428 = null;
                };
                if (_SafeStr_5427 != null)
                {
                    _SafeStr_5427.removeEventListener("WE_RESIZE", onChange);
                    _SafeStr_5427.removeEventListener("WE_RESIZED", onChange);
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
            return ((_SafeStr_5887 == null) ? EmptyIterator.INSTANCE : _SafeStr_5887.iterator);
        }

        public function get properties():Array
        {
            var _local_1:Array = [];
            if (_disposed)
            {
                return (_local_1);
            };
            _local_1.push(ARROW_PIVOT_DEFAULT.withValue(_SafeStr_5888));
            _local_1.push(ARROW_DISPLACEMENT_DEFAULT.withValue(_SafeStr_5889));
            return (_local_1);
        }

        public function set properties(_arg_1:Array):void
        {
            _SafeStr_5890 = true;
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "balloon:arrow_pivot":
                        arrowPivot = _local_2.value;
                        break;
                    case "balloon:arrow_displacement":
                        arrowDisplacement = _local_2.value;
                };
            };
            _SafeStr_5890 = false;
            refresh();
        }

        public function get arrowPivot():String
        {
            return (_SafeStr_5888);
        }

        public function set arrowPivot(_arg_1:String):void
        {
            _SafeStr_5888 = _arg_1;
            clearFlags();
            refresh();
            syncFlags();
            refresh();
        }

        public function get arrowDisplacement():int
        {
            return (_SafeStr_5889);
        }

        public function set arrowDisplacement(_arg_1:int):void
        {
            _SafeStr_5889 = _arg_1;
            refresh();
        }

        private function onChange(_arg_1:_SafeStr_3116):void
        {
            refresh();
        }

        private function syncFlags():void
        {
            if (_SafeStr_5887 != null)
            {
                _SafeStr_5887.setParamFlag(0x20000, _SafeStr_5427.getParamFlag(0x20000));
                _SafeStr_5887.setParamFlag(147456, _SafeStr_5427.getParamFlag(147456));
            };
        }

        private function clearFlags():void
        {
            if (_SafeStr_5887 != null)
            {
                _SafeStr_5887.setParamFlag(0x20000, false);
                _SafeStr_5887.setParamFlag(147456, false);
            };
        }

        private function refresh():void
        {
            var _local_1:int;
            var _local_3:int;
            var _local_2:int;
            if (((((_SafeStr_5890) || (_SafeStr_5891)) || (_disposed)) || (_SafeStr_5887 == null)))
            {
                return;
            };
            var _local_4:String = _SafeStr_3472.directionFromPivot(_SafeStr_5888);
            switch (_local_4)
            {
                case "up":
                case "down":
                    _local_1 = _SafeStr_5887.width;
                    _local_3 = ((_SafeStr_5887.height + 6) - 1);
                    break;
                case "left":
                case "right":
                    _local_1 = ((_SafeStr_5887.width + 6) - 1);
                    _local_3 = _SafeStr_5887.height;
            };
            _SafeStr_5891 = true;
            if (_SafeStr_5427.testParamFlag(147456))
            {
                _SafeStr_5428.width = _local_1;
                _SafeStr_5428.height = _local_3;
            }
            else
            {
                if (_SafeStr_5427.testParamFlag(0x20000))
                {
                    _SafeStr_5428.width = Math.max(_SafeStr_5427.width, _local_1);
                    _SafeStr_5428.height = Math.max(_SafeStr_5427.height, _local_3);
                }
                else
                {
                    _SafeStr_5428.width = _SafeStr_5427.width;
                    _SafeStr_5428.height = _SafeStr_5427.height;
                };
            };
            _SafeStr_5427.width = _SafeStr_5428.width;
            _SafeStr_5427.height = _SafeStr_5428.height;
            _SafeStr_5891 = false;
            _SafeStr_5892.assetUri = ("illumina_light_balloon_arrow_" + _local_4);
            switch (_local_4)
            {
                case "up":
                case "down":
                    switch (_SafeStr_3472.positionFromPivot(_SafeStr_5888))
                    {
                        case "minimum":
                            _local_2 = 6;
                            break;
                        case "middle":
                            _local_2 = int(((_SafeStr_5428.width - 9) / 2));
                            break;
                        case "maximum":
                            _local_2 = ((_SafeStr_5428.width - 6) - 9);
                    };
                    _SafeStr_5891 = true;
                    _SafeStr_5887.rectangle = new Rectangle(0, ((_local_4 == "up") ? (6 - 1) : 0), _SafeStr_5428.width, ((_SafeStr_5428.height + 1) - 6));
                    _SafeStr_5891 = false;
                    _SafeStr_5892.rectangle = new Rectangle(_SafeStr_401.clamp((_local_2 + _SafeStr_5889), 6, (_SafeStr_5428.width - 6)), ((_local_4 == "up") ? 0 : (_SafeStr_5887.bottom - 1)), 9, 6);
                    return;
                case "left":
                case "right":
                    switch (_SafeStr_3472.positionFromPivot(_SafeStr_5888))
                    {
                        case "minimum":
                            _local_2 = 6;
                            break;
                        case "middle":
                            _local_2 = int(((_SafeStr_5428.height - 9) / 2));
                            break;
                        case "maximum":
                            _local_2 = ((_SafeStr_5428.height - 6) - 9);
                    };
                    _SafeStr_5891 = true;
                    _SafeStr_5887.rectangle = new Rectangle(((_local_4 == "left") ? (6 - 1) : 0), 0, ((_SafeStr_5428.width + 1) - 6), _SafeStr_5428.height);
                    _SafeStr_5891 = false;
                    _SafeStr_5892.rectangle = new Rectangle(((_local_4 == "left") ? 0 : (_SafeStr_5887.right - 1)), _SafeStr_401.clamp((_local_2 + _SafeStr_5889), 6, (_SafeStr_5428.height - 6)), 6, 9);
                    return;
            };
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3325 = "_-HE" (String#22530, DoABC#4)
// _SafeStr_3472 = "_-9g" (String#10332, DoABC#4)
// _SafeStr_401 = "_-e1d" (String#5870, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_5887 = "_-q1I" (String#2985, DoABC#4)
// _SafeStr_5888 = "_-C1T" (String#7328, DoABC#4)
// _SafeStr_5889 = "_-Hp" (String#8348, DoABC#4)
// _SafeStr_5890 = "_-MV" (String#5995, DoABC#4)
// _SafeStr_5891 = "_-31Z" (String#3940, DoABC#4)
// _SafeStr_5892 = "_-my" (String#8769, DoABC#4)


