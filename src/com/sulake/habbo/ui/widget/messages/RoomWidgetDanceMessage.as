// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetDanceMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetDanceMessage extends RoomWidgetMessage 
    {

        public static const _SafeStr_9048:String = "RWCM_MESSAGE_DANCE";
        public static const _SafeStr_9049:int = 0;
        public static const _SafeStr_5981:Array = [2, 3, 4];

        private var _style:int = 0;

        public function RoomWidgetDanceMessage(_arg_1:int)
        {
            super("RWCM_MESSAGE_DANCE");
            _style = _arg_1;
        }

        public function get style():int
        {
            return (_style);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_5981 = "_-i1P" (String#16317, DoABC#4)
// _SafeStr_9048 = "_-02W" (String#35281, DoABC#4)
// _SafeStr_9049 = "_-in" (String#32417, DoABC#4)


