// by nota

//com.sulake.habbo.session.events.RoomSessionUserBadgesEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionUserBadgesEvent extends RoomSessionEvent 
    {

        public static const USER_BADGES:String = "RSUBE_BADGES";

        private var _SafeStr_4128:int = 0;
        private var _SafeStr_4145:Array = [];

        public function RoomSessionUserBadgesEvent(_arg_1:IRoomSession, _arg_2:int, _arg_3:Array, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super("RSUBE_BADGES", _arg_1, _arg_4, _arg_5);
            _SafeStr_4128 = _arg_2;
            _SafeStr_4145 = _arg_3;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get badges():Array
        {
            return (_SafeStr_4145);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4145 = "_-ZY" (String#1480, DoABC#4)


