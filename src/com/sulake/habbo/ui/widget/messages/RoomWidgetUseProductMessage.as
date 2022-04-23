// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetUseProductMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetUseProductMessage extends RoomWidgetMessage 
    {

        public static const PET_PRODUCT:String = "RWUPM_PET_PRODUCT";
        public static const MONSTERPLANT_SEED:String = "RWUPM_MONSTERPLANT_SEED";

        private var _SafeStr_6421:int = 0;
        private var _SafeStr_5431:int = -1;

        public function RoomWidgetUseProductMessage(_arg_1:String, _arg_2:int, _arg_3:int=-1)
        {
            super(_arg_1);
            _SafeStr_6421 = _arg_2;
            _SafeStr_5431 = _arg_3;
        }

        public function get roomObjectId():int
        {
            return (_SafeStr_6421);
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_5431 = "_-GK" (String#1818, DoABC#4)
// _SafeStr_6421 = "_-BA" (String#9199, DoABC#4)


