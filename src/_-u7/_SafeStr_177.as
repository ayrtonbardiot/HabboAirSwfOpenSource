// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-u7._SafeStr_177

package _-u7
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-6L._SafeStr_1398;

    [SecureSWF(rename="true")]
    public class _SafeStr_177 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_177(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1398);
        }

        public function getParser():_SafeStr_1398
        {
            return (_SafeStr_7012 as _SafeStr_1398);
        }


    }
}//package _-u7

// _SafeStr_1398 = "_-12S" (String#6571, DoABC#3)
// _SafeStr_177 = "_-L11" (String#7929, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


