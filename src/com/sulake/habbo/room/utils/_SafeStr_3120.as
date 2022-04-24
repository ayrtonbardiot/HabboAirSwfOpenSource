// by nota

//com.sulake.habbo.room.utils._SafeStr_3120

package com.sulake.habbo.room.utils
{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.utils.IVector3d;

    [SecureSWF(rename="true")]
    public class _SafeStr_3120 
    {

        private static const MOVE_SPEED_DENOMINATOR:Number = 12;

        private var _SafeStr_4061:int = -1;
        private var _SafeStr_4062:int = -2;
        private var _SafeStr_4073:Vector3d = null;
        private var _SafeStr_4075:Number = 0;
        private var _SafeStr_4077:Number = 0;
        private var _SafeStr_4076:Boolean = false;
        private var _SafeStr_4060:Vector3d = null;
        private var _SafeStr_4063:Vector3d = new Vector3d();
        private var _SafeStr_4064:Boolean = false;
        private var _SafeStr_4065:Boolean = false;
        private var _SafeStr_4066:Boolean = false;
        private var _SafeStr_4067:Boolean = false;
        private var _SafeStr_4068:int = 0;
        private var _SafeStr_4069:int = 0;
        private var _SafeStr_4045:int = 0;
        private var _SafeStr_4070:int = 0;
        private var _SafeStr_4071:int = 0;
        private var _SafeStr_4072:int = -1;
        private var _SafeStr_4074:Boolean = false;
        private var _followDuration:int;


        public function get location():IVector3d
        {
            return (_SafeStr_4060);
        }

        public function get targetId():int
        {
            return (_SafeStr_4061);
        }

        public function get targetCategory():int
        {
            return (_SafeStr_4062);
        }

        public function get targetObjectLoc():IVector3d
        {
            return (_SafeStr_4063);
        }

        public function get limitedLocationX():Boolean
        {
            return (_SafeStr_4064);
        }

        public function get limitedLocationY():Boolean
        {
            return (_SafeStr_4065);
        }

        public function get centeredLocX():Boolean
        {
            return (_SafeStr_4066);
        }

        public function get centeredLocY():Boolean
        {
            return (_SafeStr_4067);
        }

        public function get screenWd():int
        {
            return (_SafeStr_4068);
        }

        public function get screenHt():int
        {
            return (_SafeStr_4069);
        }

        public function get scale():int
        {
            return (_SafeStr_4045);
        }

        public function get roomWd():int
        {
            return (_SafeStr_4070);
        }

        public function get roomHt():int
        {
            return (_SafeStr_4071);
        }

        public function get geometryUpdateId():int
        {
            return (_SafeStr_4072);
        }

        public function get isMoving():Boolean
        {
            if (((!(_SafeStr_4073 == null)) && (!(_SafeStr_4060 == null))))
            {
                return (true);
            };
            return (false);
        }

        public function set targetId(_arg_1:int):void
        {
            _SafeStr_4061 = _arg_1;
        }

        public function set targetObjectLoc(_arg_1:IVector3d):void
        {
            _SafeStr_4063.assign(_arg_1);
        }

        public function set targetCategory(_arg_1:int):void
        {
            _SafeStr_4062 = _arg_1;
        }

        public function set limitedLocationX(_arg_1:Boolean):void
        {
            _SafeStr_4064 = _arg_1;
        }

        public function set limitedLocationY(_arg_1:Boolean):void
        {
            _SafeStr_4065 = _arg_1;
        }

        public function set centeredLocX(_arg_1:Boolean):void
        {
            _SafeStr_4066 = _arg_1;
        }

        public function set centeredLocY(_arg_1:Boolean):void
        {
            _SafeStr_4067 = _arg_1;
        }

        public function set screenWd(_arg_1:int):void
        {
            _SafeStr_4068 = _arg_1;
        }

        public function set screenHt(_arg_1:int):void
        {
            _SafeStr_4069 = _arg_1;
        }

        public function set scale(_arg_1:int):void
        {
            if (_SafeStr_4045 != _arg_1)
            {
                _SafeStr_4045 = _arg_1;
                _SafeStr_4074 = true;
            };
        }

        public function set roomWd(_arg_1:int):void
        {
            _SafeStr_4070 = _arg_1;
        }

        public function set roomHt(_arg_1:int):void
        {
            _SafeStr_4071 = _arg_1;
        }

        public function set geometryUpdateId(_arg_1:int):void
        {
            _SafeStr_4072 = _arg_1;
        }

        public function set target(_arg_1:IVector3d):void
        {
            var _local_2:* = null;
            if (_SafeStr_4073 == null)
            {
                _SafeStr_4073 = new Vector3d();
            };
            if ((((!(_SafeStr_4073.x == _arg_1.x)) || (!(_SafeStr_4073.y == _arg_1.y))) || (!(_SafeStr_4073.z == _arg_1.z))))
            {
                _SafeStr_4073.assign(_arg_1);
                _local_2 = Vector3d.dif(_SafeStr_4073, _SafeStr_4060);
                _SafeStr_4075 = _local_2.length;
                _SafeStr_4076 = true;
            };
        }

        public function dispose():void
        {
            _SafeStr_4073 = null;
            _SafeStr_4060 = null;
        }

        public function initializeLocation(_arg_1:IVector3d):void
        {
            if (_SafeStr_4060 != null)
            {
                return;
            };
            _SafeStr_4060 = new Vector3d();
            _SafeStr_4060.assign(_arg_1);
        }

        public function resetLocation(_arg_1:IVector3d):void
        {
            if (_SafeStr_4060 == null)
            {
                _SafeStr_4060 = new Vector3d();
            };
            _SafeStr_4060.assign(_arg_1);
        }

        public function update(_arg_1:uint, _arg_2:Number):void
        {
            var _local_4:* = null;
            var _local_5:Number;
            var _local_6:Number;
            var _local_3:Number;
            var _local_7:Number;
            if ((((_followDuration > 0) && (!(_SafeStr_4073 == null))) && (!(_SafeStr_4060 == null))))
            {
                if (_SafeStr_4074)
                {
                    _SafeStr_4074 = false;
                    _SafeStr_4060 = _SafeStr_4073;
                    _SafeStr_4073 = null;
                    return;
                };
                _local_4 = Vector3d.dif(_SafeStr_4073, _SafeStr_4060);
                if (_local_4.length > _SafeStr_4075)
                {
                    _SafeStr_4075 = _local_4.length;
                };
                if (_local_4.length <= _arg_2)
                {
                    _SafeStr_4060 = _SafeStr_4073;
                    _SafeStr_4073 = null;
                    _SafeStr_4077 = 0;
                }
                else
                {
                    _local_5 = Math.sin(((3.14159265358979 * _local_4.length) / _SafeStr_4075));
                    _local_6 = (_arg_2 * 0.5);
                    _local_3 = (_SafeStr_4075 / 12);
                    _local_7 = (_local_6 + ((_local_3 - _local_6) * _local_5));
                    if (_SafeStr_4076)
                    {
                        if (_local_7 < _SafeStr_4077)
                        {
                            _local_7 = _SafeStr_4077;
                            if (_local_7 > _local_4.length)
                            {
                                _local_7 = _local_4.length;
                            };
                        }
                        else
                        {
                            _SafeStr_4076 = false;
                        };
                    };
                    _SafeStr_4077 = _local_7;
                    _local_4.div(_local_4.length);
                    _local_4.mul(_local_7);
                    _SafeStr_4060 = Vector3d.sum(_SafeStr_4060, _local_4);
                };
            };
        }

        public function reset():void
        {
            _SafeStr_4072 = -1;
        }

        public function activateFollowing(_arg_1:int):void
        {
            _followDuration = _arg_1;
        }


    }
}//package com.sulake.habbo.room.utils

// _SafeStr_3120 = "_-F10" (String#4637, DoABC#4)
// _SafeStr_4045 = "_-22r" (String#725, DoABC#4)
// _SafeStr_4060 = "_-y1p" (String#2746, DoABC#4)
// _SafeStr_4061 = "_-yK" (String#9601, DoABC#4)
// _SafeStr_4062 = "_-Zi" (String#19329, DoABC#4)
// _SafeStr_4063 = "_-d2" (String#14254, DoABC#4)
// _SafeStr_4064 = "_-m0" (String#18149, DoABC#4)
// _SafeStr_4065 = "_-61O" (String#19914, DoABC#4)
// _SafeStr_4066 = "_-81X" (String#19776, DoABC#4)
// _SafeStr_4067 = "_-Ii" (String#22522, DoABC#4)
// _SafeStr_4068 = "_-gE" (String#19137, DoABC#4)
// _SafeStr_4069 = "_-G1k" (String#19226, DoABC#4)
// _SafeStr_4070 = "_-uQ" (String#17956, DoABC#4)
// _SafeStr_4071 = "_-41M" (String#20598, DoABC#4)
// _SafeStr_4072 = "_-Ds" (String#2730, DoABC#4)
// _SafeStr_4073 = "_-gU" (String#2051, DoABC#4)
// _SafeStr_4074 = "_-s1w" (String#12116, DoABC#4)
// _SafeStr_4075 = "_-bm" (String#10194, DoABC#4)
// _SafeStr_4076 = "_-l1p" (String#11874, DoABC#4)
// _SafeStr_4077 = "_-l8" (String#10545, DoABC#4)


