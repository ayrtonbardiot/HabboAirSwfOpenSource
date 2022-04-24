// by nota

//com.sulake.habbo.game.snowwar.utils.Location3D

package com.sulake.habbo.game.snowwar.utils
{
    import com.sulake.core.runtime._SafeStr_13;

    public class Location3D implements _SafeStr_13 
    {

        private var _SafeStr_4050:int;
        private var _SafeStr_4051:int;
        private var _SafeStr_4052:int;
        private var _SafeStr_4036:Boolean = false;

        public function Location3D(_arg_1:int, _arg_2:int, _arg_3:int)
        {
            _SafeStr_4050 = _arg_1;
            _SafeStr_4051 = _arg_2;
            _SafeStr_4052 = _arg_3;
        }

        public static function isInDistanceStatic(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int):Boolean
        {
            var _local_7:int = (_arg_3 - _arg_1);
            if (_local_7 < 0)
            {
                _local_7 = -(_local_7);
            };
            var _local_6:int = (_arg_4 - _arg_2);
            if (_local_6 < 0)
            {
                _local_6 = -(_local_6);
            };
            if (((_local_6 > _arg_5) || (_local_7 > _arg_5)))
            {
                return (false);
            };
            if (((_local_7 * _local_7) + (_local_6 * _local_6)) < (_arg_5 * _arg_5))
            {
                return (true);
            };
            return (false);
        }


        public function dispose():void
        {
            _SafeStr_4050 = 0;
            _SafeStr_4051 = 0;
            _SafeStr_4052 = 0;
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get x():int
        {
            return (_SafeStr_4050);
        }

        public function get y():int
        {
            return (_SafeStr_4051);
        }

        public function get z():int
        {
            return (_SafeStr_4052);
        }

        public function changeLocation(_arg_1:int, _arg_2:int, _arg_3:int):void
        {
            _SafeStr_4050 = _arg_1;
            _SafeStr_4051 = _arg_2;
            _SafeStr_4052 = _arg_3;
        }

        public function change2DLocation(_arg_1:int, _arg_2:int):void
        {
            _SafeStr_4050 = _arg_1;
            _SafeStr_4051 = _arg_2;
        }

        public function changeLocationToLocation(_arg_1:Location3D):void
        {
            _SafeStr_4050 = _arg_1._SafeStr_4050;
            _SafeStr_4051 = _arg_1._SafeStr_4051;
            _SafeStr_4052 = _arg_1._SafeStr_4052;
        }

        public function distanceTo(_arg_1:Location3D):int
        {
            var _local_2:int = (_arg_1._SafeStr_4050 - _SafeStr_4050);
            var _local_3:int = (_arg_1._SafeStr_4051 - _SafeStr_4051);
            var _local_4:int = (_arg_1._SafeStr_4052 - _SafeStr_4052);
            var _local_5:int = ((Math.abs(_local_2) + Math.abs(_local_3)) + Math.abs(_local_4));
            return (_local_5);
        }

        public function directionTo(_arg_1:Location3D):Direction8
        {
            if (((_arg_1._SafeStr_4050 == _SafeStr_4050) && (_arg_1._SafeStr_4051 == _SafeStr_4051)))
            {
                return (null);
            };
            var _local_3:int = (_arg_1._SafeStr_4050 - _SafeStr_4050);
            var _local_2:int = (_arg_1._SafeStr_4051 - _SafeStr_4051);
            var _local_4:int = Direction360.getAngleFromComponents(_local_3, _local_2);
            return (Direction360.direction360ValueToDirection8(_local_4));
        }

        public function equals(_arg_1:Object):Boolean
        {
            if (this == _arg_1)
            {
                return (true);
            };
            if (!(_arg_1 is Location3D))
            {
                return (false);
            };
            var _local_2:Location3D = Location3D(_arg_1);
            if (_SafeStr_4050 != _local_2._SafeStr_4050)
            {
                return (false);
            };
            if (_SafeStr_4051 != _local_2._SafeStr_4051)
            {
                return (false);
            };
            if (_SafeStr_4052 != _local_2._SafeStr_4052)
            {
                return (false);
            };
            return (true);
        }

        public function hashCode():int
        {
            var _local_1:int;
            _local_1 = _SafeStr_4050;
            _local_1 = ((29 * _local_1) + _SafeStr_4051);
            return ((29 * _local_1) + _SafeStr_4052);
        }

        public function toString():String
        {
            return ((((("_x:" + _SafeStr_4050) + "yy:") + _SafeStr_4051) + "_zz:") + _SafeStr_4052);
        }

        public function isInDistance(_arg_1:Location3D, _arg_2:int):Boolean
        {
            return (isInDistanceStatic(_SafeStr_4050, _SafeStr_4051, _arg_1._SafeStr_4050, _arg_1._SafeStr_4051, _arg_2));
        }


    }
}//package com.sulake.habbo.game.snowwar.utils

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4050 = "_-22N" (String#402, DoABC#4)
// _SafeStr_4051 = "_-1L" (String#429, DoABC#4)
// _SafeStr_4052 = "_-Rt" (String#1279, DoABC#4)


