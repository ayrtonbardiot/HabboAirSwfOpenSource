// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetPetLevelUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetPetLevelUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const PET_LEVEL_UPDATE:String = "RWPLUE_PET_LEVEL_UPDATE";

        private var _SafeStr_5431:int;
        private var _SafeStr_3623:int;

        public function RoomWidgetPetLevelUpdateEvent(_arg_1:int, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super("RWPLUE_PET_LEVEL_UPDATE", _arg_3, _arg_4);
            _SafeStr_5431 = _arg_1;
            _SafeStr_3623 = _arg_2;
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get level():int
        {
            return (_SafeStr_3623);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3623 = "_-OF" (String#2491, DoABC#4)
// _SafeStr_5431 = "_-GK" (String#1818, DoABC#4)


