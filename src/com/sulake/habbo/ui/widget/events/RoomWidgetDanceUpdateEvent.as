// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetDanceUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetDanceUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const _SafeStr_8989:String = "RWUE_DANCE";

        private var _style:int;

        public function RoomWidgetDanceUpdateEvent(_arg_1:int, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super("RWUE_DANCE", _arg_2, _arg_3);
            _style = _arg_1;
        }

        public function get style():int
        {
            return (_style);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_8989 = "_-MW" (String#39378, DoABC#4)


