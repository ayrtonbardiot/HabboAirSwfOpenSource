// by nota

//com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_4626:String;
        private var _SafeStr_4118:String;

        public function RoomObjectAvatarPostureUpdateMessage(_arg_1:String, _arg_2:String="")
        {
            _SafeStr_4626 = _arg_1;
            _SafeStr_4118 = _arg_2;
        }

        public function get postureType():String
        {
            return (_SafeStr_4626);
        }

        public function get parameter():String
        {
            return (_SafeStr_4118);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4118 = "_-M1c" (String#6160, DoABC#4)
// _SafeStr_4626 = "_-kK" (String#18062, DoABC#4)


