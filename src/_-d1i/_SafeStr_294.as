// by nota

//_-d1i._SafeStr_294

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1263;

    [SecureSWF(rename="true")]
    public class _SafeStr_294 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_294(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1263);
        }

        public function getParser():_SafeStr_1263
        {
            return (_SafeStr_7012 as _SafeStr_1263);
        }


    }
}//package _-d1i

// _SafeStr_1263 = "_-ox" (String#9966, DoABC#3)
// _SafeStr_294 = "_-R1s" (String#8359, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


