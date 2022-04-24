// by nota

//com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarSignUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_4381:int;

        public function RoomObjectAvatarSignUpdateMessage(_arg_1:int)
        {
            _SafeStr_4381 = _arg_1;
        }

        public function get signType():int
        {
            return (_SafeStr_4381);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4381 = "_-q11" (String#7236, DoABC#4)


