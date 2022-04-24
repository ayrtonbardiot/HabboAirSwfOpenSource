// by nota

//_-d1i._SafeStr_483

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1228;

    [SecureSWF(rename="true")]
    public class _SafeStr_483 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_483(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1228);
        }

        public function getParser():_SafeStr_1228
        {
            return (_SafeStr_7012 as _SafeStr_1228);
        }


    }
}//package _-d1i

// _SafeStr_1228 = "_-UC" (String#8571, DoABC#3)
// _SafeStr_483 = "_-f1k" (String#9345, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


