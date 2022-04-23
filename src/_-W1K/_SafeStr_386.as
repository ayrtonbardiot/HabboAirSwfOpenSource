// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_386

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1162;

    [SecureSWF(rename="true")]
    public class _SafeStr_386 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_386(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1162);
        }

        public function userId():int
        {
            return (_SafeStr_1162(_SafeStr_7012).userId);
        }

        public function furniCount():int
        {
            return (_SafeStr_1162(_SafeStr_7012).furniCount);
        }


    }
}//package _-W1K

// _SafeStr_1162 = "_-f1i" (String#9343, DoABC#3)
// _SafeStr_386 = "_-E7" (String#7487, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


