// by nota

//_-Ja._SafeStr_1642

package _-Ja
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1642 implements _SafeStr_13, _SafeStr_1556 
    {

        private var _SafeStr_7318:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_7319:_SafeStr_24 = new _SafeStr_24();
        private var _disposed:Boolean;

        public function _SafeStr_1642(_arg_1:IMessageDataWrapper)
        {
            var _local_5:int;
            var _local_6:int;
            var _local_3:int;
            var _local_2:int;
            super();
            var _local_4:int = _arg_1.readInteger();
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_6 = _arg_1.readInteger();
                _local_3 = _arg_1.readInteger();
                _local_2 = _arg_1.readInteger();
                _SafeStr_7318.add(_local_6, _local_3);
                _SafeStr_7319.add(_local_6, _local_2);
                _local_5++;
            };
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            this._SafeStr_7318 = null;
            this._SafeStr_7319 = null;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get categoryToCurrentUserCountMap():_SafeStr_24
        {
            return (_SafeStr_7318);
        }

        public function get categoryToMaxUserCountMap():_SafeStr_24
        {
            return (_SafeStr_7319);
        }


    }
}//package _-Ja

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1556 = "_-P1B" (String#8228, DoABC#3)
// _SafeStr_1642 = "_-U0" (String#8539, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_7318 = "_-D4" (String#7440, DoABC#3)
// _SafeStr_7319 = "_-21" (String#6624, DoABC#3)


