// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_594

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1272;

    [SecureSWF(rename="true")]
    public class _SafeStr_594 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_594(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1272);
        }

        public function getParser():_SafeStr_1272
        {
            return (_SafeStr_7012 as _SafeStr_1272);
        }


    }
}//package _-W1K

// _SafeStr_1272 = "_-11k" (String#6555, DoABC#3)
// _SafeStr_594 = "_-S1w" (String#8425, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


