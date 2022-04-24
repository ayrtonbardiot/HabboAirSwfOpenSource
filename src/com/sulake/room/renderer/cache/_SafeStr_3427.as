// by nota

//com.sulake.room.renderer.cache._SafeStr_3427

package com.sulake.room.renderer.cache
{
    [SecureSWF(rename="true")]
    public class _SafeStr_3427 
    {

        private var _SafeStr_4157:int;
        private var _location:_SafeStr_3404 = null;
        private var _SafeStr_4164:_SafeStr_3424 = null;

        public function _SafeStr_3427(_arg_1:String)
        {
            _location = new _SafeStr_3404(_arg_1);
            _SafeStr_4164 = new _SafeStr_3424();
        }

        public function get location():_SafeStr_3404
        {
            return (_location);
        }

        public function get sprites():_SafeStr_3424
        {
            return (_SafeStr_4164);
        }

        public function dispose():void
        {
            if (_location != null)
            {
                _location.dispose();
                _location = null;
            };
            if (_SafeStr_4164 != null)
            {
                _SafeStr_4164.dispose();
                _SafeStr_4164 = null;
            };
        }

        public function set objectId(_arg_1:int):void
        {
            _SafeStr_4157 = _arg_1;
        }

        public function get objectId():int
        {
            return (_SafeStr_4157);
        }


    }
}//package com.sulake.room.renderer.cache

// _SafeStr_3404 = "_-FN" (String#9282, DoABC#4)
// _SafeStr_3424 = "_-G1G" (String#10137, DoABC#4)
// _SafeStr_3427 = "_-J1K" (String#4491, DoABC#4)
// _SafeStr_4157 = "_-G8" (String#491, DoABC#4)
// _SafeStr_4164 = "_-g0" (String#1517, DoABC#4)


