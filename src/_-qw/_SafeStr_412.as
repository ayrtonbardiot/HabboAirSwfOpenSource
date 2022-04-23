// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-qw._SafeStr_412

package _-qw
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-kC._SafeStr_1051;

    [SecureSWF(rename="true")]
    public class _SafeStr_412 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_412(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1051);
        }

        public function getParser():_SafeStr_1051
        {
            return (_SafeStr_7012 as _SafeStr_1051);
        }


    }
}//package _-qw

// _SafeStr_1051 = "_-a1F" (String#8964, DoABC#3)
// _SafeStr_412 = "_-12a" (String#6574, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


