// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.RoomSessionPetBreedingEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetBreedingEvent extends RoomSessionEvent 
    {

        public static const PET_BREEDING:String = "RSPFUE_PET_BREEDING";

        private var _SafeStr_3734:int;
        private var _SafeStr_5612:int;
        private var _SafeStr_5613:int;

        public function RoomSessionPetBreedingEvent(_arg_1:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super("RSPFUE_PET_BREEDING", _arg_1, _arg_5, _arg_6);
            _SafeStr_3734 = _arg_2;
            _SafeStr_5612 = _arg_3;
            _SafeStr_5613 = _arg_4;
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function get ownPetId():int
        {
            return (_SafeStr_5612);
        }

        public function get otherPetId():int
        {
            return (_SafeStr_5613);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_5612 = "_-Wa" (String#10097, DoABC#4)
// _SafeStr_5613 = "_-H1h" (String#9043, DoABC#4)


