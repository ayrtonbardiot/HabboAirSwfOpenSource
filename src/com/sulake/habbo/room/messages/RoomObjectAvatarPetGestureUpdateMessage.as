// by nota

//com.sulake.habbo.room.messages.RoomObjectAvatarPetGestureUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarPetGestureUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_4376:String;

        public function RoomObjectAvatarPetGestureUpdateMessage(_arg_1:String)
        {
            _SafeStr_4376 = _arg_1;
        }

        public function get gesture():String
        {
            return (_SafeStr_4376);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4376 = "_-410" (String#4262, DoABC#4)


