// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectAvatarMutedUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarMutedUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_5035:Boolean;

        public function RoomObjectAvatarMutedUpdateMessage(_arg_1:Boolean=false)
        {
            _SafeStr_5035 = _arg_1;
        }

        public function get isMuted():Boolean
        {
            return (_SafeStr_5035);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_5035 = "_-O19" (String#21276, DoABC#4)


