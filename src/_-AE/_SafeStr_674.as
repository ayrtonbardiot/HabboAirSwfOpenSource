// by nota

//_-AE._SafeStr_674

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1460;

    [SecureSWF(rename="true")]
    public class _SafeStr_674 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_674(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1460);
        }

        public function get offer():_SafeStr_1406
        {
            return (_SafeStr_1460(parser).offerData);
        }

        public function get pageId():int
        {
            return (_SafeStr_1460(parser).pageId);
        }


    }
}//package _-AE

// _SafeStr_1406 = "_-227" (String#6660, DoABC#3)
// _SafeStr_1460 = "_-j9" (String#9616, DoABC#3)
// _SafeStr_674 = "_-P1M" (String#8234, DoABC#3)


