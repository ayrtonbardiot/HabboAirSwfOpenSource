// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetChangeMottoMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetChangeMottoMessage extends RoomWidgetMessage 
    {

        public static const CHANGE_MOTTO:String = "RWVM_CHANGE_MOTTO_MESSAGE";

        private var _SafeStr_4880:String;

        public function RoomWidgetChangeMottoMessage(_arg_1:String)
        {
            super("RWVM_CHANGE_MOTTO_MESSAGE");
            _SafeStr_4880 = _arg_1;
        }

        public function get motto():String
        {
            return (_SafeStr_4880);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4880 = "_-v1" (String#3385, DoABC#4)


