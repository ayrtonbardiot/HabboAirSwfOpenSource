// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-qg._SafeStr_252

package _-qg
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Lc._SafeStr_1498;

    [SecureSWF(rename="true")]
    public class _SafeStr_252 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_252(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1498);
        }

        public function getParser():_SafeStr_1498
        {
            return (_SafeStr_7012 as _SafeStr_1498);
        }


    }
}//package _-qg

// _SafeStr_1498 = "_-T1u" (String#8498, DoABC#3)
// _SafeStr_252 = "_-L16" (String#7931, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


