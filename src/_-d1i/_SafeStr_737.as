// by nota

//_-d1i._SafeStr_737

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1480;

    [SecureSWF(rename="true")]
    public class _SafeStr_737 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_737(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1480);
        }

        public function getParser():_SafeStr_1480
        {
            return (_SafeStr_7012 as _SafeStr_1480);
        }


    }
}//package _-d1i

// _SafeStr_1480 = "_-p3" (String#10003, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_737 = "_-uJ" (String#10346, DoABC#3)


