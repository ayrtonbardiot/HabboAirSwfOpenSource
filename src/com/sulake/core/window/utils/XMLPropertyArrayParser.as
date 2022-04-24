// by nota

//com.sulake.core.window.utils.XMLPropertyArrayParser

package com.sulake.core.window.utils
{
    import com.sulake.core.utils._SafeStr_3288;
    import com.sulake.core.utils._SafeStr_24;

    public class XMLPropertyArrayParser extends _SafeStr_3288 
    {


        public static function parse(_arg_1:XMLList):Array
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:_SafeStr_24 = new _SafeStr_24();
            var _local_3:Array = [];
            var _local_2:Array = [];
            _local_4 = _SafeStr_3288.parseVariableList(_arg_1, _local_6, _local_3);
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_2.push(new PropertyStruct(_local_6.getKey(_local_5), _local_6.getWithIndex(_local_5), _local_3[_local_5], true));
                _local_5++;
            };
            return (_local_2);
        }


    }
}//package com.sulake.core.window.utils

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3288 = "_-32u" (String#6754, DoABC#4)


