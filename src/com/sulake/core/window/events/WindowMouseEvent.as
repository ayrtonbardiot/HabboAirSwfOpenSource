// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.events.WindowMouseEvent

package com.sulake.core.window.events
{
    import com.sulake.core.window._SafeStr_3109;

    public class WindowMouseEvent extends _SafeStr_3116 
    {

        public static const CLICK:String = "WME_CLICK";
        public static const DOUBLE_CLICK:String = "WME_DOUBLE_CLICK";
        public static const DOWN:String = "WME_DOWN";
        public static const MIDDLE_CLICK:String = "WME_MIDDLE_CLICK";
        public static const _SafeStr_8221:String = "WME_MIDDLE_DOWN";
        public static const _SafeStr_8222:String = "WME_MIDDLE_UP";
        public static const MOVE:String = "WME_MOVE";
        public static const _SafeStr_8223:String = "WME_OUT";
        public static const OVER:String = "WME_OVER";
        public static const _SafeStr_8169:String = "WME_UP";
        public static const UP_OUTSIDE:String = "WME_UP_OUTSIDE";
        public static const _SafeStr_8224:String = "WME_WHEEL";
        public static const RIGHT_CLICK:String = "WME_RIGHT_CLICK";
        public static const _SafeStr_8225:String = "WME_RIGHT_DOWN";
        public static const _SafeStr_8226:String = "WME_RIGHT_UP";
        public static const ROLL_OUT:String = "WME_ROLL_OUT";
        public static const ROLL_OVER:String = "WME_ROLL_OVER";
        public static const HOVERING:String = "WME_HOVERING";
        private static const _SafeStr_4027:Array = [];

        public var delta:int;
        public var localX:Number;
        public var localY:Number;
        public var stageX:Number;
        public var stageY:Number;
        public var altKey:Boolean;
        public var ctrlKey:Boolean;
        public var shiftKey:Boolean;
        public var buttonDown:Boolean;


        public static function allocate(_arg_1:String, _arg_2:_SafeStr_3109, _arg_3:_SafeStr_3109, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number, _arg_8:Boolean, _arg_9:Boolean, _arg_10:Boolean, _arg_11:Boolean, _arg_12:int):WindowMouseEvent
        {
            var _local_13:WindowMouseEvent = ((_SafeStr_4027.length > 0) ? _SafeStr_4027.pop() : new (WindowMouseEvent)());
            _local_13._SafeStr_4028 = _arg_1;
            _local_13._window = _arg_2;
            _local_13._SafeStr_4029 = _arg_3;
            _local_13._SafeStr_4031 = false;
            _local_13._SafeStr_4032 = _SafeStr_4027;
            _local_13.localX = _arg_4;
            _local_13.localY = _arg_5;
            _local_13.stageX = _arg_6;
            _local_13.stageY = _arg_7;
            _local_13.altKey = _arg_8;
            _local_13.ctrlKey = _arg_9;
            _local_13.shiftKey = _arg_10;
            _local_13.buttonDown = _arg_11;
            _local_13.delta = _arg_12;
            return (_local_13);
        }


        override public function clone():_SafeStr_3116
        {
            return (allocate(_SafeStr_4028, window, related, localX, localY, stageX, stageY, altKey, ctrlKey, shiftKey, buttonDown, delta));
        }

        override public function toString():String
        {
            return (((((((((("WindowMouseEvent { type: " + _SafeStr_4028) + " cancelable: ") + _SafeStr_4030) + " window: ") + _window) + " localX: ") + localX) + " localY: ") + localY) + " }");
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
// _SafeStr_8169 = "_-Ym" (String#19322, DoABC#4)
// _SafeStr_8221 = "_-sB" (String#31644, DoABC#4)
// _SafeStr_8222 = "_-m1Z" (String#36406, DoABC#4)
// _SafeStr_8223 = "_-iQ" (String#32297, DoABC#4)
// _SafeStr_8224 = "_-NE" (String#39328, DoABC#4)
// _SafeStr_8225 = "_-D1M" (String#31676, DoABC#4)
// _SafeStr_8226 = "_-q1x" (String#41090, DoABC#4)


