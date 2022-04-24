// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetPetStatusUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetPetStatusUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const PET_STATUS_UPDATE:String = "RWPIUE_PET_STATUS_UPDATE";

        private var _SafeStr_5431:int;
        private var _SafeStr_5690:Boolean;
        private var _SafeStr_5820:Boolean;
        private var _SafeStr_5821:Boolean;
        private var _hasBreedingPermission:Boolean;

        public function RoomWidgetPetStatusUpdateEvent(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super("RWPIUE_PET_STATUS_UPDATE", _arg_6, _arg_7);
            _SafeStr_5431 = _arg_1;
            _SafeStr_5690 = _arg_2;
            _SafeStr_5820 = _arg_3;
            _SafeStr_5821 = _arg_4;
            _hasBreedingPermission = _arg_5;
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
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_5431 = "_-GK" (String#1818, DoABC#4)
// _SafeStr_5690 = "_-e1I" (String#3456, DoABC#4)
// _SafeStr_5820 = "_-m1s" (String#3859, DoABC#4)
// _SafeStr_5821 = "_-j1t" (String#3817, DoABC#4)


