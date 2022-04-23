// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.geometry.Vector3D

package com.sulake.habbo.avatar.geometry
{
    public class Vector3D 
    {

        private var _SafeStr_4050:Number;
        private var _SafeStr_4051:Number;
        private var _SafeStr_4052:Number;

        public function Vector3D(_arg_1:Number=0, _arg_2:Number=0, _arg_3:Number=0)
        {
            _SafeStr_4050 = _arg_1;
            _SafeStr_4051 = _arg_2;
            _SafeStr_4052 = _arg_3;
        }

        public static function dot(_arg_1:Vector3D, _arg_2:Vector3D):Number
        {
            return (((_arg_1.x * _arg_2.x) + (_arg_1.y * _arg_2.y)) + (_arg_1.z * _arg_2.z));
        }

        public static function cross(_arg_1:Vector3D, _arg_2:Vector3D):Vector3D
        {
            var _local_3:Vector3D = new (Vector3D)();
            _local_3.x = ((_arg_1.y * _arg_2.z) - (_arg_1.z * _arg_2.y));
            _local_3.y = ((_arg_1.z * _arg_2.x) - (_arg_1.x * _arg_2.z));
            _local_3.z = ((_arg_1.x * _arg_2.y) - (_arg_1.y * _arg_2.x));
            return (_local_3);
        }

        public static function subtract(_arg_1:Vector3D, _arg_2:Vector3D):Vector3D
        {
            return (new Vector3D((_arg_1.x - _arg_2.x), (_arg_1.y - _arg_2.y), (_arg_1.z - _arg_2.z)));
        }


        public function dot(_arg_1:Vector3D):Number
        {
            return (((_SafeStr_4050 * _arg_1.x) + (_SafeStr_4051 * _arg_1.y)) + (_SafeStr_4052 * _arg_1.z));
        }

        public function cross(_arg_1:Vector3D):Vector3D
        {
            var _local_2:Vector3D = new Vector3D();
            _local_2.x = ((_SafeStr_4051 * _arg_1.z) - (_SafeStr_4052 * _arg_1.y));
            _local_2.y = ((_SafeStr_4052 * _arg_1.x) - (_SafeStr_4050 * _arg_1.z));
            _local_2.z = ((_SafeStr_4050 * _arg_1.y) - (_SafeStr_4051 * _arg_1.x));
            return (_local_2);
        }

        public function subtract(_arg_1:Vector3D):void
        {
            _SafeStr_4050 = (_SafeStr_4050 - _arg_1.x);
            _SafeStr_4051 = (_SafeStr_4051 - _arg_1.y);
            _SafeStr_4052 = (_SafeStr_4052 - _arg_1.z);
        }

        public function add(_arg_1:Vector3D):void
        {
            _SafeStr_4050 = (_SafeStr_4050 + _arg_1.x);
            _SafeStr_4051 = (_SafeStr_4051 + _arg_1.y);
            _SafeStr_4052 = (_SafeStr_4052 + _arg_1.z);
        }

        public function normalize():void
        {
            var _local_1:Number = (1 / this.length());
            _SafeStr_4050 = (_SafeStr_4050 * _local_1);
            _SafeStr_4051 = (_SafeStr_4051 * _local_1);
            _SafeStr_4052 = (_SafeStr_4052 * _local_1);
        }

        public function length():Number
        {
            return (Math.sqrt((((_SafeStr_4050 * _SafeStr_4050) + (_SafeStr_4051 * _SafeStr_4051)) + (_SafeStr_4052 * _SafeStr_4052))));
        }

        public function toString():String
        {
            return (((((("Vector3D: (" + _SafeStr_4050) + ",") + _SafeStr_4051) + ",") + _SafeStr_4052) + ")");
        }

        public function get x():Number
        {
            return (_SafeStr_4050);
        }

        public function get y():Number
        {
            return (_SafeStr_4051);
        }

        public function get z():Number
        {
            return (_SafeStr_4052);
        }

        public function set x(_arg_1:Number):void
        {
            _SafeStr_4050 = _arg_1;
        }

        public function set y(_arg_1:Number):void
        {
            _SafeStr_4051 = _arg_1;
        }

        public function set z(_arg_1:Number):void
        {
            _SafeStr_4052 = _arg_1;
        }


    }
}//package com.sulake.habbo.avatar.geometry

// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_4052 = "_-Rt" (String#1279, DoABC#4)


