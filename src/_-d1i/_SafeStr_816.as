// by nota

//_-d1i._SafeStr_816

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1458;

    [SecureSWF(rename="true")]
    public class _SafeStr_816 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_816(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1458);
        }

        public function getParser():_SafeStr_1458
        {
            return (_SafeStr_7012 as _SafeStr_1458);
        }


    }
}//package _-d1i

// _SafeStr_1458 = "_-Ur" (String#8597, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_816 = "_-bI" (String#9080, DoABC#3)


