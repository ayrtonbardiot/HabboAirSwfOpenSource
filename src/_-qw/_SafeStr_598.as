// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-qw._SafeStr_598

package _-qw
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-kC._SafeStr_1265;

    [SecureSWF(rename="true")]
    public class _SafeStr_598 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_598(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1265);
        }

        public function getParser():_SafeStr_1265
        {
            return (_SafeStr_7012 as _SafeStr_1265);
        }


    }
}//package _-qw

// _SafeStr_1265 = "_-x1B" (String#10505, DoABC#3)
// _SafeStr_598 = "_-5R" (String#6917, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


