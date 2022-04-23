// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectModelDataUpdateMessage

package com.sulake.habbo.room.messages
{
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class RoomObjectModelDataUpdateMessage extends RoomObjectUpdateMessage 
    {

        private var _numberKey:String;
        private var _SafeStr_4840:int;

        public function RoomObjectModelDataUpdateMessage(_arg_1:String, _arg_2:int)
        {
            super(null, null);
            _numberKey = _arg_1;
            _SafeStr_4840 = _arg_2;
        }

        public function get numberKey():String
        {
            return (_numberKey);
        }

        public function get numberValue():int
        {
            return (_SafeStr_4840);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4840 = "_-7W" (String#22154, DoABC#4)


