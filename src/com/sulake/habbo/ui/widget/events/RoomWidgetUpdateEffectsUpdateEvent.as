// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEffectsUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const _SafeStr_9012:String = "RWUEUE_UPDATE_EFFECTS";

        private var _SafeStr_5396:Array;

        public function RoomWidgetUpdateEffectsUpdateEvent(_arg_1:Array=null, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super("RWUEUE_UPDATE_EFFECTS", _arg_2, _arg_3);
            _SafeStr_5396 = _arg_1;
        }

        public function get effects():Array
        {
            return (_SafeStr_5396);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_5396 = "_-gj" (String#3064, DoABC#4)
// _SafeStr_9012 = "_-m1O" (String#36384, DoABC#4)


