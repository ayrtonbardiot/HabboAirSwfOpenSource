// by nota

//_-EK._SafeStr_756

package _-EK
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-28._SafeStr_1457;

    [SecureSWF(rename="true")]
    public class _SafeStr_756 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_756(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1457);
        }

        public function get enabled():Boolean
        {
            return ((_SafeStr_7012 as _SafeStr_1457).enabled);
        }


    }
}//package _-EK

// _SafeStr_1457 = "_-Su" (String#8464, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_756 = "_-s1t" (String#10204, DoABC#3)


