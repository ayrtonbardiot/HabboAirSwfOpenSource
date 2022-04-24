// by nota

//com.sulake.habbo.room.events.RoomEngineObjectSamplePlaybackEvent

package com.sulake.habbo.room.events
{
    public class RoomEngineObjectSamplePlaybackEvent extends RoomEngineObjectEvent 
    {

        public static const ROOM_OBJECT_INITIALIZED:String = "REOSPE_ROOM_OBJECT_INITIALIZED";
        public static const ROOM_OBJECT_DISPOSED:String = "REOSPE_ROOM_OBJECT_DISPOSED";
        public static const PLAY_SAMPLE:String = "REOSPE_PLAY_SAMPLE";
        public static const CHANGE_PITCH:String = "REOSPE_CHANGE_PITCH";

        private var _SafeStr_4841:int;
        private var _SafeStr_4407:Number;

        public function RoomEngineObjectSamplePlaybackEvent(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:Number=1, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_4);
            _SafeStr_4841 = _arg_5;
            _SafeStr_4407 = _arg_6;
        }

        public function get sampleId():int
        {
            return (_SafeStr_4841);
        }

        public function get pitch():Number
        {
            return (_SafeStr_4407);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_4407 = "_-E1T" (String#3270, DoABC#4)
// _SafeStr_4841 = "_-81Q" (String#5100, DoABC#4)


