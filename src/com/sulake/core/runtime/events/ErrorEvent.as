// by nota

//com.sulake.core.runtime.events.ErrorEvent

package com.sulake.core.runtime.events
{
    public class ErrorEvent extends WarningEvent 
    {

        protected var _SafeStr_4158:int;
        protected var _SafeStr_8039:Boolean;
        protected var _SafeStr_6476:Error;

        public function ErrorEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean, _arg_4:int, _arg_5:Error=null)
        {
            _SafeStr_8039 = _arg_3;
            _SafeStr_4158 = _arg_4;
            _SafeStr_6476 = _arg_5;
            super(_arg_1, _arg_2);
        }

        public function get category():int
        {
            return (_SafeStr_4158);
        }

        public function get critical():Boolean
        {
            return (_SafeStr_8039);
        }

        public function get error():Error
        {
            return (_SafeStr_6476);
        }


    }
}//package com.sulake.core.runtime.events

// _SafeStr_4158 = "_-pH" (String#10006, DoABC#3)
// _SafeStr_6476 = "_-Cr" (String#7405, DoABC#3)
// _SafeStr_8039 = "_-i1K" (String#9527, DoABC#3)


