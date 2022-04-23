// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Ad._SafeStr_1106

package _-Ad
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1106 implements IMessageParser 
    {

        protected var _SafeStr_7118:int;
        protected var _SafeStr_7119:int;
        private var _SafeStr_7146:_SafeStr_24;


        public function get totalFragments():int
        {
            return (_SafeStr_7118);
        }

        public function get fragmentNo():int
        {
            return (_SafeStr_7119);
        }

        public function get currentFragment():_SafeStr_24
        {
            return (_SafeStr_7146);
        }

        public function flush():Boolean
        {
            if (_SafeStr_7146)
            {
                _SafeStr_7146.dispose();
                _SafeStr_7146 = null;
            };
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_3:* = null;
            var _local_4:int;
            _SafeStr_7118 = _arg_1.readInteger();
            _SafeStr_7119 = _arg_1.readInteger();
            _SafeStr_7146 = new _SafeStr_24();
            var _local_5:int = _arg_1.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_5)
            {
                _local_2 = _arg_1.readInteger();
                _local_3 = _arg_1.readString();
                _SafeStr_7146.add(_local_3, _local_2);
                _local_4++;
            };
            return (true);
        }


    }
}//package _-Ad

// _SafeStr_1106 = "_-WU" (String#8743, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_7118 = "_-Kt" (String#7926, DoABC#3)
// _SafeStr_7119 = "_-Z1I" (String#8893, DoABC#3)
// _SafeStr_7146 = "_-31E" (String#6717, DoABC#3)


