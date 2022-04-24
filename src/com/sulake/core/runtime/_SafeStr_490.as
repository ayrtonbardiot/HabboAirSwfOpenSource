// by nota

//com.sulake.core.runtime._SafeStr_490

package com.sulake.core.runtime
{
    [SecureSWF(rename="true")]
    public class _SafeStr_490 implements _SafeStr_489 
    {


        public function logError(_arg_1:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void
        {
            _SafeStr_14.log(_arg_1, ((_arg_4 != null) ? _arg_4.getStackTrace() : ""));
        }

        public function set errorLogger(_arg_1:_SafeStr_15):void
        {
        }


    }
}//package com.sulake.core.runtime

// _SafeStr_14 = "_-ED" (String#7490, DoABC#3)
// _SafeStr_15 = "_-11j" (String#6554, DoABC#3)
// _SafeStr_489 = "_-nI" (String#9899, DoABC#3)
// _SafeStr_490 = "_-G1a" (String#7599, DoABC#3)


