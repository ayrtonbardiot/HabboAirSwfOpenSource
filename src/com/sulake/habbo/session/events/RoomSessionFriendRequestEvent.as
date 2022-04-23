// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.RoomSessionFriendRequestEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionFriendRequestEvent extends RoomSessionEvent 
    {

        public static const FRIEND_REQUEST:String = "RSFRE_FRIEND_REQUEST";

        private var _SafeStr_4313:int = 0;
        private var _SafeStr_4128:int = 0;
        private var _userName:String;

        public function RoomSessionFriendRequestEvent(_arg_1:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:String, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super("RSFRE_FRIEND_REQUEST", _arg_1, _arg_5, _arg_6);
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
}//package com.sulake.habbo.session.events

// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4313 = "_-B7" (String#2703, DoABC#4)


