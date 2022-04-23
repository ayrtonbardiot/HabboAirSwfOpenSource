// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.window.utils._SafeStr_3473

package com.sulake.habbo.window.utils
{
    public class _SafeStr_3473 
    {


        public static function getUserCountColor(_arg_1:int, _arg_2:int):uint
        {
            var _local_3:int = int((100 * (_arg_1 / _arg_2)));
            if (_local_3 >= 92)
            {
                return (4290917164);
            };
            if (_local_3 >= 80)
            {
                return (0xFFFFB11B);
            };
            if (_local_3 >= 50)
            {
                return (0xFFFFB11B);
            };
            if (_arg_1 > 0)
            {
                return (4284723554);
            };
            return (4291545793);
        }


    }
}//package com.sulake.habbo.window.utils

// _SafeStr_3473 = "_-va" (String#18441, DoABC#4)


