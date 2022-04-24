// by nota

//_-d1i._SafeStr_764

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1160;

    [SecureSWF(rename="true")]
    public class _SafeStr_764 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_764(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1160);
        }

        public function getParser():_SafeStr_1160
        {
            return (_SafeStr_7012 as _SafeStr_1160);
        }


    }
}//package _-d1i

// _SafeStr_1160 = "_-Y1d" (String#8848, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_764 = "_-H1F" (String#7665, DoABC#3)


