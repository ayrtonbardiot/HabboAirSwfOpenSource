// by nota

//com.sulake.core.runtime._SafeStr_1526

package com.sulake.core.runtime
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.runtime.IID;
    import __AS3__.vec.Vector;

    [SecureSWF(rename="true")]
    internal class _SafeStr_1526 implements _SafeStr_13 
    {

        private var _SafeStr_6199:IID;
        private var _SafeStr_4036:Boolean;
        private var _receivers:Vector.<Function>;

        public function _SafeStr_1526(_arg_1:IID)
        {
            _SafeStr_6199 = _arg_1;
            _receivers = new Vector.<Function>();
            _SafeStr_4036 = false;
        }

        public function get identifier():IID
        {
            return (_SafeStr_6199);
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function get receivers():Vector.<Function>
        {
            return (_receivers);
        }

        public function dispose():void
        {
            if (!_SafeStr_4036)
            {
                _SafeStr_4036 = true;
                _SafeStr_6199 = null;
                while (_receivers.length > 0)
                {
                    _receivers.pop();
                };
                _receivers = null;
            };
        }


    }
}//package com.sulake.core.runtime

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1526 = "_-B1o" (String#7321, DoABC#3)
// _SafeStr_4036 = "_-Mr" (String#8042, DoABC#3)
// _SafeStr_6199 = "_-z1d" (String#10668, DoABC#3)


