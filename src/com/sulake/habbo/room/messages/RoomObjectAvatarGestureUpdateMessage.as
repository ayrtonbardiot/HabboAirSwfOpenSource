// by nota

//com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarGestureUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_4376:int = 0;

        public function RoomObjectAvatarGestureUpdateMessage(_arg_1:int)
        {
            _SafeStr_4376 = _arg_1;
        }

        public function get gesture():int
        {
            return (_SafeStr_4376);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4376 = "_-410" (String#4262, DoABC#4)


