// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetPresentOpenMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetPresentOpenMessage extends RoomWidgetMessage 
    {

        public static const _SafeStr_9063:String = "RWPOM_OPEN_PRESENT";

        private var _SafeStr_4157:int;

        public function RoomWidgetPresentOpenMessage(_arg_1:String, _arg_2:int)
        {
            super(_arg_1);
            _SafeStr_4157 = _arg_2;
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_9063 = "_-ok" (String#32267, DoABC#4)


