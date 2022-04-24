// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetEcotronBoxOpenMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetEcotronBoxOpenMessage extends RoomWidgetMessage 
    {

        public static const _SafeStr_9051:String = "RWEBOM_OPEN_ECOTRONBOX";

        private var _SafeStr_4157:int;

        public function RoomWidgetEcotronBoxOpenMessage(_arg_1:String, _arg_2:int)
        {
            super(_arg_1);
            _SafeStr_4157 = _arg_2;
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_9051 = "_-bX" (String#31722, DoABC#4)


