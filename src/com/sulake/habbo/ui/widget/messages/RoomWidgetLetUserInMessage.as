// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetLetUserInMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetLetUserInMessage extends RoomWidgetMessage 
    {

        public static const LET_USER_IN:String = "RWLUIM_LET_USER_IN";

        private var _userName:String;
        private var _SafeStr_5465:Boolean;

        public function RoomWidgetLetUserInMessage(_arg_1:String, _arg_2:Boolean)
        {
            super("RWLUIM_LET_USER_IN");
            _userName = _arg_1;
            _SafeStr_5465 = _arg_2;
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get canEnter():Boolean
        {
            return (_SafeStr_5465);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_5465 = "_-A1M" (String#18388, DoABC#4)


