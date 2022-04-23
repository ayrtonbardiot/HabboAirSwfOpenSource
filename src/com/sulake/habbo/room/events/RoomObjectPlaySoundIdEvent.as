// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.events.RoomObjectPlaySoundIdEvent

package com.sulake.habbo.room.events
{
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectPlaySoundIdEvent extends RoomObjectFurnitureActionEvent 
    {

        public static const PLAY_SOUND:String = "ROPSIE_PLAY_SOUND";
        public static const PLAY_SOUND_AT_PITCH:String = "ROPSIE_PLAY_SOUND_AT_PITCH";

        private var _SafeStr_4675:String;
        private var _SafeStr_4407:Number;

        public function RoomObjectPlaySoundIdEvent(_arg_1:String, _arg_2:IRoomObject, _arg_3:String, _arg_4:Number=1, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_5, _arg_6);
            _SafeStr_4675 = _arg_3;
            _SafeStr_4407 = _arg_4;
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


