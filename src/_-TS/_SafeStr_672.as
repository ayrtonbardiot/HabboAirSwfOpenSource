// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-TS._SafeStr_672

package _-TS
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-w1X._SafeStr_1404;

    [SecureSWF(rename="true")]
    public class _SafeStr_672 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_672(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1404);
        }

        public function getParser():_SafeStr_1404
        {
            return (_SafeStr_7012 as _SafeStr_1404);
        }


    }
}//package _-TS

// _SafeStr_1404 = "_-b18" (String#9041, DoABC#3)
// _SafeStr_672 = "_-i0" (String#9514, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


