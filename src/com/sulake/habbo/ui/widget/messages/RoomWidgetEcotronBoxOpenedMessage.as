// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetEcotronBoxOpenedMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetEcotronBoxOpenedMessage extends RoomWidgetMessage 
    {

        public static const _SafeStr_9050:String = "RWEBOM_ECOTRONBOX_OPENED";

        private var _SafeStr_4110:String;
        private var _SafeStr_4862:int;

        public function RoomWidgetEcotronBoxOpenedMessage(_arg_1:String, _arg_2:String, _arg_3:int)
        {
            super(_arg_1);
            _SafeStr_4110 = _arg_2;
            _SafeStr_4862 = _arg_3;
        }

        public function get itemType():String
        {
            return (_SafeStr_4110);
        }

        public function get classId():int
        {
            return (_SafeStr_4862);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4110 = "_-BF" (String#2380, DoABC#4)
// _SafeStr_4862 = "_-Q1H" (String#2645, DoABC#4)
// _SafeStr_9050 = "_-I1C" (String#39368, DoABC#4)


