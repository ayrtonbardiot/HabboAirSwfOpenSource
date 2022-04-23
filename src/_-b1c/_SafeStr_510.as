// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-b1c._SafeStr_510

package _-b1c
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-PB._SafeStr_1285;

    [SecureSWF(rename="true")]
    public class _SafeStr_510 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_510(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1285);
        }

        public function getParser():_SafeStr_1285
        {
            return (_SafeStr_7012 as _SafeStr_1285);
        }


    }
}//package _-b1c

// _SafeStr_1285 = "_-q5" (String#10071, DoABC#3)
// _SafeStr_510 = "_-ya" (String#10639, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


