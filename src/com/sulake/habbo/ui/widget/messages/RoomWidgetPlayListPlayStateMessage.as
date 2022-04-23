// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetPlayListPlayStateMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetPlayListPlayStateMessage extends RoomWidgetMessage 
    {

        public static const TOGGLE_PLAY_PAUSE:String = "RWPLPS_TOGGLE_PLAY_PAUSE";

        private var _SafeStr_4318:int;
        private var _position:int;

        public function RoomWidgetPlayListPlayStateMessage(_arg_1:String, _arg_2:int, _arg_3:int=-1)
        {
            super(_arg_1);
            _SafeStr_4318 = _arg_2;
            _position = _arg_3;
        }

        public function get furniId():int
        {
            return (_SafeStr_4318);
        }

        public function get position():int
        {
            return (_position);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4318 = "_-9J" (String#2342, DoABC#4)


