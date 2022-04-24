// by nota

//_-cP._SafeStr_1314

package _-cP
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1314 implements IMessageParser 
    {

        private var _SafeStr_7187:_SafeStr_24;
        private var _SafeStr_7188:int;

        public function _SafeStr_1314()
        {
            _SafeStr_7187 = new _SafeStr_24();
        }

        public function get songDisks():_SafeStr_24
        {
            return (_SafeStr_7187);
        }

        public function get maxLength():int
        {
            return (_SafeStr_7188);
        }

        public function flush():Boolean
        {
            _SafeStr_7187.reset();
            _SafeStr_7188 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_7188 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            var _local_4:int = -1;
            var _local_5:int = -1;
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_4 = _arg_1.readInteger();
                _local_5 = _arg_1.readInteger();
                _SafeStr_7187.add(_local_4, _local_5);
                _local_3++;
            };
            return (true);
        }


    }
}//package _-cP

// _SafeStr_1314 = "_-6" (String#6934, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_7187 = "_-Sn" (String#8459, DoABC#3)
// _SafeStr_7188 = "_-LV" (String#7976, DoABC#3)


