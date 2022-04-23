// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-i9._SafeStr_385

package _-i9
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-11c._SafeStr_1392;

    [SecureSWF(rename="true")]
    public class _SafeStr_385 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_385(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1392);
        }

        public function getParser():_SafeStr_1392
        {
            return (_SafeStr_7012 as _SafeStr_1392);
        }


    }
}//package _-i9

// _SafeStr_1392 = "_-S1A" (String#8399, DoABC#3)
// _SafeStr_385 = "_-3M" (String#6771, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


