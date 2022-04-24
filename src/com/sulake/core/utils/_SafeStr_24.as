// by nota

//com.sulake.core.utils._SafeStr_24

package com.sulake.core.utils
{
    import flash.utils.Proxy;
    import com.sulake.core.runtime._SafeStr_13;
    import flash.utils.Dictionary;
    import flash.utils.flash_proxy; 

    use namespace flash.utils.flash_proxy;

    [SecureSWF(rename="true")]
    public class _SafeStr_24 extends Proxy implements _SafeStr_13 
    {

        private var _length:uint;
        private var _SafeStr_7970:Dictionary;
        private var _SafeStr_6600:Array;
        private var _SafeStr_8075:Array;

        public function _SafeStr_24()
        {
            _length = 0;
            _SafeStr_7970 = new Dictionary();
            _SafeStr_6600 = [];
            _SafeStr_8075 = [];
        }

        public function get length():uint
        {
            return (_length);
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_7970 == null);
        }

        public function dispose():void
        {
            var _local_1:* = null;
            if (_SafeStr_7970 != null)
            {
                for (_local_1 in _SafeStr_7970)
                {
                    delete _SafeStr_7970[_local_1];
                };
                _SafeStr_7970 = null;
            };
            _length = 0;
            _SafeStr_6600 = null;
            _SafeStr_8075 = null;
        }

        public function reset():void
        {
            var _local_1:* = null;
            for (_local_1 in _SafeStr_7970)
            {
                delete _SafeStr_7970[_local_1];
            };
            _length = 0;
            _SafeStr_6600 = [];
            _SafeStr_8075 = [];
        }

        public function unshift(_arg_1:*, _arg_2:*):Boolean
        {
            if (_SafeStr_7970[_arg_1] != null)
            {
                return (false);
            };
            _SafeStr_7970[_arg_1] = _arg_2;
            _SafeStr_6600.unshift(_arg_2);
            _SafeStr_8075.unshift(_arg_1);
            _length++;
            return (true);
        }

        public function add(_arg_1:*, _arg_2:*):Boolean
        {
            if (_SafeStr_7970[_arg_1] != null)
            {
                return (false);
            };
            _SafeStr_7970[_arg_1] = _arg_2;
            _SafeStr_6600[_length] = _arg_2;
            _SafeStr_8075[_length] = _arg_1;
            _length++;
            return (true);
        }

        public function remove(_arg_1:*):*
        {
            var _local_2:Object = _SafeStr_7970[_arg_1];
            if (_local_2 == null)
            {
                return (null);
            };
            var _local_3:int = _SafeStr_6600.indexOf(_local_2);
            if (_local_3 >= 0)
            {
                _SafeStr_6600.splice(_local_3, 1);
                _SafeStr_8075.splice(_local_3, 1);
                _length--;
            };
            delete _SafeStr_7970[_arg_1];
            return (_local_2);
        }

        public function getWithIndex(_arg_1:int):*
        {
            if (((_arg_1 < 0) || (_arg_1 >= _length)))
            {
                return (null);
            };
            return (_SafeStr_6600[_arg_1]);
        }

        public function getKey(_arg_1:int):*
        {
            if (((_arg_1 < 0) || (_arg_1 >= _length)))
            {
                return (null);
            };
            return (_SafeStr_8075[_arg_1]);
        }

        public function getKeys():Array
        {
            return (_SafeStr_8075.slice());
        }

        public function hasKey(_arg_1:*):Boolean
        {
            return (_SafeStr_8075.indexOf(_arg_1) > -1);
        }

        public function getValue(_arg_1:*):*
        {
            return (_SafeStr_7970[_arg_1]);
        }

        public function getValues():Array
        {
            return (_SafeStr_6600.slice());
        }

        public function hasValue(_arg_1:*):Boolean
        {
            return (_SafeStr_6600.indexOf(_arg_1) > -1);
        }

        public function indexOf(_arg_1:*):int
        {
            return (_SafeStr_6600.indexOf(_arg_1));
        }

        public function concatenate(_arg_1:_SafeStr_24):void
        {
            var _local_3:*;
            var _local_2:Array = _arg_1._SafeStr_8075;
            for each (_local_3 in _local_2)
            {
                add(_local_3, _arg_1[_local_3]);
            };
        }

        public function clone():_SafeStr_24
        {
            var _local_1:_SafeStr_24 = new _SafeStr_24();
            _local_1.concatenate(this);
            return (_local_1);
        }

        override flash_proxy function getProperty(_arg_1:*):*
        {
            if ((_arg_1 is QName))
            {
                _arg_1 = QName(_arg_1).localName;
            };
            return (_SafeStr_7970[_arg_1]);
        }

        override flash_proxy function setProperty(_arg_1:*, _arg_2:*):void
        {
            if ((_arg_1 is QName))
            {
                _arg_1 = QName(_arg_1).localName;
            };
            _SafeStr_7970[_arg_1] = _arg_2;
            var _local_3:int = _SafeStr_8075.indexOf(_arg_1);
            if (_local_3 == -1)
            {
                _SafeStr_6600[_length] = _arg_2;
                _SafeStr_8075[_length] = _arg_1;
                _length++;
            }
            else
            {
                _SafeStr_6600.splice(_local_3, 1, _arg_2);
            };
        }

        override flash_proxy function nextNameIndex(_arg_1:int):int
        {
            return ((_arg_1 < _length) ? (_arg_1 + 1) : 0);
        }

        override flash_proxy function nextName(_arg_1:int):String
        {
            return (_SafeStr_8075[(_arg_1 - 1)]);
        }

        override flash_proxy function nextValue(_arg_1:int):*
        {
            return (_SafeStr_6600[(_arg_1 - 1)]);
        }

        override flash_proxy function callProperty(_arg_1:*, ... _args):*
        {
            return ((_arg_1.localName == "toString") ? "Map" : null);
        }


    }
}//package com.sulake.core.utils

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)
// _SafeStr_7970 = "_-do" (String#9247, DoABC#3)
// _SafeStr_8075 = "_-F8" (String#7562, DoABC#3)


