// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetStickieDataUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const UPDATE_STICKIE_DATA:String = "RWSDUE_STICKIE_DATA";

        private var _SafeStr_4157:int = -1;
        private var _SafeStr_4652:String;
        private var _text:String;
        private var _SafeStr_4653:String;
        private var _SafeStr_4360:Boolean;

        public function RoomWidgetStickieDataUpdateEvent(_arg_1:String, _arg_2:int, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:Boolean, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(_arg_1, _arg_7, _arg_8);
            _SafeStr_4157 = _arg_2;
            _SafeStr_4652 = _arg_3;
            _text = _arg_4;
            _SafeStr_4653 = _arg_5;
            _SafeStr_4360 = _arg_6;
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get objectType():String
        {
            return (_SafeStr_4652);
        }

        public function get text():String
        {
            return (_text);
        }

        public function get colorHex():String
        {
            return (_SafeStr_4653);
        }

        public function get controller():Boolean
        {
            return (_SafeStr_4360);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_4652 = "_-61C" (String#3402, DoABC#4)
// _SafeStr_4653 = "_-m10" (String#3030, DoABC#4)


