// by nota

//com.sulake.core.window.events.WindowKeyboardEvent

package com.sulake.core.window.events
{
    import flash.events.KeyboardEvent;
    import flash.events.Event;
    import com.sulake.core.window._SafeStr_3109;

    public class WindowKeyboardEvent extends _SafeStr_3116 
    {

        public static const _SafeStr_8218:String = "WKE_KEY_UP";
        public static const _SafeStr_8219:String = "WKE_KEY_DOWN";
        private static const _SafeStr_4027:Array = [];

        private var _SafeStr_4940:KeyboardEvent;


        public static function allocate(_arg_1:String, _arg_2:Event, _arg_3:_SafeStr_3109, _arg_4:_SafeStr_3109, _arg_5:Boolean=false):WindowKeyboardEvent
        {
            var _local_6:WindowKeyboardEvent = ((_SafeStr_4027.length > 0) ? _SafeStr_4027.pop() : new (WindowKeyboardEvent)());
            _local_6._SafeStr_4028 = _arg_1;
            _local_6._SafeStr_4940 = (_arg_2 as KeyboardEvent);
            _local_6._window = _arg_3;
            _local_6._SafeStr_4029 = _arg_4;
            _local_6._SafeStr_4031 = false;
            _local_6._SafeStr_4030 = _arg_5;
            _local_6._SafeStr_4032 = _SafeStr_4027;
            return (_local_6);
        }


        public function get charCode():uint
        {
            return (_SafeStr_4940.charCode);
        }

        public function get keyCode():uint
        {
            return (_SafeStr_4940.keyCode);
        }

        public function get keyLocation():uint
        {
            return (_SafeStr_4940.keyLocation);
        }

        public function get altKey():Boolean
        {
            return (_SafeStr_4940.altKey);
        }

        public function get shiftKey():Boolean
        {
            return (_SafeStr_4940.shiftKey);
        }

        public function get ctrlKey():Boolean
        {
            return (_SafeStr_4940.ctrlKey);
        }

        override public function clone():_SafeStr_3116
        {
            return (allocate(_SafeStr_4028, _SafeStr_4940, window, related, cancelable));
        }

        override public function toString():String
        {
            return (((((((("WindowKeyboardEvent { type: " + _SafeStr_4028) + " cancelable: ") + _SafeStr_4030) + " window: ") + _window) + " charCode: ") + charCode) + " }");
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
// _SafeStr_4940 = "_-oR" (String#8594, DoABC#4)
// _SafeStr_8218 = "_-Kv" (String#39805, DoABC#4)
// _SafeStr_8219 = "_-T1r" (String#40036, DoABC#4)


