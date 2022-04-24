// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetFriendRequestUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetFriendRequestUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const SHOW_FRIEND_REQUEST:String = "RWFRUE_SHOW_FRIEND_REQUEST";
        public static const HIDE_FRIEND_REQUEST:String = "RWFRUE_HIDE_FRIEND_REQUEST";

        private var _SafeStr_4313:int;
        private var _SafeStr_4128:int;
        private var _userName:String;

        public function RoomWidgetFriendRequestUpdateEvent(_arg_1:String, _arg_2:int, _arg_3:int=0, _arg_4:String=null, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(_arg_1, _arg_5, _arg_6);
            _SafeStr_4313 = _arg_2;
            _SafeStr_4128 = _arg_3;
            _userName = _arg_4;
        }

        public function get requestId():int
        {
            return (_SafeStr_4313);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get userName():String
        {
            return (_userName);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4313 = "_-B7" (String#2703, DoABC#4)


