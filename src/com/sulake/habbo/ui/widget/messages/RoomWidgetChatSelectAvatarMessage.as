// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetChatSelectAvatarMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetChatSelectAvatarMessage extends RoomWidgetMessage 
    {

        public static const WIDGET_MESSAGE_SELECT_AVATAR:String = "RWCSAM_MESSAGE_SELECT_AVATAR";

        private var _SafeStr_4157:int;
        private var _userName:String;
        private var _SafeStr_3693:int;

        public function RoomWidgetChatSelectAvatarMessage(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:int)
        {
            super(_arg_1);
            _SafeStr_4157 = _arg_2;
            _SafeStr_3693 = _arg_4;
            _userName = _arg_3;
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)


