// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-81g._SafeStr_795

package _-81g
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-z1k._SafeStr_1156;

    [SecureSWF(rename="true")]
    public class _SafeStr_795 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_795(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1156);
        }

        public function getParser():_SafeStr_1156
        {
            return (_SafeStr_7012 as _SafeStr_1156);
        }


    }
}//package _-81g

// _SafeStr_1156 = "_-uY" (String#10356, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_795 = "_-KL" (String#7910, DoABC#3)


