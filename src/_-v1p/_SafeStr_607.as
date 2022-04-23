// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-v1p._SafeStr_607

package _-v1p
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Y1i._SafeStr_1504;

    [SecureSWF(rename="true")]
    public class _SafeStr_607 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_607(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1504);
        }

        public function getParser():_SafeStr_1504
        {
            return (_SafeStr_7012 as _SafeStr_1504);
        }


    }
}//package _-v1p

// _SafeStr_1504 = "_-at" (String#9031, DoABC#3)
// _SafeStr_607 = "_-Rr" (String#8386, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


