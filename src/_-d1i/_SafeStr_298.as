// by nota

//_-d1i._SafeStr_298

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1177;

    [SecureSWF(rename="true")]
    public class _SafeStr_298 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_298(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1177);
        }

        public function getParser():_SafeStr_1177
        {
            return (_SafeStr_7012 as _SafeStr_1177);
        }


    }
}//package _-d1i

// _SafeStr_1177 = "_-Y9" (String#8861, DoABC#3)
// _SafeStr_298 = "_-w1b" (String#10458, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


