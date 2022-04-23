// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Lc._SafeStr_1379

package _-Lc
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1379 implements IMessageParser 
    {

        private var _items:_SafeStr_24;


        public function flush():Boolean
        {
            if (_items)
            {
                _items.dispose();
                _items = null;
            };
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_2:* = null;
            _items = new _SafeStr_24();
            var _local_3:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = new _SafeStr_1620(_arg_1);
                _items.add(_local_2.id, _local_2);
                _local_4++;
            };
            return (true);
        }

        public function get items():_SafeStr_24
        {
            return (_items);
        }


    }
}//package _-Lc

// _SafeStr_1379 = "_-l1q" (String#9756, DoABC#3)
// _SafeStr_1620 = "_-V1f" (String#8625, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)


