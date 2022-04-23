// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.messages.RoomWidgetConversionPointMessage

package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetConversionPointMessage extends RoomWidgetMessage 
    {

        public static const _SafeStr_9046:String = "RWCPM_CONVERSION_POINT";

        private var _SafeStr_4158:String;
        private var _SafeStr_6533:String;
        private var _action:String;
        private var _extraString:String;
        private var _SafeStr_6534:int;

        public function RoomWidgetConversionPointMessage(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:String="", _arg_6:int=0)
        {
            super(_arg_1);
            _SafeStr_4158 = _arg_2;
            _SafeStr_6533 = _arg_3;
            _action = _arg_4;
            _extraString = ((_arg_5) ? _arg_5 : "");
            _SafeStr_6534 = ((_arg_6) ? _arg_6 : 0);
        }

        public function get category():String
        {
            return (_SafeStr_4158);
        }

        public function get pointType():String
        {
            return (_SafeStr_6533);
        }

        public function get action():String
        {
            return (_action);
        }

        public function get extraString():String
        {
            return (_extraString);
        }

        public function get extraInt():int
        {
            return (_SafeStr_6534);
        }


    }
}//package com.sulake.habbo.ui.widget.messages

// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_6533 = "_-N1o" (String#21317, DoABC#4)
// _SafeStr_6534 = "_-UH" (String#19237, DoABC#4)
// _SafeStr_9046 = "_-u1" (String#31631, DoABC#4)


