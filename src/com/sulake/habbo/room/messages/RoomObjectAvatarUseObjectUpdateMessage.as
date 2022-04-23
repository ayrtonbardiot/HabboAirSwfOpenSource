// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarUseObjectUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_4110:int;

        public function RoomObjectAvatarUseObjectUpdateMessage(_arg_1:int)
        {
            _SafeStr_4110 = _arg_1;
        }

        public function get itemType():int
        {
            return (_SafeStr_4110);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4110 = "_-BF" (String#2380, DoABC#4)


