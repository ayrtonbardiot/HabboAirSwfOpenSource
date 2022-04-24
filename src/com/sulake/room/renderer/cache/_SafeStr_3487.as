// by nota

//com.sulake.room.renderer.cache._SafeStr_3487

package com.sulake.room.renderer.cache
{
    import com.sulake.room.renderer.utils._SafeStr_3464;

    [SecureSWF(rename="true")]
    public class _SafeStr_3487 
    {

        private var _bitmapData:_SafeStr_3464 = null;
        private var _name:String = "";
        private var _SafeStr_6831:int = 0;

        public function _SafeStr_3487(_arg_1:_SafeStr_3464, _arg_2:String)
        {
            _bitmapData = _arg_1;
            _name = _arg_2;
            if (_arg_1 != null)
            {
                _arg_1.addReference();
                _SafeStr_6831 = ((_bitmapData.width * _bitmapData.height) * 4);
            };
        }

        public function get bitmapData():_SafeStr_3464
        {
            return (_bitmapData);
        }

        public function get memUsage():int
        {
            return (_SafeStr_6831);
        }

        public function get useCount():int
        {
            if (_bitmapData == null)
            {
                return (0);
            };
            return (_bitmapData.referenceCount);
        }

        public function get name():String
        {
            return (_name);
        }

        public function set bitmapData(_arg_1:_SafeStr_3464):void
        {
            if (_bitmapData != null)
            {
                _bitmapData.dispose();
            };
            _bitmapData = _arg_1;
            if (_bitmapData != null)
            {
                _bitmapData.addReference();
                _SafeStr_6831 = ((_bitmapData.width * _bitmapData.height) * 4);
            }
            else
            {
                _SafeStr_6831 = 0;
            };
        }

        public function dispose():void
        {
            if (_bitmapData != null)
            {
                _bitmapData.dispose();
                _bitmapData = null;
            };
            _SafeStr_6831 = 0;
        }


    }
}//package com.sulake.room.renderer.cache

// _SafeStr_3464 = "_-7S" (String#1934, DoABC#4)
// _SafeStr_3487 = "_-S1k" (String#5162, DoABC#4)
// _SafeStr_6831 = "_-aY" (String#3745, DoABC#4)


