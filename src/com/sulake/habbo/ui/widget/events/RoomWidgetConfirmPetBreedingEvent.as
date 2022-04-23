// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetConfirmPetBreedingEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetConfirmPetBreedingEvent extends RoomWidgetUpdateEvent 
    {

        public static const CONFIRM_PET_BREEDING:String = "RWPPBE_CONFIRM_PET_BREEDING_";

        private var _SafeStr_5998:int;
        private var _pet1:ConfirmPetBreedingPetData;
        private var _pet2:ConfirmPetBreedingPetData;
        private var _SafeStr_5997:Array;
        private var _SafeStr_5999:int;

        public function RoomWidgetConfirmPetBreedingEvent(_arg_1:int, _arg_2:ConfirmPetBreedingPetData, _arg_3:ConfirmPetBreedingPetData, _arg_4:Array, _arg_5:int, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super("RWPPBE_CONFIRM_PET_BREEDING_", _arg_6, _arg_7);
            _SafeStr_5998 = _arg_1;
            _pet1 = _arg_2;
            _pet2 = _arg_3;
            _SafeStr_5997 = _arg_4;
            _SafeStr_5999 = _arg_5;
        }

        public function get rarityCategories():Array
        {
            return (_SafeStr_5997);
        }

        public function get nestId():int
        {
            return (_SafeStr_5998);
        }

        public function get pet1():ConfirmPetBreedingPetData
        {
            return (_pet1);
        }

        public function get pet2():ConfirmPetBreedingPetData
        {
            return (_pet2);
        }

        public function get resultPetTypeId():int
        {
            return (_SafeStr_5999);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_5997 = "_-m1K" (String#6479, DoABC#4)
// _SafeStr_5998 = "_-p1C" (String#8912, DoABC#4)
// _SafeStr_5999 = "_-AZ" (String#6021, DoABC#4)


