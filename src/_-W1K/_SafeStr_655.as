// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_655

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1266;

    [SecureSWF(rename="true")]
    public class _SafeStr_655 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_655(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1266);
        }

        public function getParser():_SafeStr_1266
        {
            return (_SafeStr_7012 as _SafeStr_1266);
        }


    }
}//package _-W1K

// _SafeStr_1266 = "_-q8" (String#10072, DoABC#3)
// _SafeStr_655 = "_-d1s" (String#9224, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


