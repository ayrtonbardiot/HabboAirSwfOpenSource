// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetChatMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetChatMessage extends RoomWidgetMessage 
    {

        public static const WIDGET_MESSAGE_CHAT:String = "RWCM_MESSAGE_CHAT";
        public static const CHAT_TYPE_SPEAK:int = 0;
        public static const CHAT_TYPE_WHISPER:int = 1;
        public static const CHAT_TYPE_SHOUT:int = 2;

        private var _SafeStr_4129:int = 0;
        private var _text:String = "";
        private var _recipientName:String = "";
        private var _SafeStr_5982:int;

        public function RoomWidgetChatMessage(_arg_1:String, _arg_2:String, _arg_3:int=0, _arg_4:String="", _arg_5:int=0)
        {
            super(_arg_1);
            _text = _arg_2;
            _SafeStr_4129 = _arg_3;
            _recipientName = _arg_4;
            _SafeStr_5982 = _arg_5;
        }

        public function get chatType():int
        {
            return (_SafeStr_4129);
        }

        public function get text():String
        {
            return (_text);
        }

        public function get recipientName():String
        {
            return (_recipientName);
        }

        public function get styleId():int
        {
            return (_SafeStr_5982);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4129 = "_-c1k" (String#2784, DoABC#4)
// _SafeStr_5982 = "_-AQ" (String#7031, DoABC#4)


