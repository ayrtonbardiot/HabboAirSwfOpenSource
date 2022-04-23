﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.utils._SafeStr_401

package com.sulake.habbo.utils
{
    import flash.geom.Matrix;
    import flash.geom.Rectangle;

    public class _SafeStr_401 
    {


        public static function normalize(_arg_1:Number, _arg_2:Number, _arg_3:Number):Number
        {
            return ((_arg_1 - _arg_2) / (_arg_3 - _arg_2));
        }

        public static function lerp(_arg_1:Number, _arg_2:Number, _arg_3:Number):Number
        {
            return ((_arg_1 * (_arg_3 - _arg_2)) + _arg_2);
        }

        public static function clamp(_arg_1:Number, _arg_2:Number=0, _arg_3:Number=1):Number
        {
            return (Math.max(_arg_2, Math.min(_arg_3, _arg_1)));
        }

        public static function map(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number):Number
        {
            return (lerp(normalize(_arg_1, _arg_2, _arg_3), _arg_4, _arg_5));
        }

        public static function rectangleTransformMatrix(_arg_1:Rectangle, _arg_2:Rectangle):Matrix
        {
            var _local_3:Matrix = new Matrix();
            _local_3.a = (_arg_2.width / _arg_1.width);
            _local_3.d = (_arg_2.height / _arg_1.height);
            _local_3.tx = (_arg_2.x - (_arg_1.x * _local_3.a));
            _local_3.ty = (_arg_2.y - (_arg_1.y * _local_3.d));
            return (_local_3);
        }


    }
}//package com.sulake.habbo.utils

// _SafeStr_401 = "_-e1d" (String#9279, DoABC#3)

