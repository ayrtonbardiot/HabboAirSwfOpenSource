// by nota

//_-d1i._SafeStr_840

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1102;

    [SecureSWF(rename="true")]
    public class _SafeStr_840 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_840(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1102);
        }

        public function getParser():_SafeStr_1102
        {
            return (_SafeStr_7012 as _SafeStr_1102);
        }


    }
}//package _-d1i

// _SafeStr_1102 = "_-81F" (String#7073, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_840 = "_-yX" (String#10636, DoABC#3)


