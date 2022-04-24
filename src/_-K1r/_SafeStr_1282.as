// by nota

//_-K1r._SafeStr_1282

package _-K1r
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1282 implements IMessageParser 
    {

        private var _SafeStr_7053:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7053 = _arg_1.readInteger();
            return (true);
        }

        public function get errorCode():int
        {
            return (_SafeStr_7053);
        }


    }
}//package _-K1r

// _SafeStr_1282 = "_-Q5" (String#8310, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)


