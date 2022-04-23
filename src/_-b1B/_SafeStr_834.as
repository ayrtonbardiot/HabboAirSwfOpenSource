// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-b1B._SafeStr_834

package _-b1B
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-I1L._SafeStr_1225;

    [SecureSWF(rename="true")]
    public class _SafeStr_834 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_834(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1225);
        }

        public function getParser():_SafeStr_1225
        {
            return (_SafeStr_7012 as _SafeStr_1225);
        }


    }
}//package _-b1B

// _SafeStr_1225 = "_-M1z" (String#8019, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_834 = "_-l14" (String#9732, DoABC#3)


