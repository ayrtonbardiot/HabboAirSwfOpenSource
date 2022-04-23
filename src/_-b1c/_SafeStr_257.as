// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-b1c._SafeStr_257

package _-b1c
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-PB._SafeStr_1364;

    [SecureSWF(rename="true")]
    public class _SafeStr_257 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_257(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1364);
        }

        public function getParser():_SafeStr_1364
        {
            return (_SafeStr_7012 as _SafeStr_1364);
        }


    }
}//package _-b1c

// _SafeStr_1364 = "_-6d" (String#6996, DoABC#3)
// _SafeStr_257 = "_-Wr" (String#8756, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


