// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetMessage 
    {

        public static const WIDGET_MESSAGE_TEST:String = "RWM_MESSAGE_TEST";

        private var _SafeStr_4028:String = "";

        public function RoomWidgetMessage(_arg_1:String)
        {
            _SafeStr_4028 = _arg_1;
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)


