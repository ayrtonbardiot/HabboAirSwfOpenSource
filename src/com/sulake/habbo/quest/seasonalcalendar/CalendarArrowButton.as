// by nota

//com.sulake.habbo.quest.seasonalcalendar.CalendarArrowButton

package com.sulake.habbo.quest.seasonalcalendar
{
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class CalendarArrowButton 
    {

        public static const DIRECTION_BACK:int = 0;
        public static const _SafeStr_8695:int = 1;
        public static const STATE_INACTIVE:int = 0;
        public static const STATE_ACTIVE:int = 1;
        public static const STATE_HILITE:int = 2;
        private static const PRESSED_OFFSET_PIXELS:Point = new Point(1, 1);

        private var _window:_SafeStr_3264;
        private var _callback:Function;
        private var _SafeStr_3734:int = 0;
        private var _pressed:Boolean = false;
        private var _initialLocation:Point;
        private var _SafeStr_6952:BitmapData;
        private var _SafeStr_6954:BitmapData;
        private var _SafeStr_6953:BitmapData;

        public function CalendarArrowButton(_arg_1:_SafeStr_21, _arg_2:_SafeStr_3264, _arg_3:int, _arg_4:Function)
        {
            _window = _arg_2;
            _window.procedure = procedure;
            _callback = _arg_4;
            switch (_arg_3)
            {
                case 0:
                    _SafeStr_6954 = BitmapData(_arg_1.getAssetByName("arrow_back_active").content).clone();
                    _SafeStr_6952 = BitmapData(_arg_1.getAssetByName("arrow_back_inactive").content).clone();
                    _SafeStr_6953 = BitmapData(_arg_1.getAssetByName("arrow_back_hilite").content).clone();
                    break;
                case 1:
                    _SafeStr_6954 = BitmapData(_arg_1.getAssetByName("arrow_next_active").content).clone();
                    _SafeStr_6952 = BitmapData(_arg_1.getAssetByName("arrow_next_inactive").content).clone();
                    _SafeStr_6953 = BitmapData(_arg_1.getAssetByName("arrow_next_hilite").content).clone();
                default:
            };
            _initialLocation = new Point(_window.x, _window.y);
            updateWindow();
        }

        public function dispose():void
        {
            _SafeStr_6954 = null;
            _SafeStr_6953 = null;
            _SafeStr_6952 = null;
            _window.procedure = null;
            _window = null;
            _callback = null;
        }

        public function activate():void
        {
            if (((!(_SafeStr_3734 == 1)) && (!(_SafeStr_3734 == 2))))
            {
                _SafeStr_3734 = 1;
            };
            updateWindow();
        }

        public function deactivate():void
        {
            _SafeStr_3734 = 0;
            updateWindow();
        }

        public function isInactive():Boolean
        {
            return (_SafeStr_3734 == 0);
        }

        private function updateWindow():void
        {
            switch (_SafeStr_3734)
            {
                case 0:
                    _window.bitmap = _SafeStr_6952;
                    break;
                case 2:
                    _window.bitmap = _SafeStr_6953;
                    break;
                case 1:
                    _window.bitmap = _SafeStr_6954;
                default:
            };
            if (_pressed)
            {
                _window.x = (_initialLocation.x + PRESSED_OFFSET_PIXELS.x);
                _window.y = (_initialLocation.y + PRESSED_OFFSET_PIXELS.y);
            }
            else
            {
                _window.position = _initialLocation;
            };
        }

        private function procedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if ((_arg_1 as WindowMouseEvent) != null)
            {
                switch (_arg_1.type)
                {
                    case "WME_OVER":
                        if (_SafeStr_3734 != 0)
                        {
                            _SafeStr_3734 = 2;
                        };
                        break;
                    case "WME_OUT":
                        if (_SafeStr_3734 != 0)
                        {
                            _SafeStr_3734 = 1;
                        };
                        break;
                    case "WME_DOWN":
                        _pressed = true;
                        break;
                    case "WME_UP":
                    case "WME_UP_OUTSIDE":
                        _pressed = false;
                };
                updateWindow();
                (_callback(_arg_1, _arg_2));
            };
        }


    }
}//package com.sulake.habbo.quest.seasonalcalendar

// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_6952 = "_-He" (String#9033, DoABC#4)
// _SafeStr_6953 = "_-22T" (String#8807, DoABC#4)
// _SafeStr_6954 = "_-64" (String#8805, DoABC#4)
// _SafeStr_8695 = "_-c1V" (String#37615, DoABC#4)


