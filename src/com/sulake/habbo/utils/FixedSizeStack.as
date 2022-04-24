// by nota

//com.sulake.habbo.utils.FixedSizeStack

package com.sulake.habbo.utils
{
    public class FixedSizeStack 
    {

        private var _SafeStr_3740:Array = [];
        private var _SafeStr_6626:int = 0;
        private var _index:int = 0;

        public function FixedSizeStack(_arg_1:int)
        {
            _SafeStr_6626 = _arg_1;
        }

        public function reset():void
        {
            _SafeStr_3740 = [];
            _index = 0;
        }

        public function addValue(_arg_1:int):void
        {
            if (_SafeStr_3740.length < _SafeStr_6626)
            {
                _SafeStr_3740.push(_arg_1);
            }
            else
            {
                _SafeStr_3740[_index] = _arg_1;
            };
            _index = ((_index + 1) % _SafeStr_6626);
        }

        public function getMax():int
        {
            var _local_1:int;
            var _local_2:* = -2147483648;
            _local_1 = 0;
            while (_local_1 < _SafeStr_6626)
            {
                if (_SafeStr_3740[_local_1] > _local_2)
                {
                    _local_2 = _SafeStr_3740[_local_1];
                };
                _local_1++;
            };
            return (_local_2);
        }

        public function getMin():int
        {
            var _local_1:int;
            var _local_2:* = 2147483647;
            _local_1 = 0;
            while (_local_1 < _SafeStr_6626)
            {
                if (_SafeStr_3740[_local_1] < _local_2)
                {
                    _local_2 = _SafeStr_3740[_local_1];
                };
                _local_1++;
            };
            return (_local_2);
        }


    }
}//package com.sulake.habbo.utils

// _SafeStr_3740 = "_-vf" (String#93, DoABC#4)
// _SafeStr_6626 = "_-st" (String#11279, DoABC#4)


