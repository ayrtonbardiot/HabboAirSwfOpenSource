// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotSkillListUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetRentableBotSkillListUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const SKILL_LIST:String = "RWRBSLUE_SKILL_LIST";

        private var _SafeStr_5666:int;
        private var _SafeStr_5682:Array;

        public function RoomWidgetRentableBotSkillListUpdateEvent(_arg_1:int, _arg_2:Array, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super("RWRBSLUE_SKILL_LIST", _arg_3, _arg_4);
            _SafeStr_5666 = _arg_1;
            _SafeStr_5682 = _arg_2;
        }

        public function get botSkillsWithCommands():Array
        {
            return (_SafeStr_5682);
        }

        public function get botId():int
        {
            return (_SafeStr_5666);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_5666 = "_-32J" (String#3660, DoABC#4)
// _SafeStr_5682 = "_-R1v" (String#5397, DoABC#4)


