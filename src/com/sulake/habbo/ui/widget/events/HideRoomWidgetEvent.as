// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.HideRoomWidgetEvent

package com.sulake.habbo.ui.widget.events
{
    import flash.events.Event;

    public class HideRoomWidgetEvent extends Event 
    {

        public static const HIDE_ROOM_WIDGET:String = "hrwe_hide_room_widget";

        private var _SafeStr_5034:String;

        public function HideRoomWidgetEvent(_arg_1:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super("hrwe_hide_room_widget", _arg_2, _arg_3);
            _SafeStr_5034 = _arg_1;
        }

        public function get widgetType():String
        {
            return (_SafeStr_5034);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_5034 = "_-k4" (String#8633, DoABC#4)


