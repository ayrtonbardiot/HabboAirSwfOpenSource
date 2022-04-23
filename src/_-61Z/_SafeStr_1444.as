// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61Z._SafeStr_1444

package _-61Z
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import _-Go._SafeStr_1599;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1444 implements IMessageParser 
    {

        protected var _SafeStr_7118:int;
        protected var _SafeStr_7119:int;
        private var _SafeStr_7120:_SafeStr_24;


        public function get totalFragments():int
        {
            return (_SafeStr_7118);
        }

        public function get fragmentNo():int
        {
            return (_SafeStr_7119);
        }

        public function get furniFragment():_SafeStr_24
        {
            return (_SafeStr_7120);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:* = null;
            _SafeStr_7118 = _arg_1.readInteger();
            _SafeStr_7119 = _arg_1.readInteger();
            _SafeStr_7120 = new _SafeStr_24();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_4 = new _SafeStr_1599(_arg_1);
                _SafeStr_7120.add(_local_4.itemId, _local_4);
                _local_3++;
            };
            return (true);
        }

        public function flush():Boolean
        {
            if (_SafeStr_7120)
            {
                _SafeStr_7120.dispose();
                _SafeStr_7120 = null;
            };
            return (true);
        }


    }
}//package _-61Z

// _SafeStr_1444 = "_-Gd" (String#7638, DoABC#3)
// _SafeStr_1599 = "_-v1l" (String#10394, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_7118 = "_-Kt" (String#7926, DoABC#3)
// _SafeStr_7119 = "_-Z1I" (String#8893, DoABC#3)
// _SafeStr_7120 = "_-n12" (String#9850, DoABC#3)


