// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.RoomWidgetCreditFurniUpdateEvent

package com.sulake.habbo.ui.widget.events
{
    public class RoomWidgetCreditFurniUpdateEvent extends RoomWidgetUpdateEvent 
    {

        public static const UPDATE_CREDIT_FURNI:String = "RWCFUE_CREDIT_FURNI_UPDATE";

        private var _SafeStr_4157:int;
        private var _SafeStr_5970:Number;

        public function RoomWidgetCreditFurniUpdateEvent(_arg_1:String, _arg_2:int, _arg_3:Number, _arg_4:Boolean=false, _arg_5:Boolean=false)
        {
            super(_arg_1, _arg_4, _arg_5);
            _SafeStr_5970 = _arg_3;
            _SafeStr_4157 = _arg_2;
        }

        public function get creditValue():Number
        {
            return (_SafeStr_5970);
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_5970 = "_-xo" (String#9615, DoABC#4)


