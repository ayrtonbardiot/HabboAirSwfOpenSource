// by nota

//_-Ja._SafeStr_1621

package _-Ja
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1621 implements _SafeStr_13, _SafeStr_1556 
    {

        private var _SafeStr_4429:Array = [];
        private var _disposed:Boolean;

        public function _SafeStr_1621(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_4429.push(new _SafeStr_1659(_arg_1));
                _local_3++;
            };
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            this._SafeStr_4429 = null;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get tags():Array
        {
            return (_SafeStr_4429);
        }


    }
}//package _-Ja

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1556 = "_-P1B" (String#8228, DoABC#3)
// _SafeStr_1621 = "_-MK" (String#8026, DoABC#3)
// _SafeStr_1659 = "_-bK" (String#9082, DoABC#3)
// _SafeStr_4429 = "_-91w" (String#7179, DoABC#3)


