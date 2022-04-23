// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-NF._SafeStr_1163

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import _-W1K._SafeStr_1648;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1163 implements IMessageParser 
    {

        private var _SafeStr_4128:int;
        private var _SafeStr_5186:_SafeStr_24;


        public function flush():Boolean
        {
            if (_SafeStr_5186)
            {
                _SafeStr_5186.dispose();
                _SafeStr_5186 = null;
            };
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:* = null;
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_5186 = new _SafeStr_24();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_4 = new _SafeStr_1648(_arg_1);
                _SafeStr_5186.add(_local_4.relationshipStatusType, _local_4);
                _local_3++;
            };
            return (true);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get relationshipStatusMap():_SafeStr_24
        {
            return (_SafeStr_5186);
        }


    }
}//package _-NF

// _SafeStr_1163 = "_-Al" (String#7294, DoABC#3)
// _SafeStr_1648 = "_-Ne" (String#8104, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_5186 = "_-Ph" (String#8274, DoABC#3)


