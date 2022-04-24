// by nota

//_-61W._SafeStr_942

package _-61W
{
    import com.sulake.core.communication.messages.MessageEvent;
    import _-221._SafeStr_1331;

    [SecureSWF(rename="true")]
    public class _SafeStr_942 extends MessageEvent 
    {

        public function _SafeStr_942(_arg_1:Function, _arg_2:Class)
        {
            super(_arg_1, _arg_2);
        }

        public function get userID():int
        {
            return (getParser().userID);
        }

        public function get userCanTrade():Boolean
        {
            return (getParser().userCanTrade);
        }

        public function get otherUserID():int
        {
            return (getParser().otherUserID);
        }

        public function get otherUserCanTrade():Boolean
        {
            return (getParser().otherUserCanTrade);
        }

        public function getParser():_SafeStr_1331
        {
            return (_SafeStr_7012 as _SafeStr_1331);
        }


    }
}//package _-61W

// _SafeStr_1331 = "_-N18" (String#8053, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_942 = "_-Rv" (String#8390, DoABC#3)


