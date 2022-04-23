// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61W._SafeStr_501

package _-61W
{
    import com.sulake.core.communication.messages.MessageEvent;
    import _-221._SafeStr_1049;

    [SecureSWF(rename="true")]
    public class _SafeStr_501 extends MessageEvent 
    {

        public function _SafeStr_501(_arg_1:Function, _arg_2:Class)
        {
            super(_arg_1, _arg_2);
        }

        public function get userID():int
        {
            return (getParser().userID);
        }

        public function getParser():_SafeStr_1049
        {
            return (_SafeStr_7012 as _SafeStr_1049);
        }


    }
}//package _-61W

// _SafeStr_1049 = "_-o1S" (String#9930, DoABC#3)
// _SafeStr_501 = "_-n13" (String#9851, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


