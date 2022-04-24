// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetHabboClubUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const _SafeStr_8688:String = "RWBIUE_HABBO_CLUB";

        private var _SafeStr_5470:int = 0;
        private var _SafeStr_5471:int = 0;
        private var _SafeStr_5472:int = 0;
        private var _SafeStr_5473:Boolean = false;
        private var _SafeStr_3827:int;

        public function RoomWidgetHabboClubUpdateEvent(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:int, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super("RWBIUE_HABBO_CLUB", _arg_6, _arg_7);
            _SafeStr_5470 = _arg_1;
            _SafeStr_5471 = _arg_2;
            _SafeStr_5472 = _arg_3;
            _SafeStr_5473 = _arg_4;
            _SafeStr_3827 = _arg_5;
        }

        public function get daysLeft():int
        {
            return (_SafeStr_5470);
        }

        public function get periodsLeft():int
        {
            return (_SafeStr_5471);
        }

        public function get pastPeriods():int
        {
            return (_SafeStr_5472);
        }

        public function get allowClubDances():Boolean
        {
            return (_SafeStr_5473);
        }

        public function get clubLevel():int
        {
            return (_SafeStr_3827);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3827 = "_-81k" (String#3560, DoABC#4)
// _SafeStr_5470 = "_-N1Z" (String#21313, DoABC#4)
// _SafeStr_5471 = "_-oY" (String#18177, DoABC#4)
// _SafeStr_5472 = "_-rX" (String#17952, DoABC#4)
// _SafeStr_5473 = "_-r1j" (String#21288, DoABC#4)
// _SafeStr_8688 = "_-o1j" (String#29360, DoABC#4)


