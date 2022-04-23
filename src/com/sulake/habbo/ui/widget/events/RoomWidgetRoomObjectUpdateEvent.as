// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetRoomObjectUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const _SafeStr_9004:String = "RWROUE_OBJECT_SELECTED";
        public static const _SafeStr_9005:String = "RWROUE_OBJECT_DESELECTED";
        public static const USER_REMOVED:String = "RWROUE_USER_REMOVED";
        public static const _SafeStr_9006:String = "RWROUE_FURNI_REMOVED";
        public static const _SafeStr_9007:String = "RWROUE_FURNI_ADDED";
        public static const USER_ADDED:String = "RWROUE_USER_ADDED";
        public static const OBJECT_ROLL_OVER:String = "RWROUE_OBJECT_ROLL_OVER";
        public static const _SafeStr_9008:String = "RWROUE_OBJECT_ROLL_OUT";

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_4158:int = 0;
        private var _SafeStr_3693:int = 0;

        public function RoomWidgetRoomObjectUpdateEvent(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(_arg_1, _arg_5, _arg_6);
            _SafeStr_3820 = _arg_2;
            _SafeStr_4158 = _arg_3;
            _SafeStr_3693 = _arg_4;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_9004 = "_-S" (String#40060, DoABC#4)
// _SafeStr_9005 = "_-11x" (String#35222, DoABC#4)
// _SafeStr_9006 = "_-w16" (String#32554, DoABC#4)
// _SafeStr_9007 = "_-Q1e" (String#40359, DoABC#4)
// _SafeStr_9008 = "_-By" (String#39705, DoABC#4)


