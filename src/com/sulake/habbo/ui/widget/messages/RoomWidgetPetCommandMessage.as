// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetPetCommandMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetPetCommandMessage extends RoomWidgetMessage 
    {

        public static const REQUEST_COMMANDS:String = "RWPCM_REQUEST_PET_COMMANDS";
        public static const PET_COMMAND:String = "RWPCM_PET_COMMAND";
        public static const BREED_TRAIN_COMMAND_ID:int = 46;

        private var _SafeStr_5431:int = 0;
        private var _SafeStr_4525:String;

        public function RoomWidgetPetCommandMessage(_arg_1:String, _arg_2:int, _arg_3:String=null)
        {
            super(_arg_1);
            _SafeStr_5431 = _arg_2;
            _SafeStr_4525 = _arg_3;
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get value():String
        {
            return (_SafeStr_4525);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4525 = "_-8S" (String#1037, DoABC#4)
// _SafeStr_5431 = "_-GK" (String#1818, DoABC#4)


