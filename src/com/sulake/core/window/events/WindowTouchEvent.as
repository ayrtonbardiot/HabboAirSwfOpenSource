// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.events.WindowTouchEvent

package com.sulake.core.window.events
{
    import com.sulake.core.window._SafeStr_3109;

    public class WindowTouchEvent extends _SafeStr_3116 
    {

        public static const WINDOW_EVENT_TOUCH_BEGIN:String = "WTE_BEGIN";
        public static const _SafeStr_8227:String = "WTE_END";
        public static const WINDOW_EVENT_TOUCH_MOVE:String = "WTE_MOVE";
        public static const _SafeStr_8228:String = "WTE_OUT";
        public static const WINDOW_EVENT_TOUCH_OVER:String = "WTE_OVER";
        public static const _SafeStr_8229:String = "WTE_ROLL_OUT";
        public static const WINDOW_EVENT_TOUCH_ROLL_OVER:String = "WTE_ROLL_OVER";
        public static const _SafeStr_8230:String = "WTE_TAP";
        private static const _SafeStr_4027:Array = [];

        public var localX:Number;
        public var localY:Number;
        public var stageX:Number;
        public var stageY:Number;
        public var altKey:Boolean;
        public var ctrlKey:Boolean;
        public var shiftKey:Boolean;
        public var pressure:Number;
        public var sizeX:Number;
        public var sizeY:Number;


        public static function allocate(_arg_1:String, _arg_2:_SafeStr_3109, _arg_3:_SafeStr_3109, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number, _arg_8:Number, _arg_9:Number, _arg_10:Number, _arg_11:Boolean, _arg_12:Boolean, _arg_13:Boolean):WindowTouchEvent
        {
            var _local_14:WindowTouchEvent = ((_SafeStr_4027.length > 0) ? _SafeStr_4027.pop() : new (WindowTouchEvent)());
            _local_14._SafeStr_4028 = _arg_1;
            _local_14._window = _arg_2;
            _local_14._SafeStr_4029 = _arg_3;
            _local_14._SafeStr_4031 = false;
            _local_14._SafeStr_4032 = _SafeStr_4027;
            _local_14.sizeX = _arg_6;
            _local_14.sizeY = _arg_7;
            _local_14.localX = _arg_4;
            _local_14.localY = _arg_5;
            _local_14.stageX = _arg_8;
            _local_14.stageY = _arg_9;
            _local_14.pressure = _arg_10;
            _local_14.altKey = _arg_11;
            _local_14.ctrlKey = _arg_12;
            _local_14.shiftKey = _arg_13;
            return (_local_14);
        }


        override public function clone():_SafeStr_3116
        {
            return (allocate(_SafeStr_4028, window, related, localX, localY, sizeX, sizeY, stageX, stageY, pressure, altKey, ctrlKey, shiftKey));
        }

        override public function toString():String
        {
            return (((((((((("WindowTouchEvent { type: " + _SafeStr_4028) + " cancelable: ") + _SafeStr_4030) + " window: ") + _window) + " localX: ") + localX) + " localY: ") + localY) + " }");
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
// _SafeStr_8227 = "_-cf" (String#31851, DoABC#4)
// _SafeStr_8228 = "_-G1R" (String#39457, DoABC#4)
// _SafeStr_8229 = "_-R1y" (String#41499, DoABC#4)
// _SafeStr_8230 = "_-A1V" (String#33958, DoABC#4)


