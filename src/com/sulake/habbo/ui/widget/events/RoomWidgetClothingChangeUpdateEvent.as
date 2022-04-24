// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetClothingChangeUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetClothingChangeUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const SHOW_GENDER_SELECTION:String = "RWCCUE_SHOW_GENDER_SELECTION";
        public static const SHOW_CLOTHING_EDITOR:String = "RWCCUE_SHOW_CLOTHING_EDITOR";

        private var _SafeStr_4157:int = -1;
        private var _SafeStr_4750:int = -1;
        private var _SafeStr_3693:int = -1;

        public function RoomWidgetClothingChangeUpdateEvent(_arg_1:String, _arg_2:int=0, _arg_3:int=0, _arg_4:int=0, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(_arg_1, _arg_5, _arg_6);
            _SafeStr_4157 = _arg_2;
            _SafeStr_4750 = _arg_3;
            _SafeStr_3693 = _arg_4;
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get objectCategory():int
        {
            return (_SafeStr_4750);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4750 = "_-E1d" (String#2700, DoABC#4)


