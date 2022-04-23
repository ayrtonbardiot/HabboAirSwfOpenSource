// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-02s._SafeStr_567

package _-02s
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-TT._SafeStr_1277;

    [SecureSWF(rename="true")]
    public class _SafeStr_567 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_567(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1277);
        }

        public function getParser():_SafeStr_1277
        {
            return (_SafeStr_7012 as _SafeStr_1277);
        }


    }
}//package _-02s

// _SafeStr_1277 = "_-dk" (String#9245, DoABC#3)
// _SafeStr_567 = "_-tZ" (String#10289, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


