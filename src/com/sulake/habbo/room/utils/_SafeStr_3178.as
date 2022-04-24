// by nota

//com.sulake.habbo.room.utils._SafeStr_3178

package com.sulake.habbo.room.utils
{
    import __AS3__.vec.Vector;

    [SecureSWF(rename="true")]
    public class _SafeStr_3178 
    {

        private var _SafeStr_4235:Vector.<Number>;
        private var _SafeStr_4623:Vector.<Boolean>;
        private var _SafeStr_4624:Vector.<Boolean>;
        private var _width:int = 0;
        private var _SafeStr_4234:int = 0;

        public function _SafeStr_3178(_arg_1:int, _arg_2:int)
        {
            _width = _arg_1;
            _SafeStr_4234 = _arg_2;
            _SafeStr_4235 = new Vector.<Number>((_arg_1 * _arg_2));
            _SafeStr_4623 = new Vector.<Boolean>((_arg_1 * _arg_2));
            _SafeStr_4624 = new Vector.<Boolean>((_arg_1 * _arg_2));
        }

        public function get width():int
        {
            return (_width);
        }

        public function get height():int
        {
            return (_SafeStr_4234);
        }

        public function dispose():void
        {
            _SafeStr_4235 = null;
            _SafeStr_4623 = null;
            _SafeStr_4624 = null;
            _width = 0;
            _SafeStr_4234 = 0;
        }

        private function validPosition(_arg_1:int, _arg_2:int):Boolean
        {
            return ((((_arg_1 >= 0) && (_arg_1 < _width)) && (_arg_2 >= 0)) && (_arg_2 < _SafeStr_4234));
        }

        public function getTileHeight(_arg_1:int, _arg_2:int):Number
        {
            return ((validPosition(_arg_1, _arg_2)) ? _SafeStr_4235[((_arg_2 * _width) + _arg_1)] : 0);
        }

        public function setTileHeight(_arg_1:int, _arg_2:int, _arg_3:Number):void
        {
            if (validPosition(_arg_1, _arg_2))
            {
                _SafeStr_4235[((_arg_2 * _width) + _arg_1)] = _arg_3;
            };
        }

        public function setStackingBlocked(_arg_1:int, _arg_2:int, _arg_3:Boolean):void
        {
            if (validPosition(_arg_1, _arg_2))
            {
                _SafeStr_4623[((_arg_2 * _width) + _arg_1)] = _arg_3;
            };
        }

        public function setIsRoomTile(_arg_1:int, _arg_2:int, _arg_3:Boolean):void
        {
            if (validPosition(_arg_1, _arg_2))
            {
                _SafeStr_4624[((_arg_2 * _width) + _arg_1)] = _arg_3;
            };
        }

        public function validateLocation(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:int, _arg_9:Boolean, _arg_10:Number=-1):Boolean
        {
            var _local_13:int;
            var _local_11:int;
            var _local_12:int;
            if (((!(validPosition(_arg_1, _arg_2))) || (!(validPosition(((_arg_1 + _arg_3) - 1), ((_arg_2 + _arg_4) - 1))))))
            {
                return (false);
            };
            if (((_arg_5 < 0) || (_arg_5 >= _width)))
            {
                _arg_5 = 0;
            };
            if (((_arg_6 < 0) || (_arg_6 >= _SafeStr_4234)))
            {
                _arg_6 = 0;
            };
            _arg_7 = Math.min(_arg_7, (_width - _arg_5));
            _arg_8 = Math.min(_arg_8, (_SafeStr_4234 - _arg_6));
            if (_arg_10 == -1)
            {
                _arg_10 = getTileHeight(_arg_1, _arg_2);
            };
            _local_13 = _arg_2;
            while (_local_13 < (_arg_2 + _arg_4))
            {
                _local_11 = _arg_1;
                while (_local_11 < (_arg_1 + _arg_3))
                {
                    if (((((_local_11 < _arg_5) || (_local_11 >= (_arg_5 + _arg_7))) || (_local_13 < _arg_6)) || (_local_13 >= (_arg_6 + _arg_8))))
                    {
                        _local_12 = ((_local_13 * _width) + _local_11);
                        if (_arg_9)
                        {
                            if (!_SafeStr_4624[_local_12])
                            {
                                return (false);
                            };
                        }
                        else
                        {
                            if ((((_SafeStr_4623[_local_12]) || (!(_SafeStr_4624[_local_12]))) || (Math.abs((_SafeStr_4235[_local_12] - _arg_10)) > 0.01)))
                            {
                                return (false);
                            };
                        };
                    };
                    _local_11++;
                };
                _local_13++;
            };
            return (true);
        }


    }
}//package com.sulake.habbo.room.utils

// _SafeStr_3178 = "_-pR" (String#3386, DoABC#4)
// _SafeStr_4234 = "_-z1j" (String#771, DoABC#4)
// _SafeStr_4235 = "_-uh" (String#3772, DoABC#4)
// _SafeStr_4623 = "_-ti" (String#11433, DoABC#4)
// _SafeStr_4624 = "_-O1w" (String#9776, DoABC#4)


