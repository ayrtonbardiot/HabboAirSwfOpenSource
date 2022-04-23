// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetClothingChangeMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetClothingChangeMessage extends RoomWidgetMessage 
    {

        public static const REQUEST_EDITOR:String = "RWCCM_REQUEST_EDITOR";

        private var _SafeStr_4157:int = 0;
        private var _SafeStr_4750:int = 0;
        private var _SafeStr_3693:int = 0;
        private var _SafeStr_3834:String = "";

        public function RoomWidgetClothingChangeMessage(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:int)
        {
            super(_arg_1);
            _SafeStr_3834 = _arg_2;
            _SafeStr_4157 = _arg_3;
            _SafeStr_4750 = _arg_4;
            _SafeStr_3693 = _arg_5;
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get objectCategory():int
        {
            return (_SafeStr_4750);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_3834 = "_-tK" (String#1203, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4750 = "_-E1d" (String#2700, DoABC#4)


