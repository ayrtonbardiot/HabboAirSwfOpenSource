// by nota

//com.sulake.habbo.room.events.RoomObjectDimmerStateUpdateEvent

package com.sulake.habbo.room.events
{
    import com.sulake.room.events.RoomObjectEvent;
    import com.sulake.room.object.IRoomObject;

    public class RoomObjectDimmerStateUpdateEvent extends RoomObjectEvent 
    {

        public static const _SafeStr_8710:String = "RODSUE_DIMMER_STATE";

        private var _SafeStr_3734:int;
        private var _SafeStr_4771:int;
        private var _SafeStr_4026:int;
        private var _color:uint;
        private var _SafeStr_4025:int;

        public function RoomObjectDimmerStateUpdateEvent(_arg_1:IRoomObject, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:uint, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super("RODSUE_DIMMER_STATE", _arg_1, _arg_7, _arg_8);
            _SafeStr_3734 = _arg_2;
            _SafeStr_4771 = _arg_3;
            _SafeStr_4026 = _arg_4;
            _color = _arg_5;
            _SafeStr_4025 = _arg_6;
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function get presetId():int
        {
            return (_SafeStr_4771);
        }

        public function get effectId():int
        {
            return (_SafeStr_4026);
        }

        public function get color():uint
        {
            return (_color);
        }

        public function get brightness():uint
        {
            return (_SafeStr_4025);
        }


    }
}//package com.sulake.habbo.room.events

// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_4025 = "_-TO" (String#3020, DoABC#4)
// _SafeStr_4026 = "_-710" (String#4026, DoABC#4)
// _SafeStr_4771 = "_-31J" (String#6247, DoABC#4)
// _SafeStr_8710 = "_-m1b" (String#23463, DoABC#4)


