// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-QB._SafeStr_1194

package _-QB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1194 implements IMessageParser 
    {

        private var _SafeStr_4613:int;
        private var _SafeStr_4614:_SafeStr_24;


        public function get questionId():int
        {
            return (_SafeStr_4613);
        }

        public function get answerCounts():_SafeStr_24
        {
            return (_SafeStr_4614);
        }

        public function flush():Boolean
        {
            _SafeStr_4613 = -1;
            _SafeStr_4614 = null;
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:* = null;
            var _local_2:int;
            _SafeStr_4613 = _arg_1.readInteger();
            _SafeStr_4614 = new _SafeStr_24();
            var _local_5:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_5)
            {
                _local_4 = _arg_1.readString();
                _local_2 = _arg_1.readInteger();
                _SafeStr_4614.add(_local_4, _local_2);
                _local_3++;
            };
            return (true);
        }


    }
}//package _-QB

// _SafeStr_1194 = "_-pr" (String#10023, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_4613 = "_-SG" (String#8440, DoABC#3)
// _SafeStr_4614 = "_-J10" (String#7765, DoABC#3)


