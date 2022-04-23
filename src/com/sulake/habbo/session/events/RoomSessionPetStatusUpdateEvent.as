// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.RoomSessionPetStatusUpdateEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetStatusUpdateEvent extends RoomSessionEvent 
    {

        public static const PET_STATUS_UPDATE:String = "RSPFUE_PET_STATUS_UPDATE";

        private var _SafeStr_5431:int;
        private var _SafeStr_5690:Boolean;
        private var _SafeStr_5820:Boolean;
        private var _SafeStr_5821:Boolean;
        private var _hasBreedingPermission:Boolean;

        public function RoomSessionPetStatusUpdateEvent(_arg_1:IRoomSession, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super("RSPFUE_PET_STATUS_UPDATE", _arg_1, _arg_7, _arg_8);
            _SafeStr_5431 = _arg_2;
            _SafeStr_5690 = _arg_3;
            _SafeStr_5820 = _arg_4;
            _SafeStr_5821 = _arg_5;
            _hasBreedingPermission = _arg_6;
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get canBreed():Boolean
        {
            return (_SafeStr_5690);
        }

        public function get canHarvest():Boolean
        {
            return (_SafeStr_5820);
        }

        public function get canRevive():Boolean
        {
            return (_SafeStr_5821);
        }

        public function get hasBreedingPermission():Boolean
        {
            return (_hasBreedingPermission);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_5431 = "_-GK" (String#1818, DoABC#4)
// _SafeStr_5690 = "_-e1I" (String#3456, DoABC#4)
// _SafeStr_5820 = "_-m1s" (String#3859, DoABC#4)
// _SafeStr_5821 = "_-j1t" (String#3817, DoABC#4)


