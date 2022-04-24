// by nota

//com.sulake.habbo.room.messages.RoomObjectAvatarExperienceUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarExperienceUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_4649:int;

        public function RoomObjectAvatarExperienceUpdateMessage(_arg_1:int)
        {
            _SafeStr_4649 = _arg_1;
        }

        public function get gainedExperience():int
        {
            return (_SafeStr_4649);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4649 = "_-k0" (String#18070, DoABC#4)


