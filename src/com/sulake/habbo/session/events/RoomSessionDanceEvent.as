// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.RoomSessionDanceEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionDanceEvent extends RoomSessionEvent 
    {

        public static const _SafeStr_8275:String = "RSDE_DANCE";

        private var _SafeStr_4128:int;
        private var _SafeStr_4126:int;

        public function RoomSessionDanceEvent(_arg_1:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super("RSDE_DANCE", _arg_1, _arg_4, _arg_5);
            _SafeStr_4128 = _arg_2;
            _SafeStr_4126 = _arg_3;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get danceStyle():int
        {
            return (_SafeStr_4126);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_4126 = "_-32L" (String#5358, DoABC#4)
// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_8275 = "_-5X" (String#24041, DoABC#4)


