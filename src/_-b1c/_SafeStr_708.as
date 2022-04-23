// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-b1c._SafeStr_708

package _-b1c
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-PB._SafeStr_1063;

    [SecureSWF(rename="true")]
    public class _SafeStr_708 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_708(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1063);
        }

        public function getParser():_SafeStr_1063
        {
            return (_SafeStr_7012 as _SafeStr_1063);
        }


    }
}//package _-b1c

// _SafeStr_1063 = "_-ae" (String#9023, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_708 = "_-m1v" (String#9817, DoABC#3)


