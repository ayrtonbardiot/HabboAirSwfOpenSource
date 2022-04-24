// by nota

//_-d1i._SafeStr_420

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1218;

    [SecureSWF(rename="true")]
    public class _SafeStr_420 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_420(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1218);
        }

        public function getParser():_SafeStr_1218
        {
            return (_SafeStr_7012 as _SafeStr_1218);
        }


    }
}//package _-d1i

// _SafeStr_1218 = "_-ZL" (String#8937, DoABC#3)
// _SafeStr_420 = "_-Ft" (String#7581, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


