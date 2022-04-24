// by nota

//com.sulake.habbo.room.events.RoomEngineObjectPlaySoundEvent

package com.sulake.habbo.room.events
{
    public class RoomEngineObjectPlaySoundEvent extends RoomEngineObjectEvent 
    {

        public static const PLAY_SOUND:String = "REPSE_PLAY_SOUND";
        public static const PLAY_SOUND_AT_PITCH:String = "REPSE_PLAY_SOUND_AT_PITCH";

        private var _SafeStr_4675:String;
        private var _SafeStr_4407:Number;

        public function RoomEngineObjectPlaySoundEvent(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:String, _arg_6:Number=1, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_4675 = _arg_5;
            _SafeStr_4407 = _arg_6;
        }

        public function get soundId():String
        {
            return (_SafeStr_4675);
        }

        public function get pitch():Number
        {
            return (_SafeStr_4407);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_4407 = "_-E1T" (String#3270, DoABC#4)
// _SafeStr_4675 = "_-M1Q" (String#8793, DoABC#4)


