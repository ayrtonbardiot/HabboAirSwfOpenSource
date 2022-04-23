// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarChatUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_4385:int;

        public function RoomObjectAvatarChatUpdateMessage(_arg_1:int)
        {
            _SafeStr_4385 = _arg_1;
        }

        public function get numberOfWords():int
        {
            return (_SafeStr_4385);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4385 = "_-61D" (String#19901, DoABC#4)


