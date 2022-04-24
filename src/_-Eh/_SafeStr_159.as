// by nota

//_-Eh._SafeStr_159

package _-Eh
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.landingview._SafeStr_1365;

    [SecureSWF(rename="true")]
    public class _SafeStr_159 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_159(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1365);
        }

        public function getParser():_SafeStr_1365
        {
            return (_SafeStr_7012 as _SafeStr_1365);
        }


    }
}//package _-Eh

// _SafeStr_1365 = "_-32G" (String#6742, DoABC#3)
// _SafeStr_159 = "_-J13" (String#7768, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


