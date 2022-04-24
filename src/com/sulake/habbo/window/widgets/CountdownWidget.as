// by nota

//com.sulake.habbo.window.widgets.CountdownWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.ITextWindow;
    import flash.utils.getTimer;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;

    public class CountdownWidget implements _SafeStr_3314, _SafeStr_41 
    {

        public static const TYPE:String = "countdown";
        private static const RUNNING_KEY:String = "countdown:running";
        private static const _SafeStr_9174:String = "countdown:digits";
        private static const _SafeStr_9175:String = "countdown:seconds";
        private static const COLOR_STYLE_KEY:String = "countdown:color_style";
        private static const RUNNING_DEFAULT:PropertyStruct = new PropertyStruct("countdown:running", false, "Boolean");
        private static const DIGITS_DEFAULT:PropertyStruct = new PropertyStruct("countdown:digits", 3, "uint");
        private static const SECONDS_DEFAULT:PropertyStruct = new PropertyStruct("countdown:seconds", 0, "int");
        private static const COLOR_STYLE_DEFAULT:PropertyStruct = new PropertyStruct("countdown:color_style", 0, "int");
        private static const UNIT_KEY_PREFIX:String = "countdown_clock_unit_";
        private static const _SafeStr_5795:Array = ["weeks", "days", "hours", "minutes", "seconds"];
        private static const _SafeStr_5792:Array = [604800, 86400, 3600, 60, 1];
        private static const UNIT_MAX_VALUES:Array = [100, 7, 24, 60, 60];
        private static const COLOR_STYLES_VALUES:Array = [0, 0xFFFFFF];
        private static const COLOR_STYLES_ETCHING_VALUES:Array = [3003121663, 0];

        private var _disposed:Boolean;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:IItemListWindow;
        private var _SafeStr_5793:_SafeStr_3133;
        private var _SafeStr_5794:ITextWindow;
        private var _SafeStr_4016:Boolean = RUNNING_DEFAULT.value;
        private var _startSeconds:int = SECONDS_DEFAULT.value;
        private var _startTime:int = getTimer();
        private var _SafeStr_5689:int = COLOR_STYLE_DEFAULT.value;
        private var _displayedTime:int = -1;

        public function CountdownWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_5428 = (_windowManager.buildFromXML((_windowManager.assets.getAssetByName("clock_base_xml").content as XML)) as IItemListWindow);
            _SafeStr_5793 = (_SafeStr_5428.getListItemByName("counter") as _SafeStr_3133);
            _SafeStr_5794 = (_SafeStr_5428.getListItemByName("separator") as ITextWindow);
            digits = DIGITS_DEFAULT.value;
            _windowManager.registerUpdateReceiver(this, 10);
            _SafeStr_5427.setParamFlag(147456);
            _SafeStr_5427.rootWindow = _SafeStr_5428;
        }

        private static function getMaxUnitIndex(_arg_1:int, _arg_2:int):int
        {
            var _local_3:int;
            _local_3 = 0;
            while (_local_3 < (_SafeStr_5792.length - _arg_1))
            {
                if (_arg_2 >= _SafeStr_5792[_local_3])
                {
                    return (_local_3);
                };
                _local_3++;
            };
            return (_local_3);
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
                if (_SafeStr_5793 != null)
                {
                    _SafeStr_5793.dispose();
                    _SafeStr_5793 = null;
                };
                if (_SafeStr_5794 != null)
                {
                    _SafeStr_5794.dispose();
                    _SafeStr_5794 = null;
                };
                if (_SafeStr_5427 != null)
                {
                    _SafeStr_5427.rootWindow = null;
                    _SafeStr_5427 = null;
                };
                _windowManager.removeUpdateReceiver(this);
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

        public function update(_arg_1:uint):void
        {
            updateTime();
        }

        public function get properties():Array
        {
            var _local_1:Array = [];
            if (_disposed)
            {
                return (_local_1);
            };
            _local_1.push(RUNNING_DEFAULT.withValue(_SafeStr_4016));
            _local_1.push(DIGITS_DEFAULT.withValue(digits));
            _local_1.push(SECONDS_DEFAULT.withValue(seconds));
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
                    case "countdown:running":
                        running = _local_2.value;
                        break;
                    case "countdown:digits":
                        digits = _local_2.value;
                        break;
                    case "countdown:seconds":
                        seconds = _local_2.value;
                        break;
                    case "countdown:color_style":
                        colorStyle = _local_2.value;
                };
            };
        }

        public function get colorStyle():int
        {
            return (_SafeStr_5689);
        }

        public function set colorStyle(_arg_1:int):void
        {
            var _local_3:int;
            var _local_2:* = null;
            var _local_5:* = null;
            var _local_6:uint;
            var _local_7:uint;
            _SafeStr_5689 = _arg_1;
            var _local_4:int = _SafeStr_5428.numListItems;
            _local_3 = 0;
            while (_local_3 < _local_4)
            {
                _local_2 = (_SafeStr_5428.getListItemAt(_local_3) as _SafeStr_3133);
                if (_local_2 != null)
                {
                    _local_5 = (_local_2.getChildByName("unit") as ITextWindow);
                    if (_local_5 != null)
                    {
                        _local_6 = _local_5.textColor;
                        _local_7 = _local_5.etchingColor;
                        if (((colorStyle >= 0) && (colorStyle < COLOR_STYLES_VALUES.length)))
                        {
                            _local_6 = COLOR_STYLES_VALUES[colorStyle];
                            _local_7 = COLOR_STYLES_ETCHING_VALUES[colorStyle];
                        };
                        _local_5.textColor = _local_6;
                        _local_5.etchingColor = _local_7;
                    };
                };
                _local_3++;
            };
        }

        public function get running():Boolean
        {
            return (_SafeStr_4016);
        }

        public function set running(_arg_1:Boolean):void
        {
            if (((_SafeStr_4016) && (!(_arg_1))))
            {
                _startSeconds = seconds;
            };
            if (((!(_SafeStr_4016)) && (_arg_1)))
            {
                _startTime = getTimer();
            };
            _SafeStr_4016 = _arg_1;
        }

        public function get digits():uint
        {
            return ((_SafeStr_5428.numListItems + 1) / 2);
        }

        public function set digits(_arg_1:uint):void
        {
            var _local_2:int;
            _arg_1 = Math.max(2, Math.min(4, _arg_1));
            if (_arg_1 != digits)
            {
                _SafeStr_5428.removeListItems();
                _local_2 = 0;
                while (_local_2 < _arg_1)
                {
                    if (_local_2 != 0)
                    {
                        _SafeStr_5428.addListItem(_SafeStr_5794.clone());
                    };
                    _SafeStr_5428.addListItem(_SafeStr_5793.clone());
                    _local_2++;
                };
                updateTime(true);
            };
        }

        public function get seconds():int
        {
            return ((_SafeStr_4016) ? Math.max(0, (_startSeconds - ((getTimer() - _startTime) / 1000))) : _startSeconds);
        }

        public function set seconds(_arg_1:int):void
        {
            _startSeconds = _arg_1;
            _startTime = getTimer();
            updateTime();
        }

        private function updateTime(_arg_1:Boolean=false):void
        {
            var _local_5:int;
            var _local_8:int;
            var _local_3:* = null;
            var _local_7:int;
            var _local_6:int = seconds;
            if (((_local_6 == _displayedTime) && (!(_arg_1))))
            {
                return;
            };
            var _local_4:int = digits;
            var _local_2:int = getMaxUnitIndex(_local_4, _local_6);
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_8 = (_local_2 + _local_5);
                _local_3 = (_SafeStr_5428.getListItemAt((_local_5 * 2)) as _SafeStr_3133);
                _local_7 = int(((_local_6 / _SafeStr_5792[_local_8]) % UNIT_MAX_VALUES[_local_8]));
                _local_3.getChildByName("value").caption = (((_local_7 < 10) ? "0" : "") + _local_7.toString());
                _local_3.getChildByName("unit").caption = (("${countdown_clock_unit_" + _SafeStr_5795[_local_8]) + "}");
                _local_5++;
            };
            _displayedTime = _local_6;
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3314 = "_-j1a" (String#3394, DoABC#4)
// _SafeStr_4016 = "_-z1x" (String#1885, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_5689 = "_-SJ" (String#5955, DoABC#4)
// _SafeStr_5792 = "_-5L" (String#13005, DoABC#4)
// _SafeStr_5793 = "_-01S" (String#10226, DoABC#4)
// _SafeStr_5794 = "_-Ke" (String#9133, DoABC#4)
// _SafeStr_5795 = "_-A4" (String#22674, DoABC#4)
// _SafeStr_9174 = "_-Mz" (String#30120, DoABC#4)
// _SafeStr_9175 = "_-x13" (String#32877, DoABC#4)


