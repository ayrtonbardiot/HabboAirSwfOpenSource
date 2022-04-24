// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetNavigateToRoomMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetNavigateToRoomMessage extends RoomWidgetMessage 
    {

        public static const WIDGET_MESSAGE_NAVIGATE_TO_ROOM:String = "RWGOI_MESSAGE_NAVIGATE_TO_ROOM";
        public static const WIDGET_MESSAGE_NAVIGATE_HOME:String = "RWGOI_MESSAGE_NAVIGATE_HOME";

        private var _SafeStr_3693:int;

        public function RoomWidgetNavigateToRoomMessage(_arg_1:String, _arg_2:int=-1)
        {
            super(_arg_1);
            _SafeStr_3693 = _arg_2;
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)


