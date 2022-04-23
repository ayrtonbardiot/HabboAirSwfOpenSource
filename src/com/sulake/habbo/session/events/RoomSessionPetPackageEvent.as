// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.RoomSessionPetPackageEvent

package com.sulake.habbo.session.events
{
    import _-Zz._SafeStr_1552;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetPackageEvent extends RoomSessionEvent 
    {

        public static const ROOM_SESSION_OPEN_PET_PACKAGE_REQUESTED:String = "RSOPPE_OPEN_PET_PACKAGE_REQUESTED";
        public static const ROOM_SESSION_OPEN_PET_PACKAGE_RESULT:String = "RSOPPE_OPEN_PET_PACKAGE_RESULT";

        private var _SafeStr_4157:int = -1;
        private var _SafeStr_4851:_SafeStr_1552;
        private var _nameValidationStatus:int = 0;
        private var _nameValidationInfo:String = null;

        public function RoomSessionPetPackageEvent(_arg_1:String, _arg_2:IRoomSession, _arg_3:int, _arg_4:_SafeStr_1552, _arg_5:int, _arg_6:String, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(_arg_1, _arg_2, _arg_7, _arg_8);
            _SafeStr_4157 = _arg_3;
            _SafeStr_4851 = _arg_4;
            _nameValidationStatus = _arg_5;
            _nameValidationInfo = _arg_6;
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get figureData():_SafeStr_1552
        {
            return (_SafeStr_4851);
        }

        public function get nameValidationStatus():int
        {
            return (_nameValidationStatus);
        }

        public function get nameValidationInfo():String
        {
            return (_nameValidationInfo);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_1552 = "_-JF" (String#13053, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4851 = "_-W1C" (String#4235, DoABC#4)


