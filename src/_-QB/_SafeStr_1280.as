// by nota

//_-QB._SafeStr_1280

package _-QB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1280 implements IMessageParser 
    {

        private var _SafeStr_4128:int;
        private var _SafeStr_4525:String;
        private var _SafeStr_4614:_SafeStr_24;


        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get value():String
        {
            return (_SafeStr_4525);
        }

        public function get answerCounts():_SafeStr_24
        {
            return (_SafeStr_4614);
        }

        public function flush():Boolean
        {
            _SafeStr_4128 = -1;
            _SafeStr_4525 = "";
            _SafeStr_4614 = null;
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_4:* = null;
            var _local_2:int;
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_4525 = _arg_1.readString();
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

// _SafeStr_1280 = "_-W1h" (String#8719, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_4525 = "_-8S" (String#7130, DoABC#3)
// _SafeStr_4614 = "_-J10" (String#7765, DoABC#3)


