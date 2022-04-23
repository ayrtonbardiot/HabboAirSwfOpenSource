// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1z._SafeStr_259

package _-Z1z
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Zz._SafeStr_1077;

    [SecureSWF(rename="true")]
    public class _SafeStr_259 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_259(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1077);
        }

        public function getParser():_SafeStr_1077
        {
            return (_SafeStr_7012 as _SafeStr_1077);
        }


    }
}//package _-Z1z

// _SafeStr_1077 = "_-n1" (String#9848, DoABC#3)
// _SafeStr_259 = "_-t1M" (String#10251, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


