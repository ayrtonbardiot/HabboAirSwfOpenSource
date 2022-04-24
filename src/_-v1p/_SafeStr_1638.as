// by nota

//_-v1p._SafeStr_1638

package _-v1p
{
    import _-x1P._SafeStr_1635;
    import com.sulake.core.runtime._SafeStr_13;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1638 implements _SafeStr_1635, _SafeStr_13 
    {

        private var _name:String;
        private var _SafeStr_7622:Vector.<_SafeStr_1680>;
        private var _disposed:Boolean;

        public function _SafeStr_1638(_arg_1:IMessageDataWrapper)
        {
            var _local_2:int;
            super();
            _SafeStr_7622 = new Vector.<_SafeStr_1680>();
            _name = _arg_1.readString();
            var _local_3:int = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                _SafeStr_7622.push(new _SafeStr_1680(_arg_1));
                _local_2++;
            };
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            _SafeStr_7622 = null;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get topics():Vector.<_SafeStr_1680>
        {
            return (_SafeStr_7622);
        }


    }
}//package _-v1p

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1635 = "_-h" (String#9442, DoABC#3)
// _SafeStr_1638 = "_-Q16" (String#8284, DoABC#3)
// _SafeStr_1680 = "_-61U" (String#6949, DoABC#3)
// _SafeStr_7622 = "_-QR" (String#8318, DoABC#3)


