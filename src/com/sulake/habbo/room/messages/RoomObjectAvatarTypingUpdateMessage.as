// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarTypingUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_5030:Boolean;

        public function RoomObjectAvatarTypingUpdateMessage(_arg_1:Boolean=false)
        {
            _SafeStr_5030 = _arg_1;
        }

        public function get isTyping():Boolean
        {
            return (_SafeStr_5030);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_5030 = "_-KT" (String#3697, DoABC#4)


