// by nota

//_-W1K._SafeStr_633

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1395;

    [SecureSWF(rename="true")]
    public class _SafeStr_633 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_633(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1395);
        }

        public function get ignoredUsers():Array
        {
            return ((_SafeStr_7012 as _SafeStr_1395).ignoredUsers);
        }


    }
}//package _-W1K

// _SafeStr_1395 = "_-V1X" (String#8620, DoABC#3)
// _SafeStr_633 = "_-r5" (String#10146, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


