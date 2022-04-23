// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-81g._SafeStr_593

package _-81g
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-z1k._SafeStr_1066;

    [SecureSWF(rename="true")]
    public class _SafeStr_593 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_593(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1066);
        }

        public function getParser():_SafeStr_1066
        {
            return (_SafeStr_7012 as _SafeStr_1066);
        }


    }
}//package _-81g

// _SafeStr_1066 = "_-W1A" (String#8666, DoABC#3)
// _SafeStr_593 = "_-X1b" (String#8779, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


