// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-a5._SafeStr_186

package _-a5
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Z1K._SafeStr_1477;

    [SecureSWF(rename="true")]
    public class _SafeStr_186 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_186(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1477);
        }

        public function getParser():_SafeStr_1477
        {
            return (_SafeStr_7012 as _SafeStr_1477);
        }


    }
}//package _-a5

// _SafeStr_1477 = "_-G12" (String#7584, DoABC#3)
// _SafeStr_186 = "_-rB" (String#10150, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


