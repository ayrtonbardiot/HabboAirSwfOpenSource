// by nota

//com.sulake.habbo.room.messages.RoomObjectAvatarPlayerValueUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarPlayerValueUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_4525:int;

        public function RoomObjectAvatarPlayerValueUpdateMessage(_arg_1:int)
        {
            _SafeStr_4525 = _arg_1;
        }

        public function get value():int
        {
            return (_SafeStr_4525);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4525 = "_-8S" (String#1037, DoABC#4)


