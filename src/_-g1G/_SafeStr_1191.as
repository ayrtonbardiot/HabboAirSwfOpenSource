// by nota

//_-g1G._SafeStr_1191

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1191 implements IMessageParser 
    {

        private var _SafeStr_7053:int = 0;


        public function get errorCode():int
        {
            return (_SafeStr_7053);
        }

        public function flush():Boolean
        {
            _SafeStr_7053 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7053 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-g1G

// _SafeStr_1191 = "_-k1k" (String#9684, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)


