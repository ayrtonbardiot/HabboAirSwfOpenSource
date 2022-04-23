// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetSpamWallPostItEditEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetSpamWallPostItEditEvent extends RoomWidgetUpdateEvent 
    {

        public static const _SafeStr_9010:String = "RWSWPUE_OPEN_EDITOR";

        private var _SafeStr_4157:int;
        private var _location:String;
        private var _SafeStr_4652:String;

        public function RoomWidgetSpamWallPostItEditEvent(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:Boolean=false, _arg_6:Boolean=false)
        {
            super(_arg_1, _arg_5, _arg_6);
            _SafeStr_4157 = _arg_2;
            _location = _arg_3;
            _SafeStr_4652 = _arg_4;
        }

        public function get location():String
        {
            return (_location);
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get objectType():String
        {
            return (_SafeStr_4652);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4652 = "_-61C" (String#3402, DoABC#4)
// _SafeStr_9010 = "_-k1u" (String#35607, DoABC#4)


