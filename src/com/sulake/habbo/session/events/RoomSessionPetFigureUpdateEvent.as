// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.RoomSessionPetFigureUpdateEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetFigureUpdateEvent extends RoomSessionEvent 
    {

        public static const PET_FIGURE_UPDATE:String = "RSPFUE_PET_FIGURE_UPDATE";

        private var _SafeStr_5431:int;
        private var _SafeStr_3819:String;

        public function RoomSessionPetFigureUpdateEvent(_arg_1:IRoomSession, _arg_2:int, _arg_3:String, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super("RSPFUE_PET_FIGURE_UPDATE", _arg_1, _arg_4, _arg_5);
            _SafeStr_5431 = _arg_2;
            _SafeStr_3819 = _arg_3;
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_3819 = "_-T8" (String#697, DoABC#4)
// _SafeStr_5431 = "_-GK" (String#1818, DoABC#4)


