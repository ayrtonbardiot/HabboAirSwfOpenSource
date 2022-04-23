// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarSleepUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_4876:Boolean;

        public function RoomObjectAvatarSleepUpdateMessage(_arg_1:Boolean=false)
        {
            _SafeStr_4876 = _arg_1;
        }

        public function get isSleeping():Boolean
        {
            return (_SafeStr_4876);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4876 = "_-D1O" (String#5749, DoABC#4)


