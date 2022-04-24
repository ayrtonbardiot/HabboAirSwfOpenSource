// by nota

//com.sulake.habbo.ui.widget.events.RoomWidgetTrophyDataUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetTrophyDataUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const UPDATE_TROPHY_DATA:String = "RWTDUE_TROPHY_DATA";

        private var _color:Number;
        private var _name:String;
        private var _SafeStr_4810:String;
        private var _SafeStr_4132:String;
        private var _SafeStr_4811:int;

        public function RoomWidgetTrophyDataUpdateEvent(_arg_1:String, _arg_2:Number, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(_arg_1, _arg_7, _arg_8);
            _color = _arg_2;
            _name = _arg_3;
            _SafeStr_4810 = _arg_4;
            _SafeStr_4132 = _arg_5;
            _SafeStr_4811 = _arg_6;
        }

        public function get color():Number
        {
            return (_color);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get date():String
        {
            return (_SafeStr_4810);
        }

        public function get message():String
        {
            return (_SafeStr_4132);
        }

        public function get viewType():int
        {
            return (_SafeStr_4811);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4132 = "_-s1S" (String#1283, DoABC#4)
// _SafeStr_4810 = "_-zn" (String#3201, DoABC#4)
// _SafeStr_4811 = "_-r1b" (String#3566, DoABC#4)


