// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetFloodControlEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetFloodControlEvent extends RoomWidgetUpdateEvent 
    {

        public static const _SafeStr_8992:String = "RWFCE_FLOOD_CONTROL";

        private var _SafeStr_5886:int = 0;

        public function RoomWidgetFloodControlEvent(_arg_1:int)
        {
            super("RWFCE_FLOOD_CONTROL", false, false);
            _SafeStr_5886 = _arg_1;
        }

        public function get seconds():int
        {
            return (_SafeStr_5886);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_5886 = "_-i1n" (String#17019, DoABC#4)
// _SafeStr_8992 = "_-KA" (String#39869, DoABC#4)


