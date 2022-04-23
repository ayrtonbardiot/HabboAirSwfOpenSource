// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-EK._SafeStr_807

package _-EK
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-28._SafeStr_1333;

    [SecureSWF(rename="true")]
    public class _SafeStr_807 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_807(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1333);
        }

        public function getParser():_SafeStr_1333
        {
            return (_SafeStr_7012 as _SafeStr_1333);
        }


    }
}//package _-EK

// _SafeStr_1333 = "_-W1R" (String#8708, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_807 = "_-Ck" (String#7403, DoABC#3)


