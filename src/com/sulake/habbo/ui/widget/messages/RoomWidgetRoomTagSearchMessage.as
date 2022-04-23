// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetRoomTagSearchMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage 
    {

        public static const ROOM_TAG_SEARCH:String = "RWRTSM_ROOM_TAG_SEARCH";

        private var _SafeStr_4019:String = "";

        public function RoomWidgetRoomTagSearchMessage(_arg_1:String)
        {
            super("RWRTSM_ROOM_TAG_SEARCH");
            _SafeStr_4019 = _arg_1;
        }

        public function get tag():String
        {
            return (_SafeStr_4019);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4019 = "_-LH" (String#3197, DoABC#4)


