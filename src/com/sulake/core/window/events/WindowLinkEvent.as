// by nota

//com.sulake.core.window.events.WindowLinkEvent

package com.sulake.core.window.events
{
    import com.sulake.core.window._SafeStr_3109;

    public class WindowLinkEvent extends _SafeStr_3116 
    {

        public static const _SafeStr_8220:String = "WE_LINK";
        private static const _SafeStr_4027:Array = [];

        private var _SafeStr_5272:String;

        public function WindowLinkEvent()
        {
            _SafeStr_4028 = "WE_LINK";
        }

        public static function allocate(_arg_1:String, _arg_2:_SafeStr_3109, _arg_3:_SafeStr_3109):_SafeStr_3116
        {
            var _local_4:WindowLinkEvent = ((_SafeStr_4027.length > 0) ? _SafeStr_4027.pop() : new (WindowLinkEvent)());
            _local_4._SafeStr_5272 = _arg_1;
            _local_4._window = _arg_2;
            _local_4._SafeStr_4029 = _arg_3;
            _local_4._SafeStr_4031 = false;
            _local_4._SafeStr_4032 = _SafeStr_4027;
            return (_local_4);
        }


        public function get link():String
        {
            return (_SafeStr_5272);
        }

        override public function clone():_SafeStr_3116
        {
            return (allocate(_SafeStr_5272, window, related));
        }

        override public function toString():String
        {
            return (((((((("WindowLinkEvent { type: " + _SafeStr_4028) + " link: ") + link) + " cancelable: ") + _SafeStr_4030) + " window: ") + _window) + " }");
        }


    }
}//package com.sulake.core.window.events

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_4027 = "_-r1I" (String#1329, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4029 = "_-k7" (String#7281, DoABC#4)
// _SafeStr_4030 = "_-lP" (String#6874, DoABC#4)
// _SafeStr_4031 = "_-q7" (String#1788, DoABC#4)
// _SafeStr_4032 = "_-3H" (String#8484, DoABC#4)
// _SafeStr_5272 = "_-Bm" (String#2658, DoABC#4)
// _SafeStr_8220 = "_-rz" (String#31599, DoABC#4)


