// by nota

//_-28._SafeStr_1457

package _-28
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1457 implements IMessageParser 
    {

        private var _SafeStr_4630:Boolean;


        public function flush():Boolean
        {
            _SafeStr_4630 = false;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4630 = _arg_1.readBoolean();
            return (true);
        }

        public function get enabled():Boolean
        {
            return (_SafeStr_4630);
        }


    }
}//package _-28

// _SafeStr_1457 = "_-Su" (String#8464, DoABC#3)
// _SafeStr_4630 = "_-q1w" (String#10066, DoABC#3)


