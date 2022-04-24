// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetGetBadgeDetailsMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage 
    {

        public static const WIDGET_MESSAGE_GET_BADGE_DETAILS:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";

        private var _SafeStr_6654:Boolean;
        private var _groupId:int = 0;

        public function RoomWidgetGetBadgeDetailsMessage(_arg_1:Boolean, _arg_2:int)
        {
            super("RWGOI_MESSAGE_GET_BADGE_DETAILS");
            _SafeStr_6654 = _arg_1;
            _groupId = _arg_2;
        }

        public function get own():Boolean
        {
            return (_SafeStr_6654);
        }

        public function get groupId():int
        {
            return (_groupId);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_6654 = "_-Q1n" (String#20941, DoABC#4)


