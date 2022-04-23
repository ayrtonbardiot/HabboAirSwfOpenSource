// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Zz._SafeStr_1136

package _-Zz
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1136 implements IMessageParser 
    {

        protected var _SafeStr_7118:int;
        protected var _SafeStr_7119:int;
        private var _SafeStr_7893:_SafeStr_24;


        public function flush():Boolean
        {
            if (_SafeStr_7893)
            {
                _SafeStr_7893.dispose();
                _SafeStr_7893 = null;
            };
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:* = null;
            _SafeStr_7118 = _arg_1.readInteger();
            _SafeStr_7119 = _arg_1.readInteger();
            _SafeStr_7893 = new _SafeStr_24();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_4 = new _SafeStr_1573(_arg_1);
                _SafeStr_7893.add(_local_4.id, _local_4);
                _local_3++;
            };
            return (true);
        }

        public function get petListFragment():_SafeStr_24
        {
            return (_SafeStr_7893);
        }

        public function get totalFragments():int
        {
            return (_SafeStr_7118);
        }

        public function get fragmentNo():int
        {
            return (_SafeStr_7119);
        }


    }
}//package _-Zz

// _SafeStr_1136 = "_-41G" (String#6806, DoABC#3)
// _SafeStr_1573 = "_-iW" (String#9562, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_7118 = "_-Kt" (String#7926, DoABC#3)
// _SafeStr_7119 = "_-Z1I" (String#8893, DoABC#3)
// _SafeStr_7893 = "_-x1a" (String#10532, DoABC#3)


