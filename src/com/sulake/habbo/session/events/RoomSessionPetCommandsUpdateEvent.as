// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.events.RoomSessionPetCommandsUpdateEvent

package com.sulake.habbo.session.events
{
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetCommandsUpdateEvent extends RoomSessionEvent 
    {

        public static const PET_COMMANDS:String = "RSPIUE_ENABLED_PET_COMMANDS";

        private var _SafeStr_5431:int;
        private var _SafeStr_5432:Array;
        private var _SafeStr_5433:Array;

        public function RoomSessionPetCommandsUpdateEvent(_arg_1:IRoomSession, _arg_2:int, _arg_3:Array, _arg_4:Array, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super("RSPIUE_ENABLED_PET_COMMANDS", _arg_1, _arg_5, _arg_6);
            _SafeStr_5431 = _arg_2;
            _SafeStr_5432 = _arg_3;
            _SafeStr_5433 = _arg_4;
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get allCommands():Array
        {
            return (_SafeStr_5432);
        }

        public function get enabledCommands():Array
        {
            return (_SafeStr_5433);
        }


    }
}//package com.sulake.habbo.session.events

// _SafeStr_5431 = "_-GK" (String#1818, DoABC#4)
// _SafeStr_5432 = "_-lu" (String#8756, DoABC#4)
// _SafeStr_5433 = "_-515" (String#19820, DoABC#4)


