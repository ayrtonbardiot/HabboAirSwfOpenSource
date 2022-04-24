// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetOpenProfileMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetOpenProfileMessage extends RoomWidgetMessage 
    {

        public static const _SafeStr_9061:String = "RWOPEM_OPEN_USER_PROFILE";

        private var _SafeStr_4128:int;
        private var _trackingLocation:String;

        public function RoomWidgetOpenProfileMessage(_arg_1:String, _arg_2:int, _arg_3:String)
        {
            super(_arg_1);
            _SafeStr_4128 = _arg_2;
            _trackingLocation = _arg_3;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get trackingLocation():String
        {
            return (_trackingLocation);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_9061 = "_-L1M" (String#39198, DoABC#4)


