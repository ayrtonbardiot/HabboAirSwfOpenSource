// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_520

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1056;

    [SecureSWF(rename="true")]
    public class _SafeStr_520 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_520(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1056);
        }

        public function getParser():_SafeStr_1056
        {
            return (_SafeStr_7012 as _SafeStr_1056);
        }


    }
}//package _-W1K

// _SafeStr_1056 = "_-614" (String#6938, DoABC#3)
// _SafeStr_520 = "_-k1E" (String#9666, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


