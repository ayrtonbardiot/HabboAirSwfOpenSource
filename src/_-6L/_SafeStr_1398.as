// by nota

//_-6L._SafeStr_1398

package _-6L
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1398 implements IMessageParser 
    {

        private var _SafeStr_5666:int;


        public function flush():Boolean
        {
            _SafeStr_5666 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5666 = _arg_1.readInteger();
            return (true);
        }

        public function get botId():int
        {
            return (_SafeStr_5666);
        }


    }
}//package _-6L

// _SafeStr_1398 = "_-12S" (String#6571, DoABC#3)
// _SafeStr_5666 = "_-32J" (String#6745, DoABC#3)


