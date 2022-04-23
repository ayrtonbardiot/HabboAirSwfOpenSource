// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.events.WindowDisposeEvent

package com.sulake.core.window.events
{
    import com.sulake.core.window._SafeStr_3109;

    public class WindowDisposeEvent extends _SafeStr_3116 
    {

        public static const _SafeStr_8217:String = "WINDOW_DISPOSE_EVENT";
        private static const _SafeStr_4027:Array = [];

        public function WindowDisposeEvent()
        {
            _SafeStr_4028 = "WINDOW_DISPOSE_EVENT";
        }

        public static function allocate(_arg_1:_SafeStr_3109):WindowDisposeEvent
        {
            var _local_2:WindowDisposeEvent = ((_SafeStr_4027.length > 0) ? _SafeStr_4027.pop() : new (WindowDisposeEvent)());
            _local_2._window = _arg_1;
            _local_2._SafeStr_4031 = false;
            _local_2._SafeStr_4032 = _SafeStr_4027;
            return (_local_2);
        }


        override public function clone():_SafeStr_3116
        {
            return (allocate(window));
        }

        override public function toString():String
        {
            return (((("WindowDisposeEvent { type: " + _SafeStr_4028) + " window: ") + _window) + " }");
        }


    }
}//package com.sulake.core.window.events

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_4027 = "_-r1I" (String#1329, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4031 = "_-q7" (String#1788, DoABC#4)
// _SafeStr_4032 = "_-3H" (String#8484, DoABC#4)
// _SafeStr_8217 = "_-61y" (String#33831, DoABC#4)


