// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetSpamWallPostItFinishEditingMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetSpamWallPostItFinishEditingMessage extends RoomWidgetMessage 
    {

        public static const SEND_POSTIT_DATA:String = "RWSWPFEE_SEND_POSTIT_DATA";

        private var _SafeStr_4157:int;
        private var _location:String;
        private var _text:String;
        private var _SafeStr_4653:String;

        public function RoomWidgetSpamWallPostItFinishEditingMessage(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String)
        {
            super(_arg_1);
            _SafeStr_4157 = _arg_2;
            _location = _arg_3;
            _text = _arg_4;
            _SafeStr_4653 = _arg_5;
        }

        public function get location():String
        {
            return (_location);
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


