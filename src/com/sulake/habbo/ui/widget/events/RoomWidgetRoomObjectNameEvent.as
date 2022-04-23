// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectNameEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetRoomObjectNameEvent extends RoomWidgetUpdateEvent 
    {

        public static const OBJECT_NAME:String = "RWONE_TYPE";

        private var _SafeStr_4128:int;
        private var _SafeStr_4158:int;
        private var _userName:String;
        private var _SafeStr_5420:int;
        private var _SafeStr_5536:int;

        public function RoomWidgetRoomObjectNameEvent(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int)
        {
            _SafeStr_4128 = _arg_1;
            _SafeStr_4158 = _arg_2;
            _userName = _arg_3;
            _SafeStr_5420 = _arg_4;
            _SafeStr_5536 = _arg_5;
            super("RWONE_TYPE", false, false);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get userType():int
        {
            return (_SafeStr_5420);
        }

        public function get roomIndex():int
        {
            return (_SafeStr_5536);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_5420 = "_-S13" (String#2704, DoABC#4)
// _SafeStr_5536 = "_-517" (String#2777, DoABC#4)


