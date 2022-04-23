// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetGetBadgeImageMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage 
    {

        public static const WIDGET_MESSAGE_GET_BADGE_IMAGE:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";

        private var _SafeStr_4615:String = "";

        public function RoomWidgetGetBadgeImageMessage(_arg_1:String)
        {
            super("RWGOI_MESSAGE_GET_BADGE_IMAGE");
            _SafeStr_4615 = _arg_1;
        }

        public function get badgeId():String
        {
            return (_SafeStr_4615);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4615 = "_-91W" (String#2170, DoABC#4)


