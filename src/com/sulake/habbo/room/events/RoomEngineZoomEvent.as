// by nota

//com.sulake.habbo.room.events.RoomEngineZoomEvent

package com.sulake.habbo.room.events
{
    public class RoomEngineZoomEvent extends RoomEngineEvent 
    {

        public static const ROOM_ZOOM:String = "REE_ROOM_ZOOM";

        private var _SafeStr_3623:Number = 1;
        private var _SafeStr_5031:Boolean = false;

        public function RoomEngineZoomEvent(_arg_1:int, _arg_2:Number, _arg_3:*=false, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super("REE_ROOM_ZOOM", _arg_1, _arg_4, _arg_5);
            _SafeStr_3623 = _arg_2;
            _SafeStr_5031 = _arg_3;
        }

        public function get level():Number
        {
            return (_SafeStr_3623);
        }

        public function get isFlipForced():Boolean
        {
            return (_SafeStr_5031);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_3623 = "_-OF" (String#2491, DoABC#4)
// _SafeStr_5031 = "_-6I" (String#22167, DoABC#4)


