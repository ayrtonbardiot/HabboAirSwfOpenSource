// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetAvatarInfoEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetAvatarInfoEvent extends RoomWidgetUpdateEvent 
    {

        public static const AVATAR_INFO:String = "RWAIE_AVATAR_INFO";

        private var _SafeStr_4128:int;
        private var _userName:String;
        private var _SafeStr_5420:int;
        private var _SafeStr_5537:Boolean;
        private var _SafeStr_5536:int;

        public function RoomWidgetAvatarInfoEvent(_arg_1:int, _arg_2:String, _arg_3:int, _arg_4:int, _arg_5:Boolean, _arg_6:Boolean=false, _arg_7:Boolean=false)
        {
            super("RWAIE_AVATAR_INFO", _arg_6, _arg_7);
            _SafeStr_4128 = _arg_1;
            _userName = _arg_2;
            _SafeStr_5420 = _arg_3;
            _SafeStr_5536 = _arg_4;
            _SafeStr_5537 = _arg_5;
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
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

        public function get allowNameChange():Boolean
        {
            return (_SafeStr_5537);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4128 = "_-q1y" (String#518, DoABC#4)
// _SafeStr_5420 = "_-S13" (String#2704, DoABC#4)
// _SafeStr_5536 = "_-517" (String#2777, DoABC#4)
// _SafeStr_5537 = "_-wn" (String#3638, DoABC#4)


