// by nota

//_-Ja._SafeStr_1583

package _-Ja
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1583 implements _SafeStr_13, _SafeStr_1556 
    {

        private var _SafeStr_5093:Array = [];
        private var _disposed:Boolean;

        public function _SafeStr_1583(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_5093.push(new _SafeStr_1678(_arg_1));
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
            if (_SafeStr_5093 != null)
            {
                for each (var _local_1:_SafeStr_1678 in _SafeStr_5093)
                {
                    _local_1.dispose();
                };
            };
            _SafeStr_5093 = null;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get entries():Array
        {
            return (_SafeStr_5093);
        }


    }
}//package _-Ja

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1556 = "_-P1B" (String#8228, DoABC#3)
// _SafeStr_1583 = "_-51v" (String#6900, DoABC#3)
// _SafeStr_1678 = "_-2l" (String#6702, DoABC#3)
// _SafeStr_5093 = "_-Pc" (String#8270, DoABC#3)


