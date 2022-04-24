// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetChatTypingMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetChatTypingMessage extends RoomWidgetMessage 
    {

        public static const TYPING_STATUS:String = "RWCTM_TYPING_STATUS";

        private var _SafeStr_5030:Boolean;

        public function RoomWidgetChatTypingMessage(_arg_1:Boolean)
        {
            super("RWCTM_TYPING_STATUS");
            _SafeStr_5030 = _arg_1;
        }

        public function get isTyping():Boolean
        {
            return (_SafeStr_5030);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_5030 = "_-KT" (String#3697, DoABC#4)


