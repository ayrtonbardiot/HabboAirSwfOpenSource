// by nota

//_-d1i._SafeStr_908

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1164;

    [SecureSWF(rename="true")]
    public class _SafeStr_908 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_908(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1164);
        }

        public function getParser():_SafeStr_1164
        {
            return (_SafeStr_7012 as _SafeStr_1164);
        }


    }
}//package _-d1i

// _SafeStr_1164 = "_-S1q" (String#8422, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_908 = "_-J12" (String#7767, DoABC#3)


