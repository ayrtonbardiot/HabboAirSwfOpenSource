// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.room.renderer.cache._SafeStr_3462

package com.sulake.room.renderer.cache
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.room.renderer.utils._SafeStr_3464;

    [SecureSWF(rename="true")]
    public class _SafeStr_3462 
    {

        private var _SafeStr_6833:_SafeStr_24;
        private var _SafeStr_6831:int = 0;
        private var _SafeStr_6832:int = 0;
        private var _SafeStr_6834:int = 0;
        private var _SafeStr_6830:int = 0;

        public function _SafeStr_3462(_arg_1:int, _arg_2:int, _arg_3:int=1)
        {
            _SafeStr_6833 = new _SafeStr_24();
            _SafeStr_6832 = ((_arg_1 * 0x0400) * 0x0400);
            _SafeStr_6834 = ((_arg_2 * 0x0400) * 0x0400);
            _SafeStr_6830 = ((_arg_3 * 0x0400) * 0x0400);
            if (_SafeStr_6830 < 0)
            {
                _SafeStr_6830 = 0;
            };
        }

        public function get memUsage():int
        {
            return (_SafeStr_6831);
        }

        public function get memLimit():int
        {
            return (_SafeStr_6832);
        }

        public function dispose():void
        {
            var _local_1:* = null;
            if (_SafeStr_6833 != null)
            {
                _local_1 = _SafeStr_6833.getKeys();
                for each (var _local_2:String in _local_1)
                {
                    if (!removeItem(_local_2))
                    {
                        _SafeStr_14.log((("Failed to remove item " + _local_2) + " from room canvas bitmap cache!"));
                    };
                };
                _SafeStr_6833.dispose();
                _SafeStr_6833 = null;
            };
        }

        public function compress():void
        {
            var _local_1:* = null;
            var _local_2:_SafeStr_3487;
            var _local_3:int;
            if (memUsage > memLimit)
            {
                _local_1 = _SafeStr_6833.getValues();
                _local_1.sortOn("useCount", 16);
                _local_1.reverse();
                _local_3 = (_local_1.length - 1);
                while (_local_3 >= 0)
                {
                    _local_2 = (_local_1[_local_3] as _SafeStr_3487);
                    if (_local_2.useCount <= 1)
                    {
                        removeItem(_local_2.name);
                    }
                    else
                    {
                        break;
                    };
                    _local_3--;
                };
                increaseMemoryLimit();
            };
        }

        private function increaseMemoryLimit():void
        {
            _SafeStr_6832 = (_SafeStr_6832 + _SafeStr_6830);
            if (_SafeStr_6832 > _SafeStr_6834)
            {
                _SafeStr_6832 = _SafeStr_6834;
            };
        }

        private function removeItem(_arg_1:String):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            var _local_2:_SafeStr_3487 = (_SafeStr_6833.getValue(_arg_1) as _SafeStr_3487);
            if (_local_2 != null)
            {
                if (_local_2.useCount <= 1)
                {
                    _SafeStr_6833.remove(_local_2.name);
                    _SafeStr_6831 = (_SafeStr_6831 - _local_2.memUsage);
                    _local_2.dispose();
                    return (true);
                };
                return (false);
            };
            return (false);
        }

        public function getBitmapData(_arg_1:String):_SafeStr_3464
        {
            var _local_2:_SafeStr_3487 = (_SafeStr_6833.getValue(_arg_1) as _SafeStr_3487);
            if (_local_2 == null)
            {
                return (null);
            };
            return (_local_2.bitmapData);
        }

        public function addBitmapData(_arg_1:String, _arg_2:_SafeStr_3464):void
        {
            var _local_4:* = null;
            if (_arg_2 == null)
            {
                return;
            };
            var _local_3:_SafeStr_3487 = (_SafeStr_6833.getValue(_arg_1) as _SafeStr_3487);
            if (_local_3 != null)
            {
                _local_4 = _local_3.bitmapData;
                if (_local_4 != null)
                {
                    _SafeStr_6831 = (_SafeStr_6831 - ((_local_4.width * _local_4.height) * 4));
                };
                _local_3.bitmapData = _arg_2;
            }
            else
            {
                _local_3 = new _SafeStr_3487(_arg_2, _arg_1);
                _SafeStr_6833.add(_arg_1, _local_3);
            };
            _SafeStr_6831 = (_SafeStr_6831 + ((_arg_2.width * _arg_2.height) * 4));
        }


    }
}//package com.sulake.room.renderer.cache

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3462 = "_-e8" (String#13730, DoABC#4)
// _SafeStr_3464 = "_-7S" (String#1934, DoABC#4)
// _SafeStr_3487 = "_-S1k" (String#5162, DoABC#4)
// _SafeStr_6830 = "_-T1c" (String#11171, DoABC#4)
// _SafeStr_6831 = "_-aY" (String#3745, DoABC#4)
// _SafeStr_6832 = "_-RN" (String#7756, DoABC#4)
// _SafeStr_6833 = "_-e5" (String#5472, DoABC#4)
// _SafeStr_6834 = "_-Yf" (String#15228, DoABC#4)


