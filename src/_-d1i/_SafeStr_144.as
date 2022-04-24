// by nota

//_-d1i._SafeStr_144

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1204;

    [SecureSWF(rename="true")]
    public class _SafeStr_144 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_144(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1204);
        }

        public function getParser():_SafeStr_1204
        {
            return (_SafeStr_7012 as _SafeStr_1204);
        }


    }
}//package _-d1i

// _SafeStr_1204 = "_-G1i" (String#7605, DoABC#3)
// _SafeStr_144 = "_-Tm" (String#8531, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


