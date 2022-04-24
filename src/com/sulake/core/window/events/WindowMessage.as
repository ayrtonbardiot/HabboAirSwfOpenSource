// by nota

//com.sulake.core.window.events.WindowMessage

package com.sulake.core.window.events
{
    import com.sulake.core.window._SafeStr_3109;

    public class WindowMessage extends _SafeStr_3116 
    {

        private static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
        private static const _SafeStr_4027:Array = [];

        public var message:String;

        public function WindowMessage()
        {
            _SafeStr_4028 = "WE_MESSAGE";
        }

        public static function allocate(_arg_1:String, _arg_2:_SafeStr_3109, _arg_3:_SafeStr_3109, _arg_4:Boolean=false):_SafeStr_3116
        {
            var _local_5:WindowMessage = ((_SafeStr_4027.length > 0) ? _SafeStr_4027.pop() : new (WindowMessage)());
            _local_5.message = _arg_1;
            _local_5._window = _arg_2;
            _local_5._SafeStr_4029 = _arg_3;
            _local_5._SafeStr_4030 = _arg_4;
            _local_5._SafeStr_4031 = false;
            _local_5._SafeStr_4032 = _SafeStr_4027;
            return (_local_5);
        }


        override public function clone():_SafeStr_3116
        {
            return (allocate(message, window, related, cancelable));
        }

        override public function toString():String
        {
            return (((((((("WindowLinkEvent { type: " + _SafeStr_4028) + " message: ") + message) + " cancelable: ") + _SafeStr_4030) + " window: ") + _window) + " }");
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


