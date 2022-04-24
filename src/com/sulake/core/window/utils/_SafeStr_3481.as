// by nota

//com.sulake.core.window.utils._SafeStr_3481

package com.sulake.core.window.utils
{
    import __AS3__.vec.Vector;

    public class _SafeStr_3481 implements _SafeStr_3171 
    {

        protected var _SafeStr_6600:Vector.<_SafeStr_3239> = new Vector.<_SafeStr_3239>();


        public function get numChildren():int
        {
            return (_SafeStr_6600.length);
        }

        public function getChildAt(_arg_1:int):_SafeStr_3239
        {
            return (_SafeStr_6600[_arg_1]);
        }

        public function getChildByID(_arg_1:int):_SafeStr_3239
        {
            var _local_2:* = null;
            for each (_local_2 in _SafeStr_6600)
            {
                if (_local_2.id == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getChildByName(_arg_1:String):_SafeStr_3239
        {
            var _local_2:* = null;
            for each (_local_2 in _SafeStr_6600)
            {
                if (_local_2.name == _arg_1)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getChildIndex(_arg_1:_SafeStr_3239):int
        {
            return (_SafeStr_6600.indexOf(_arg_1));
        }

        public function groupChildrenWithID(_arg_1:uint, _arg_2:Array):uint
        {
            var _local_4:* = null;
            var _local_3:uint;
            for each (_local_4 in _SafeStr_6600)
            {
                if (_local_4.id == _arg_1)
                {
                    _arg_2.push(_local_4);
                    _local_3++;
                };
            };
            return (_local_3);
        }


    }
}//package com.sulake.core.window.utils

// _SafeStr_3171 = "_-L10" (String#15073, DoABC#4)
// _SafeStr_3239 = "_-Uz" (String#1888, DoABC#4)
// _SafeStr_3481 = "_-2G" (String#8745, DoABC#4)
// _SafeStr_6600 = "_-91h" (String#2329, DoABC#4)


