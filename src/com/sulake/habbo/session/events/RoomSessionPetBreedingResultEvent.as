// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.RoomSessionPetBreedingResultEvent

package com.sulake.habbo.session.events
{
    import _-b1c._SafeStr_1532;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetBreedingResultEvent extends RoomSessionEvent 
    {

        public static const PET_BREEDING_RESULT:String = "RSPFUE_PET_BREEDING_RESULT";

        private var _SafeStr_5990:_SafeStr_1532;
        private var _SafeStr_6097:_SafeStr_1532;

        public function RoomSessionPetBreedingResultEvent(_arg_1:IRoomSession, _arg_2:_SafeStr_1532, _arg_3:_SafeStr_1532, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super("RSPFUE_PET_BREEDING_RESULT", _arg_1, _arg_4, _arg_5);
            _SafeStr_5990 = _arg_2;
            _SafeStr_6097 = _arg_3;
        }

        public function get resultData():_SafeStr_1532
        {
            return (_SafeStr_5990);
        }

        public function get otherResultData():_SafeStr_1532
        {
            return (_SafeStr_6097);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_1532 = "_-2k" (String#13498, DoABC#4)
// _SafeStr_5990 = "_-w1h" (String#3032, DoABC#4)
// _SafeStr_6097 = "_-j1F" (String#16092, DoABC#4)


