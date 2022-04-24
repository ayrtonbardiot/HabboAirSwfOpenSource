// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetConfirmPetBreedingResultEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetConfirmPetBreedingResultEvent extends RoomWidgetUpdateEvent 
    {

        public static const CONFIRM_PET_BREEDING_RESULT:String = "RWPPBE_CONFIRM_PET_BREEDING_RESULT";
        public static const SUCCESS:int = 0;
        public static const _SafeStr_8988:int = 1;
        public static const PETS_MISSING:int = 2;
        public static const INVALID_NAME:int = 3;

        private var _SafeStr_6139:int;
        private var _SafeStr_4258:int;

        public function RoomWidgetConfirmPetBreedingResultEvent(_arg_1:int, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super("RWPPBE_CONFIRM_PET_BREEDING_RESULT", _arg_3, _arg_4);
            _SafeStr_6139 = _arg_1;
            _SafeStr_4258 = _arg_2;
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
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4258 = "_-fc" (String#2827, DoABC#4)
// _SafeStr_6139 = "_-11Y" (String#10198, DoABC#4)
// _SafeStr_8988 = "_-J1F" (String#38795, DoABC#4)


