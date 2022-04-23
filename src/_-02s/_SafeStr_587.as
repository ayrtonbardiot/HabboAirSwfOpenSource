// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-02s._SafeStr_587

package _-02s
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-TT._SafeStr_1377;

    [SecureSWF(rename="true")]
    public class _SafeStr_587 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_587(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1377);
        }

        public function getParser():_SafeStr_1377
        {
            return (_SafeStr_7012 as _SafeStr_1377);
        }


    }
}//package _-02s

// _SafeStr_1377 = "_-My" (String#8046, DoABC#3)
// _SafeStr_587 = "_-P1d" (String#8241, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


