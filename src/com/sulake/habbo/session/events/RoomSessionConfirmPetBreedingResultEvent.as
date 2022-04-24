// by nota

//com.sulake.habbo.session.events.RoomSessionConfirmPetBreedingResultEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionConfirmPetBreedingResultEvent extends RoomSessionEvent 
    {

        public static const CONFIRM_PET_BREEDING_RESULT:String = "RSPFUE_CONFIRM_PET_BREEDING_RESULT";

        private var _SafeStr_6139:int;
        private var _SafeStr_4258:int;

        public function RoomSessionConfirmPetBreedingResultEvent(_arg_1:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super("RSPFUE_CONFIRM_PET_BREEDING_RESULT", _arg_1, _arg_4, _arg_5);
            _SafeStr_6139 = _arg_2;
            _SafeStr_4258 = _arg_3;
        }

        public function get breedingNestStuffId():int
        {
            return (_SafeStr_6139);
        }

        public function get result():int
        {
            return (_SafeStr_4258);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_4258 = "_-fc" (String#2827, DoABC#4)
// _SafeStr_6139 = "_-11Y" (String#10198, DoABC#4)


