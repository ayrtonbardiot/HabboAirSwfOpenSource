// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetSelectEffectMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage 
    {

        public static const _SafeStr_9067:String = "RWCM_MESSAGE_SELECT_EFFECT";
        public static const _SafeStr_9068:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
        public static const _SafeStr_9069:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";

        private var _SafeStr_5341:int;

        public function RoomWidgetSelectEffectMessage(_arg_1:String, _arg_2:int=-1)
        {
            super(_arg_1);
            _SafeStr_5341 = _arg_2;
        }

        public function get effectType():int
        {
            return (_SafeStr_5341);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_5341 = "_-RW" (String#5292, DoABC#4)
// _SafeStr_9067 = "_-P11" (String#41315, DoABC#4)
// _SafeStr_9068 = "_-d9" (String#31824, DoABC#4)
// _SafeStr_9069 = "_-X0" (String#31900, DoABC#4)


