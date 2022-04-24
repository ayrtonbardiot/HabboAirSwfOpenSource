// by nota

//com.sulake.habbo.session.events.RoomSessionNestBreedingSuccessEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionNestBreedingSuccessEvent extends RoomSessionEvent 
    {

        public static const NEST_BREEDING_SUCCESS:String = "RSPFUE_NEST_BREEDING_SUCCESS";

        private var _SafeStr_6042:int;
        private var _SafeStr_5431:int;

        public function RoomSessionNestBreedingSuccessEvent(_arg_1:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super("RSPFUE_NEST_BREEDING_SUCCESS", _arg_1, _arg_4, _arg_5);
            _SafeStr_5431 = _arg_2;
            _SafeStr_6042 = _arg_3;
        }

        public function get rarityCategory():int
        {
            return (_SafeStr_6042);
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_5431 = "_-GK" (String#1818, DoABC#4)
// _SafeStr_6042 = "_-xC" (String#9475, DoABC#4)


