// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-b1c._SafeStr_185

package _-b1c
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-PB._SafeStr_1401;

    [SecureSWF(rename="true")]
    public class _SafeStr_185 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_185(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1401);
        }

        public function getParser():_SafeStr_1401
        {
            return (_SafeStr_7012 as _SafeStr_1401);
        }


    }
}//package _-b1c

// _SafeStr_1401 = "_-KX" (String#7918, DoABC#3)
// _SafeStr_185 = "_-I1m" (String#7733, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


