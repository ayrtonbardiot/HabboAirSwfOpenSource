// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.utils.ErrorReportStorage

package com.sulake.core.utils
{
    public class ErrorReportStorage 
    {

        private static var _SafeStr_8094:_SafeStr_24 = new _SafeStr_24();
        private static var _SafeStr_8095:_SafeStr_24 = new _SafeStr_24();


        public static function getDebugData():String
        {
            var _local_2:int;
            var _local_1:String = "";
            _local_2 = 0;
            while (_local_2 < _SafeStr_8095.length)
            {
                if (_local_2 == 0)
                {
                    _local_1 = _SafeStr_8095.getWithIndex(_local_2);
                }
                else
                {
                    _local_1 = ((_local_1 + " ** ") + _SafeStr_8095.getWithIndex(_local_2));
                };
                _local_2++;
            };
            if (_local_1.length > 400)
            {
                _local_1 = _local_1.substr((_local_1.length - 400));
            };
            return (_local_1);
        }

        public static function addDebugData(_arg_1:String, _arg_2:String):void
        {
            _SafeStr_8095.remove(_arg_1);
            _SafeStr_8095.add(_arg_1, _arg_2);
        }

        public static function setParameter(_arg_1:String, _arg_2:String):void
        {
            _SafeStr_8094[_arg_1] = _arg_2;
        }

        public static function getParameter(_arg_1:String):String
        {
            return (_SafeStr_8094[_arg_1]);
        }

        public static function getParameterNames():Array
        {
            return (_SafeStr_8094.getKeys());
        }


    }
}//package com.sulake.core.utils

// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_8094 = "_-i1Y" (String#9532, DoABC#3)
// _SafeStr_8095 = "_-L4" (String#7960, DoABC#3)


