// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.utils._SafeStr_3291

package com.sulake.habbo.utils
{
    import flash.display.BitmapData;
    import flash.geom.Matrix;

    public class _SafeStr_3291 
    {


        private static function resizeBitmapData(_arg_1:BitmapData, _arg_2:Number):BitmapData
        {
            var _local_3:BitmapData = new BitmapData(Math.round((_arg_1.width * _arg_2)), Math.round((_arg_1.height * _arg_2)), true, 0xFFFFFF);
            var _local_4:Matrix = new Matrix((_local_3.width / _arg_1.width), 0, 0, (_local_3.height / _arg_1.height), 0, 0);
            _local_3.draw(_arg_1, _local_4, null, null, null, true);
            return (_local_3);
        }

        public static function resampleBitmapData(_arg_1:BitmapData, _arg_2:Number):BitmapData
        {
            var _local_3:* = null;
            var _local_4:Number;
            if (_arg_2 >= 1)
            {
                return (resizeBitmapData(_arg_1, _arg_2));
            };
            _local_3 = _arg_1.clone();
            _local_4 = 1;
            do 
            {
                if (_arg_2 < (0.5 * _local_4))
                {
                    _local_3 = resizeBitmapData(_local_3, 0.5);
                    _local_4 = (0.5 * _local_4);
                }
                else
                {
                    _local_3 = resizeBitmapData(_local_3, (_arg_2 / _local_4));
                    _local_4 = _arg_2;
                };
            } while (_local_4 != _arg_2);
            return (_local_3);
        }


    }
}//package com.sulake.habbo.utils

// _SafeStr_3291 = "_-lX" (String#10764, DoABC#4)


