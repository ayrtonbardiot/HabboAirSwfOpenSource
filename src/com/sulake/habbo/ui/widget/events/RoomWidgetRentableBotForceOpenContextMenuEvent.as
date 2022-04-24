// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetRentableBotForceOpenContextMenuEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetRentableBotForceOpenContextMenuEvent extends RoomWidgetUpdateEvent 
    {

        public static const _SafeStr_9003:String = "RWRBFOCME_OPEN";

        private var _SafeStr_5666:int;

        public function RoomWidgetRentableBotForceOpenContextMenuEvent(_arg_1:int)
        {
            _SafeStr_5666 = _arg_1;
            super("RWRBFOCME_OPEN");
        }

        public function get botId():int
        {
            return (_SafeStr_5666);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_5666 = "_-32J" (String#3660, DoABC#4)
// _SafeStr_9003 = "_-t1o" (String#39207, DoABC#4)


