// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.RoomSessionEvent

package com.sulake.habbo.session.events
{
    import flash.events.Event;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionEvent extends Event 
    {

        public static const _SafeStr_8907:String = "RSE_CREATED";
        public static const _SafeStr_8908:String = "RSE_STARTED";
        public static const _SafeStr_8909:String = "RSE_ENDED";
        public static const SESSION_ROOM_DATA:String = "RSE_ROOM_DATA";

        private var _session:IRoomSession;
        private var _SafeStr_4127:Boolean;

        public function RoomSessionEvent(_arg_1:String, _arg_2:IRoomSession, _arg_3:Boolean=true, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(_arg_1, _arg_4, _arg_5);
            _session = _arg_2;
            _SafeStr_4127 = _arg_3;
        }

        public function get session():IRoomSession
        {
            return (_session);
        }

        public function get openLandingPage():Boolean
        {
            return (_SafeStr_4127);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_4127 = "_-81y" (String#19787, DoABC#4)
// _SafeStr_8907 = "_-zo" (String#34612, DoABC#4)
// _SafeStr_8908 = "_-w1e" (String#32775, DoABC#4)
// _SafeStr_8909 = "_-qR" (String#32260, DoABC#4)


