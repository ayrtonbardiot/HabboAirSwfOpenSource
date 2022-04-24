// by nota

//_-Lc._SafeStr_1335

package _-Lc
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1335 implements IMessageParser 
    {

        private var _SafeStr_7007:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7007 = _arg_1.readInteger();
            return (true);
        }

        public function get itemId():int
        {
            return (_SafeStr_7007);
        }


    }
}//package _-Lc

// _SafeStr_1335 = "_-g1L" (String#9393, DoABC#3)
// _SafeStr_7007 = "_-J1n" (String#7783, DoABC#3)


