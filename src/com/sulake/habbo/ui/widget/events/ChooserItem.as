// by nota

//com.sulake.habbo.ui.widget.events.ChooserItem

package com.sulake.habbo.ui.widget.events
{
    public class ChooserItem 
    {

        private var _SafeStr_3820:int;
        private var _SafeStr_4158:int;
        private var _name:String;

        public function ChooserItem(_arg_1:int, _arg_2:int, _arg_3:String)
        {
            _SafeStr_3820 = _arg_1;
            _SafeStr_4158 = _arg_2;
            _name = _arg_3;
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


    }
}//package com.sulake.habbo.ui.widget.events

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_4158 = "_-pH" (String#830, DoABC#4)


