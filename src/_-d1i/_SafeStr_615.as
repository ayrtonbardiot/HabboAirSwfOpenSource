// by nota

//_-d1i._SafeStr_615

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1093;

    [SecureSWF(rename="true")]
    public class _SafeStr_615 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_615(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1093);
        }

        public function getParser():_SafeStr_1093
        {
            return (_SafeStr_7012 as _SafeStr_1093);
        }


    }
}//package _-d1i

// _SafeStr_1093 = "_-b1r" (String#9071, DoABC#3)
// _SafeStr_615 = "_-OE" (String#8174, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


