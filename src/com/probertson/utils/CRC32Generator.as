// by nota

//com.probertson.utils.CRC32Generator

package com.probertson.utils
{
    import flash.utils.ByteArray;

    public class CRC32Generator 
    {

        private static var _SafeStr_7994:Array;
        private static var _SafeStr_7995:Boolean = false;


        private static function makeCRCTable():void
        {
            var _local_1:uint;
            var _local_2:int;
            var _local_3:int;
            _SafeStr_7994 = new Array(0x0100);
            _local_2 = 0;
            while (_local_2 < 0x0100)
            {
                _local_1 = _local_2;
                _local_3 = 0;
                while (_local_3 < 8)
                {
                    if ((_local_1 & 0x01) != 0)
                    {
                        _local_1 = (3988292384 ^ (_local_1 >>> 1));
                    }
                    else
                    {
                        _local_1 = (_local_1 >>> 1);
                    };
                    _local_3++;
                };
                _SafeStr_7994[_local_2] = _local_1;
                _local_2++;
            };
            _SafeStr_7995 = true;
        }


        public function generateCRC32(_arg_1:ByteArray):uint
        {
            var _local_4:int;
            if (!_SafeStr_7995)
            {
                makeCRCTable();
            };
            var _local_2:* = 0xFFFFFFFF;
            var _local_3:int = _arg_1.length;
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = (_SafeStr_7994[((_local_2 ^ _arg_1[_local_4]) & 0xFF)] ^ (_local_2 >>> 8));
                _local_4++;
            };
            _local_2 = (~(_local_2));
            return (_local_2 & 0xFFFFFFFF);
        }


    }
}//package com.probertson.utils

// _SafeStr_7994 = "_-xI" (String#10555, DoABC#3)
// _SafeStr_7995 = "_-Se" (String#8454, DoABC#3)


