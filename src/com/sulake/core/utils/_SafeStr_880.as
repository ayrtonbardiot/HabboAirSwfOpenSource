// by nota

//com.sulake.core.utils._SafeStr_880

package com.sulake.core.utils
{
    public class _SafeStr_880 
    {

        private static var _SafeStr_8089:_SafeStr_24 = new _SafeStr_24();


        public static function get(_arg_1:String):Object
        {
            return (_SafeStr_8089[_arg_1]);
        }

        public static function assign(_arg_1:String, _arg_2:Object):Object
        {
            var _local_3:* = _arg_2;
            _SafeStr_8089[_arg_1] = _local_3;
            return (_local_3);
        }

        public static function remove(_arg_1:String):Object
        {
            return (_SafeStr_8089.remove(_arg_1));
        }


    }
}//package com.sulake.core.utils

// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_8089 = "_-hv" (String#9511, DoABC#3)
// _SafeStr_880 = "_-o1k" (String#9934, DoABC#3)


