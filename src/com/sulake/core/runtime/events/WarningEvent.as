// by nota

//com.sulake.core.runtime.events.WarningEvent

package com.sulake.core.runtime.events
{
    import flash.events.Event;

    public class WarningEvent extends Event 
    {

        protected var _SafeStr_4132:String;

        public function WarningEvent(_arg_1:String, _arg_2:String)
        {
            _SafeStr_4132 = ((_arg_2 == null) ? "undefined" : _arg_2);
            super(_arg_1);
        }

        public function get message():String
        {
            return (_SafeStr_4132);
        }


    }
}//package com.sulake.core.runtime.events

// _SafeStr_4132 = "_-s1S" (String#10186, DoABC#3)


