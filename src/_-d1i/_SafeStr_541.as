// by nota

//_-d1i._SafeStr_541

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1115;

    [SecureSWF(rename="true")]
    public class _SafeStr_541 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_541(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1115);
        }

        public function getParser():_SafeStr_1115
        {
            return (_SafeStr_7012 as _SafeStr_1115);
        }


    }
}//package _-d1i

// _SafeStr_1115 = "_-b1C" (String#9044, DoABC#3)
// _SafeStr_541 = "_-Mi" (String#8037, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


