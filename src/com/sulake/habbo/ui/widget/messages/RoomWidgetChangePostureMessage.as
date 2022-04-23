// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetChangePostureMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetChangePostureMessage extends RoomWidgetMessage 
    {

        public static const WIDGET_MESSAGE_CHANGE_POSTURE:String = "RWCPM_MESSAGE_CHANGE_POSTURE";
        public static const POSTURE_STAND:int = 0;
        public static const POSTURE_SIT:int = 1;

        private var _SafeStr_4375:int = 0;

        public function RoomWidgetChangePostureMessage(_arg_1:int)
        {
            super("RWCPM_MESSAGE_CHANGE_POSTURE");
            _SafeStr_4375 = _arg_1;
        }

        public function get posture():int
        {
            return (_SafeStr_4375);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4375 = "_-Q2" (String#2723, DoABC#4)


