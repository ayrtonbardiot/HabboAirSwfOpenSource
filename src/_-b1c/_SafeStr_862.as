// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-b1c._SafeStr_862

package _-b1c
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-PB._SafeStr_1478;

    [SecureSWF(rename="true")]
    public class _SafeStr_862 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_862(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1478);
        }

        public function getParser():_SafeStr_1478
        {
            return (_SafeStr_7012 as _SafeStr_1478);
        }


    }
}//package _-b1c

// _SafeStr_1478 = "_-If" (String#7756, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_862 = "_-X1V" (String#8778, DoABC#3)


