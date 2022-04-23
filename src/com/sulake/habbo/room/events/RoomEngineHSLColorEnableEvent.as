// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.room.events.RoomEngineHSLColorEnableEvent

package com.sulake.habbo.room.events
{
    public class RoomEngineHSLColorEnableEvent extends RoomEngineEvent 
    {

        public static const ROOM_BACKGROUND_COLOR:String = "ROHSLCEE_ROOM_BACKGROUND_COLOR";

        private var _SafeStr_5261:Boolean;
        private var _SafeStr_4609:int;
        private var _saturation:int;
        private var _SafeStr_4610:int;

        public function RoomEngineHSLColorEnableEvent(_arg_1:String, _arg_2:int, _arg_3:Boolean, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_7, _arg_8);
            _SafeStr_5261 = _arg_3;
            _SafeStr_4609 = _arg_4;
            _saturation = _arg_5;
            _SafeStr_4610 = _arg_6;
        }

        public function get enable():Boolean
        {
            return (_SafeStr_5261);
        }

        public function get hue():int
        {
            return (_SafeStr_4609);
        }

        public function get saturation():int
        {
            return (_saturation);
        }

        public function get lightness():int
        {
            return (_SafeStr_4610);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_4609 = "_-K1q" (String#4762, DoABC#4)
// _SafeStr_4610 = "_-M1Z" (String#4638, DoABC#4)
// _SafeStr_5261 = "_-D1f" (String#10122, DoABC#4)


