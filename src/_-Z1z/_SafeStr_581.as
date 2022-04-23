// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1z._SafeStr_581

package _-Z1z
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Zz._SafeStr_1237;

    [SecureSWF(rename="true")]
    public class _SafeStr_581 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_581(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1237);
        }

        public function getParser():_SafeStr_1237
        {
            return (_SafeStr_7012 as _SafeStr_1237);
        }


    }
}//package _-Z1z

// _SafeStr_1237 = "_-bp" (String#9094, DoABC#3)
// _SafeStr_581 = "_-zW" (String#10695, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


