// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.events.UseProductItem

package com.sulake.habbo.ui.widget.events
{
    public class UseProductItem 
    {

        private var _SafeStr_3820:int;
        private var _SafeStr_4158:int;
        private var _name:String;
        private var _SafeStr_5539:int;
        private var _SafeStr_5540:int;
        private var _SafeStr_5541:int;
        private var _SafeStr_5542:Boolean;

        public function UseProductItem(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int=-1, _arg_7:Boolean=false)
        {
            _SafeStr_3820 = _arg_1;
            _SafeStr_4158 = _arg_2;
            _name = _arg_3;
            _SafeStr_5539 = _arg_4;
            _SafeStr_5540 = _arg_5;
            _SafeStr_5541 = _arg_6;
            _SafeStr_5542 = _arg_7;
        }

        public function dispose():void
        {
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get requestRoomObjectId():int
        {
            return (_SafeStr_5539);
        }

        public function get targetRoomObjectId():int
        {
            return (_SafeStr_5540);
        }

        public function get requestInventoryStripId():int
        {
            return (_SafeStr_5541);
        }

        public function get replace():Boolean
        {
            return (_SafeStr_5542);
        }


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)
// _SafeStr_5539 = "_-z10" (String#3398, DoABC#4)
// _SafeStr_5540 = "_-JK" (String#3926, DoABC#4)
// _SafeStr_5541 = "_-u0" (String#17978, DoABC#4)
// _SafeStr_5542 = "_-K1d" (String#22491, DoABC#4)


