// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetStickieSendUpdateMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetStickieSendUpdateMessage extends RoomWidgetMessage 
    {

        public static const _SafeStr_9070:String = "RWSUM_STICKIE_SEND_UPDATE";
        public static const _SafeStr_9071:String = "RWSUM_STICKIE_SEND_DELETE";

        private var _SafeStr_4157:int;
        private var _text:String;
        private var _SafeStr_4653:String;

        public function RoomWidgetStickieSendUpdateMessage(_arg_1:String, _arg_2:int, _arg_3:String="", _arg_4:String="")
        {
            super(_arg_1);
            _SafeStr_4157 = _arg_2;
            _text = _arg_3;
            _SafeStr_4653 = _arg_4;
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get text():String
        {
            return (_text);
        }

        public function get colorHex():String
        {
            return (_SafeStr_4653);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4653 = "_-m10" (String#3030, DoABC#4)
// _SafeStr_9070 = "_-HA" (String#39657, DoABC#4)
// _SafeStr_9071 = "_-n1s" (String#41487, DoABC#4)


