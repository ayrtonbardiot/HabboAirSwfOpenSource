// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage

package com.sulake.habbo.room.messages
{
    public class RoomObjectAvatarEffectUpdateMessage extends RoomObjectUpdateStateMessage 
    {

        private var _SafeStr_4386:int;
        private var _SafeStr_4387:int;

        public function RoomObjectAvatarEffectUpdateMessage(_arg_1:int=0, _arg_2:int=0)
        {
            _SafeStr_4386 = _arg_1;
            _SafeStr_4387 = _arg_2;
        }

        public function get effect():int
        {
            return (_SafeStr_4386);
        }

        public function get delayMilliSeconds():int
        {
            return (_SafeStr_4387);
        }


    }
}//package com.sulake.habbo.room.messages

// _SafeStr_4386 = "_-31d" (String#2977, DoABC#4)
// _SafeStr_4387 = "_-Rz" (String#18720, DoABC#4)


