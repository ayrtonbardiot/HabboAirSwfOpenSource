// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetPurseUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetPurseUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const CREDIT_BALANCE:String = "RWPUE_CREDIT_BALANCE";
        public static const _SafeStr_9002:String = "RWPUE_PIXEL_BALANCE";
        public static const SHELL_BALANCE:String = "RWPUE_SHELL_BALANCE";

        private var _SafeStr_4712:int;

        public function RoomWidgetPurseUpdateEvent(_arg_1:String, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            _SafeStr_4712 = _arg_2;
        }

        public function get balance():int
        {
            return (_SafeStr_4712);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4712 = "_-O1J" (String#5664, DoABC#4)
// _SafeStr_9002 = "_-pQ" (String#32203, DoABC#4)


