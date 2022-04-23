// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_4110:int;
        private var _itemName:String;

        public function RoomObjectAvatarCarryObjectUpdateMessage(_arg_1:int, _arg_2:String)
        {
            _SafeStr_4110 = _arg_1;
            _itemName = _arg_2;
        }

        public function get itemType():int
        {
            return (_SafeStr_4110);
        }

        public function get itemName():String
        {
            return (_itemName);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4110 = "_-BF" (String#2380, DoABC#4)


