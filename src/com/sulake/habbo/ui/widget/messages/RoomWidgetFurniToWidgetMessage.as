// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetFurniToWidgetMessage extends RoomWidgetMessage 
    {

        public static const WIDGET_MESSAGE_REQUEST_CREDITFURNI_WIDGET:String = "RWFWM_MESSAGE_REQUEST_CREDITFURNI";
        public static const WIDGET_MESSAGE_REQUEST_STICKIE_WIDGET:String = "RWFWM_MESSAGE_REQUEST_STICKIE";
        public static const WIDGET_MESSAGE_REQUEST_PRESENT_WIDGET:String = "RWFWM_MESSAGE_REQUEST_PRESENT";
        public static const WIDGET_MESSAGE_REQUEST_TROPHY_WIDGET:String = "RWFWM_MESSAGE_REQUEST_TROPHY";
        public static const WIDGET_MESSAGE_REQUEST_TEASER_WIDGET:String = "RWFWM_MESSAGE_REQUEST_TEASER";
        public static const WIDGET_MESSAGE_REQUEST_ECOTRONBOX_WIDGET:String = "RWFWM_MESSAGE_REQUEST_ECOTRONBOX";
        public static const WIDGET_MESSAGE_REQUEST_DIMMER_WIDGET:String = "RWFWM_MESSAGE_REQUEST_DIMMER";
        public static const WIDGET_MESSAGE_REQUEST_PLACEHOLDER_WIDGET:String = "RWFWM_MESSAGE_REQUEST_PLACEHOLDER";
        public static const WIDGET_MESSAGE_REQUEST_CLOTHING_CHANGE_WIDGET:String = "RWFWM_MESSAGE_REQUEST_CLOTHING_CHANGE";
        public static const WIDGET_MESSAGE_REQUEST_PLAYLIST_EDITOR_WIDGET:String = "RWFWM_MESSAGE_REQUEST_PLAYLIST_EDITOR";
        public static const WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING:String = "RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_ENGRAVING";
        public static const _SafeStr_9054:String = "RWFWM_WIDGET_MESSAGE_REQUEST_ACHIEVEMENT_RESOLUTION_FAILED";
        public static const WIDGET_MESSAGE_REQUEST_BADGE_DISPLAY_ENGRAVING:String = "RWFWM_WIDGET_MESSAGE_REQUEST_BADGE_DISPLAY_ENGRAVING";

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_4158:int = 0;
        private var _SafeStr_3693:int = 0;

        public function RoomWidgetFurniToWidgetMessage(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int)
        {
            super(_arg_1);
            _SafeStr_3820 = _arg_2;
            _SafeStr_4158 = _arg_3;
            _SafeStr_3693 = _arg_4;
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_3693 = "_-KI" (String#730, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_9054 = "_-vD" (String#31578, DoABC#4)


