// by nota

//_-K1r._SafeStr_1096

package _-K1r
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1096 implements IMessageParser 
    {

        private var _SafeStr_7343:String;
        private var _SafeStr_7344:String;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7343 = _arg_1.readString();
            _SafeStr_7344 = _arg_1.readString();
            return (true);
        }

        public function get encryptedPrime():String
        {
            return (_SafeStr_7343);
        }

        public function get encryptedGenerator():String
        {
            return (_SafeStr_7344);
        }


    }
}//package _-K1r

// _SafeStr_1096 = "_-B1b" (String#7311, DoABC#3)
// _SafeStr_7343 = "_-I12" (String#7714, DoABC#3)
// _SafeStr_7344 = "_-W1N" (String#8706, DoABC#3)


