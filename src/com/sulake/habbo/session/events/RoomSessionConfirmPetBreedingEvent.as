// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.RoomSessionConfirmPetBreedingEvent

package com.sulake.habbo.session.events
{
    import _-b1c._SafeStr_1577;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionConfirmPetBreedingEvent extends RoomSessionEvent 
    {

        public static const CONFIRM_PET_BREEDING:String = "RSPFUE_CONFIRM_PET_BREEDING";

        private var _SafeStr_5998:int;
        private var _pet1:_SafeStr_1577;
        private var _pet2:_SafeStr_1577;
        private var _SafeStr_5997:Array;
        private var _SafeStr_5999:int;

        public function RoomSessionConfirmPetBreedingEvent(_arg_1:IRoomSession, _arg_2:int, _arg_3:_SafeStr_1577, _arg_4:_SafeStr_1577, _arg_5:Array, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super("RSPFUE_CONFIRM_PET_BREEDING", _arg_1, _arg_7, _arg_8);
            _SafeStr_5998 = _arg_2;
            _pet1 = _arg_3;
            _pet2 = _arg_4;
            _SafeStr_5997 = _arg_5;
            _SafeStr_5999 = _arg_6;
        }

        public function get rarityCategories():Array
        {
            return (_SafeStr_5997);
        }

        public function get nestId():int
        {
            return (_SafeStr_5998);
        }

        public function get pet1():_SafeStr_1577
        {
            return (_pet1);
        }

        public function get pet2():_SafeStr_1577
        {
            return (_pet2);
        }

        public function get resultPetTypeId():int
        {
            return (_SafeStr_5999);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_1577 = "_-i10" (String#11756, DoABC#4)
// _SafeStr_5997 = "_-m1K" (String#6479, DoABC#4)
// _SafeStr_5998 = "_-p1C" (String#8912, DoABC#4)
// _SafeStr_5999 = "_-AZ" (String#6021, DoABC#4)


