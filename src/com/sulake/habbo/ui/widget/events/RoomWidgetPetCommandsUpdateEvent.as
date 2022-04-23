// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetPetCommandsUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetPetCommandsUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const PET_COMMANDS:String = "RWPCUE_PET_COMMANDS";
        public static const OPEN_PET_TRAINING:String = "RWPCUE_OPEN_PET_TRAINING";
        public static const CLOSE_PET_TRAINING:String = "RWPCUE_CLOSE_PET_TRAINING";

        private var _SafeStr_3820:int;
        private var _SafeStr_5505:Array;
        private var _SafeStr_5506:Array;

        public function RoomWidgetPetCommandsUpdateEvent(_arg_1:int, _arg_2:Array, _arg_3:Array, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super("RWPCUE_PET_COMMANDS", _arg_4, _arg_5);
            _SafeStr_3820 = _arg_1;
            _SafeStr_5505 = _arg_2;
            _SafeStr_5506 = _arg_3;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get allCommands():Array
        {
            return (_SafeStr_5505);
        }

        public function get enabledCommands():Array
        {
            return (_SafeStr_5506);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_5505 = "_-Pq" (String#18628, DoABC#4)
// _SafeStr_5506 = "_-M1R" (String#4674, DoABC#4)


