// by nota

//_-Y1i._SafeStr_1165

package _-Y1i
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import _-v1p._SafeStr_1638;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1165 implements IMessageParser 
    {

        private var _SafeStr_3902:Vector.<_SafeStr_1638>;
        private var _disposed:Boolean;


        public function flush():Boolean
        {
            if (_disposed)
            {
                return (true);
            };
            _disposed = true;
            for each (var _local_1:_SafeStr_1638 in _SafeStr_3902)
            {
                _local_1.dispose();
            };
            _SafeStr_3902 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_3902 = new Vector.<_SafeStr_1638>();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_3902.push(new _SafeStr_1638(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get callForHelpCategories():Vector.<_SafeStr_1638>
        {
            return (_SafeStr_3902);
        }


    }
}//package _-Y1i

// _SafeStr_1165 = "_-32h" (String#6752, DoABC#3)
// _SafeStr_1638 = "_-Q16" (String#8284, DoABC#3)
// _SafeStr_3902 = "_-y19" (String#10580, DoABC#3)


