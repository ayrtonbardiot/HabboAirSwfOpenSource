// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-f1w._SafeStr_1125

package _-f1w
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1125 implements IMessageParser 
    {

        private var _SafeStr_7225:_SafeStr_24;
        private var _SafeStr_7226:_SafeStr_24;


        public function flush():Boolean
        {
            if (_SafeStr_7225)
            {
                _SafeStr_7225.dispose();
                _SafeStr_7225 = null;
            };
            if (_SafeStr_7226)
            {
                _SafeStr_7226.dispose();
                _SafeStr_7226 = null;
            };
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_6:* = null;
            var _local_5:* = null;
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _SafeStr_7225 = new _SafeStr_24();
            _SafeStr_7226 = new _SafeStr_24();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_4 = _arg_1.readInteger();
                _local_6 = _arg_1.readString();
                _local_5 = _arg_1.readString();
                _SafeStr_7225.add(_local_4, _local_6);
                _SafeStr_7226.add(_local_4, _local_5);
                _local_3++;
            };
            return (true);
        }

        public function get classifiedUsernameMap():_SafeStr_24
        {
            return (_SafeStr_7225);
        }

        public function get classifiedUserTypeMap():_SafeStr_24
        {
            return (_SafeStr_7226);
        }


    }
}//package _-f1w

// _SafeStr_1125 = "_-D15" (String#7414, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_7225 = "_-4w" (String#6866, DoABC#3)
// _SafeStr_7226 = "_-Pa" (String#8268, DoABC#3)


