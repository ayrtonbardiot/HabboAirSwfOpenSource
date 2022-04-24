// by nota

//_-z1k._SafeStr_1509

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Zz._SafeStr_1552;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1509 implements IMessageParser 
    {

        private var _SafeStr_4157:int = -1;
        private var _SafeStr_4851:_SafeStr_1552;


        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get figureData():_SafeStr_1552
        {
            return (_SafeStr_4851);
        }

        public function flush():Boolean
        {
            _SafeStr_4157 = -1;
            _SafeStr_4851 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_4157 = _arg_1.readInteger();
            if (!_arg_1.bytesAvailable)
            {
                return (true);
            };
            _SafeStr_4851 = new _SafeStr_1552(_arg_1);
            return (true);
        }


    }
}//package _-z1k

// _SafeStr_1509 = "_-M1J" (String#7998, DoABC#3)
// _SafeStr_1552 = "_-JF" (String#7795, DoABC#3)
// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)
// _SafeStr_4851 = "_-W1C" (String#8668, DoABC#3)


