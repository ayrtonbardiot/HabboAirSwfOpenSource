// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetRoomQueueUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const VISITOR_QUEUE_STATUS:String = "RWRQUE_VISITOR_QUEUE_STATUS";
        public static const SPECTATOR_QUEUE_STATUS:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";

        private var _position:int;
        private var _SafeStr_5446:Boolean;
        private var _SafeStr_4495:Boolean;
        private var _SafeStr_4057:Boolean;

        public function RoomWidgetRoomQueueUpdateEvent(_arg_1:String, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super(_arg_1, _arg_6, _arg_7);
            _position = _arg_2;
            _SafeStr_5446 = _arg_3;
            _SafeStr_4495 = _arg_4;
            _SafeStr_4057 = _arg_5;
        }

        public function get position():int
        {
            return (_position);
        }

        public function get hasHabboClub():Boolean
        {
            return (_SafeStr_5446);
        }

        public function get isActive():Boolean
        {
            return (_SafeStr_4495);
        }

        public function get isClubQueue():Boolean
        {
            return (_SafeStr_4057);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4057 = "_-Y1f" (String#8287, DoABC#4)
// _SafeStr_4495 = "_-b12" (String#2547, DoABC#4)
// _SafeStr_5446 = "_-j1b" (String#17301, DoABC#4)


