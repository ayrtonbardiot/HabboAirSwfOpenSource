// by nota

//com.sulake.habbo.session.events.RoomSessionPetLevelUpdateEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetLevelUpdateEvent extends RoomSessionEvent 
    {

        public static const PET_LEVEL_UPDATE:String = "RSPLUE_PET_LEVEL_UPDATE";

        private var _SafeStr_5431:int;
        private var _SafeStr_3623:int;

        public function RoomSessionPetLevelUpdateEvent(_arg_1:IRoomSession, _arg_2:int, _arg_3:int, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super("RSPLUE_PET_LEVEL_UPDATE", _arg_1, _arg_4, _arg_5);
            _SafeStr_5431 = _arg_2;
            _SafeStr_3623 = _arg_3;
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get level():int
        {
            return (_SafeStr_3623);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_3623 = "_-OF" (String#2491, DoABC#4)
// _SafeStr_5431 = "_-GK" (String#1818, DoABC#4)


