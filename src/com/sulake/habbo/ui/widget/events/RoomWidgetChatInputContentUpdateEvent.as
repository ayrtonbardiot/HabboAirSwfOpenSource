// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetChatInputContentUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetChatInputContentUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const CHAT_INPUT_CONTENT:String = "RWWCIDE_CHAT_INPUT_CONTENT";
        public static const MESSAGE_TYPE_WHISPER:String = "whisper";
        public static const MESSAGE_TYPE_SHOUT:String = "shout";

        private var _SafeStr_6090:String = "";
        private var _userName:String = "";

        public function RoomWidgetChatInputContentUpdateEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super("RWWCIDE_CHAT_INPUT_CONTENT", _arg_3, _arg_4);
            _SafeStr_6090 = _arg_1;
            _userName = _arg_2;
        }

        public function get messageType():String
        {
            return (_SafeStr_6090);
        }

        public function get userName():String
        {
            return (_userName);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_6090 = "_-T1k" (String#21841, DoABC#4)


