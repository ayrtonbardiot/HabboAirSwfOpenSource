// by nota

//_-W1K._SafeStr_780

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1064;

    [SecureSWF(rename="true")]
    public class _SafeStr_780 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_780(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1064);
        }

        public function get reason():int
        {
            return (_SafeStr_1064(_SafeStr_7012).reason);
        }


    }
}//package _-W1K

// _SafeStr_1064 = "_-gW" (String#9428, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_780 = "_-OC" (String#8173, DoABC#3)


