// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Fh._SafeStr_407

package _-Fh
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-613._SafeStr_1371;

    [SecureSWF(rename="true")]
    public class _SafeStr_407 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_407(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1371);
        }

        public function getParser():_SafeStr_1371
        {
            return (_SafeStr_7012 as _SafeStr_1371);
        }


    }
}//package _-Fh

// _SafeStr_1371 = "_-id" (String#9566, DoABC#3)
// _SafeStr_407 = "_-D1e" (String#7429, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


