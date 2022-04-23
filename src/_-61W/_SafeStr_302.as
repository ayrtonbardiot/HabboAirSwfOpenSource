// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61W._SafeStr_302

package _-61W
{
    import com.sulake.core.communication.messages.MessageEvent;
    import _-221._SafeStr_1408;

    [SecureSWF(rename="true")]
    public class _SafeStr_302 extends MessageEvent 
    {

        public function _SafeStr_302(_arg_1:Function, _arg_2:Class)
        {
            super(_arg_1, _arg_2);
        }

        public function get userID():int
        {
            return (getParser().userID);
        }

        public function get userAccepts():Boolean
        {
            return (getParser().userAccepts);
        }

        public function getParser():_SafeStr_1408
        {
            return (_SafeStr_7012 as _SafeStr_1408);
        }


    }
}//package _-61W

// _SafeStr_1408 = "_-O1G" (String#8137, DoABC#3)
// _SafeStr_302 = "_-N6" (String#8087, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


