// by nota

//com.sulake.core.window.utils.ChildEntityArray

package com.sulake.core.window.utils
{
    public class ChildEntityArray extends _SafeStr_3481 implements IChildEntityArray 
    {


        public function removeChild(_arg_1:_SafeStr_3239):_SafeStr_3239
        {
            var _local_2:int = _SafeStr_6600.indexOf(_arg_1);
            if (_local_2 < 0)
            {
                return (null);
            };
            _SafeStr_6600.splice(_local_2, 1);
            return (_arg_1);
        }

        public function addChild(_arg_1:_SafeStr_3239):_SafeStr_3239
        {
            _SafeStr_6600.push(_arg_1);
            return (_arg_1);
        }

        public function addChildAt(_arg_1:_SafeStr_3239, _arg_2:int):_SafeStr_3239
        {
            _SafeStr_6600.splice(_arg_2, 0, _arg_1);
            return (_arg_1);
        }

        public function removeChildAt(_arg_1:int):_SafeStr_3239
        {
            var _local_2:_SafeStr_3239 = _SafeStr_6600[_arg_1];
            if (_local_2 != null)
            {
                _SafeStr_6600.splice(_arg_1, 1);
                return (_local_2);
            };
            return (null);
        }

        public function setChildIndex(_arg_1:_SafeStr_3239, _arg_2:int):void
        {
            var _local_3:int = _SafeStr_6600.indexOf(_arg_1);
            if (((_local_3 > -1) && (!(_arg_2 == _local_3))))
            {
                _SafeStr_6600.splice(_local_3, 1);
                _SafeStr_6600.splice(_arg_2, 0, _arg_1);
            };
        }

        public function swapChildren(_arg_1:_SafeStr_3239, _arg_2:_SafeStr_3239):void
        {
            var _local_3:int;
            var _local_6:int;
            var _local_5:* = null;
            var _local_4:int;
            if ((((!(_arg_1 == null)) && (!(_arg_2 == null))) && (!(_arg_1 == _arg_2))))
            {
                _local_3 = _SafeStr_6600.indexOf(_arg_1);
                if (_local_3 < 0)
                {
                    return;
                };
                _local_6 = _SafeStr_6600.indexOf(_arg_2);
                if (_local_6 < 0)
                {
                    return;
                };
                if (_local_6 < _local_3)
                {
                    _local_5 = _arg_1;
                    _arg_1 = _arg_2;
                    _arg_2 = _local_5;
                    _local_4 = _local_3;
                    _local_3 = _local_6;
                    _local_6 = _local_4;
                };
                _SafeStr_6600.splice(_local_6, 1);
                _SafeStr_6600.splice(_local_3, 1);
                _SafeStr_6600.splice(_local_3, 0, _arg_2);
                _SafeStr_6600.splice(_local_6, 0, _arg_1);
            };
        }

        public function swapChildrenAt(_arg_1:int, _arg_2:int):void
        {
            swapChildren(_SafeStr_6600[_arg_1], _SafeStr_6600[_arg_2]);
        }


    }
}//package com.sulake.core.window.utils

// _SafeStr_3239 = "_-Uz" (String#1888, DoABC#4)
// _SafeStr_3481 = "_-2G" (String#8745, DoABC#4)
// _SafeStr_6600 = "_-91h" (String#2329, DoABC#4)


