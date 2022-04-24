// by nota

//com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarDanceUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_4126:int;

        public function RoomObjectAvatarDanceUpdateMessage(_arg_1:int=0)
        {
            _SafeStr_4126 = _arg_1;
        }

        public function get danceStyle():int
        {
            return (_SafeStr_4126);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4126 = "_-32L" (String#5358, DoABC#4)


