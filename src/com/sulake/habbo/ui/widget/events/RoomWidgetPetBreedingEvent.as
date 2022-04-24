// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetPetBreedingEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetPetBreedingEvent extends RoomWidgetUpdateEvent 
    {

        public static const _SafeStr_8996:int = 0;
        public static const _SafeStr_8997:int = 1;
        public static const TYPE_ACCEPT:int = 2;
        public static const TYPE_REQUEST:int = 3;
        public static const PET_BREEDING:String = "RWPPBE_PET_BREEDING_";

        private var _SafeStr_3734:int;
        private var _SafeStr_5612:int;
        private var _SafeStr_5613:int;

        public function RoomWidgetPetBreedingEvent(_arg_1:Boolean=false, _arg_2:Boolean=false)
        {
            super("RWPPBE_PET_BREEDING_", _arg_1, _arg_2);
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function set state(_arg_1:int):void
        {
            _SafeStr_3734 = _arg_1;
        }

        public function get ownPetId():int
        {
            return (_SafeStr_5612);
        }

        public function set ownPetId(_arg_1:int):void
        {
            _SafeStr_5612 = _arg_1;
        }

        public function get otherPetId():int
        {
            return (_SafeStr_5613);
        }

        public function set otherPetId(_arg_1:int):void
        {
            _SafeStr_5613 = _arg_1;
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_5612 = "_-Wa" (String#10097, DoABC#4)
// _SafeStr_5613 = "_-H1h" (String#9043, DoABC#4)
// _SafeStr_8996 = "_-I1u" (String#39352, DoABC#4)
// _SafeStr_8997 = "_-sY" (String#31638, DoABC#4)


