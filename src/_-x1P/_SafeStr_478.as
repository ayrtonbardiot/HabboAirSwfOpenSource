// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-x1P._SafeStr_478

package _-x1P
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-V1k._SafeStr_1201;

    [SecureSWF(rename="true")]
    public class _SafeStr_478 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_478(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1201);
        }

        public function getParser():_SafeStr_1201
        {
            return (_SafeStr_7012 as _SafeStr_1201);
        }


    }
}//package _-x1P

// _SafeStr_1201 = "_-S1j" (String#8417, DoABC#3)
// _SafeStr_478 = "_-9k" (String#7199, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


