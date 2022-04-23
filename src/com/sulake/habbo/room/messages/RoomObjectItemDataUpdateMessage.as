// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectItemDataUpdateMessage extends RoomObjectUpdateMessage 
    {

        private var _SafeStr_4101:String;

        public function RoomObjectItemDataUpdateMessage(_arg_1:String)
        {
            super(null, null);
            _SafeStr_4101 = _arg_1;
        }

        public function get itemData():String
        {
            return (_SafeStr_4101);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4101 = "_-C1F" (String#18477, DoABC#4)


