// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-EK._SafeStr_365

package _-EK
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-28._SafeStr_1276;

    [SecureSWF(rename="true")]
    public class _SafeStr_365 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_365(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1276);
        }

        public function getParser():_SafeStr_1276
        {
            return (_SafeStr_7012 as _SafeStr_1276);
        }


    }
}//package _-EK

// _SafeStr_1276 = "_-W2" (String#8727, DoABC#3)
// _SafeStr_365 = "_-S1P" (String#8407, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


