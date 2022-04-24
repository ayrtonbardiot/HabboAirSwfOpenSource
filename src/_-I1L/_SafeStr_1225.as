// by nota

//_-I1L._SafeStr_1225

package _-I1L
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1225 implements IMessageParser 
    {

        private var _SafeStr_4313:int;


        public function get requestId():int
        {
            return (_SafeStr_4313);
        }

        public function flush():Boolean
        {
            _SafeStr_4313 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4313 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-I1L

// _SafeStr_1225 = "_-M1z" (String#8019, DoABC#3)
// _SafeStr_4313 = "_-B7" (String#7324, DoABC#3)


