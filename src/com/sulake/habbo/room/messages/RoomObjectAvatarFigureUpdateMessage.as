// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_3819:String;
        private var _SafeStr_4785:String;
        private var _SafeStr_3834:String;
        private var _SafeStr_4378:Boolean;

        public function RoomObjectAvatarFigureUpdateMessage(_arg_1:String, _arg_2:String=null, _arg_3:String=null, _arg_4:Boolean=false)
        {
            _SafeStr_3819 = _arg_1;
            _SafeStr_3834 = _arg_2;
            _SafeStr_4785 = _arg_3;
            _SafeStr_4378 = _arg_4;
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get race():String
        {
            return (_SafeStr_4785);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function get isRiding():Boolean
        {
            return (_SafeStr_4378);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_3834 = "_-tK" (String#1203, DoABC#4)
// _SafeStr_4378 = "_-a1j" (String#3839, DoABC#4)
// _SafeStr_4785 = "_-jp" (String#9180, DoABC#4)


