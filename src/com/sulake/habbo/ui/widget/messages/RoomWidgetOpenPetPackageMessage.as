// by nota

//com.sulake.habbo.ui.widget.messages.RoomWidgetOpenPetPackageMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetOpenPetPackageMessage extends RoomWidgetMessage 
    {

        public static const WIDGET_MESSAGE_OPEN_PET_PACKAGE:String = "RWOPPM_OPEN_PET_PACKAGE";

        private var _SafeStr_4157:int;
        private var _name:String;

        public function RoomWidgetOpenPetPackageMessage(_arg_1:String, _arg_2:int, _arg_3:String)
        {
            super(_arg_1);
            _SafeStr_4157 = _arg_2;
            _name = _arg_3;
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get name():String
        {
            return (_name);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)


