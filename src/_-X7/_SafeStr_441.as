// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-X7._SafeStr_441

package _-X7
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-A18._SafeStr_1046;

    [SecureSWF(rename="true")]
    public class _SafeStr_441 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_441(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1046);
        }

        public function getParser():_SafeStr_1046
        {
            return (_SafeStr_7012 as _SafeStr_1046);
        }


    }
}//package _-X7

// _SafeStr_1046 = "_-F12" (String#7527, DoABC#3)
// _SafeStr_441 = "_-m8" (String#9822, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


