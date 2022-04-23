// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_169

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1234;

    [SecureSWF(rename="true")]
    public class _SafeStr_169 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_169(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1234);
        }

        public function getParser():_SafeStr_1234
        {
            return (_SafeStr_1234(_SafeStr_7012));
        }


    }
}//package _-W1K

// _SafeStr_1234 = "_-ZF" (String#8933, DoABC#3)
// _SafeStr_169 = "_-n1v" (String#9888, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


