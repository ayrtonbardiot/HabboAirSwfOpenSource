// by nota

//_-d1i._SafeStr_442

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1501;

    [SecureSWF(rename="true")]
    public class _SafeStr_442 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_442(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1501);
        }

        public function getParser():_SafeStr_1501
        {
            return (_SafeStr_7012 as _SafeStr_1501);
        }


    }
}//package _-d1i

// _SafeStr_1501 = "_-Z19" (String#8889, DoABC#3)
// _SafeStr_442 = "_-1" (String#6528, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


