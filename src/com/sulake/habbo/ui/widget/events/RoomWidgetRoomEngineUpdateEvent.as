// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetRoomEngineUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetRoomEngineUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const GAME_MODE:String = "RWREUE_GAME_MODE";
        public static const NORMAL_MODE:String = "RWREUE_NORMAL_MODE";

        private var _SafeStr_3693:int = 0;

        public function RoomWidgetRoomEngineUpdateEvent(_arg_1:String, _arg_2:int, _arg_3:Boolean=false, _arg_4:Boolean=false)
        {
            super(_arg_1, _arg_3, _arg_4);
            _SafeStr_3693 = _arg_2;
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)


