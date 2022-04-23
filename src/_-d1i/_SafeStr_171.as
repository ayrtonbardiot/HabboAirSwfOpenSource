// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_171

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1372;

    [SecureSWF(rename="true")]
    public class _SafeStr_171 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_171(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1372);
        }

        public function getParser():_SafeStr_1372
        {
            return (_SafeStr_7012 as _SafeStr_1372);
        }


    }
}//package _-d1i

// _SafeStr_1372 = "_-j1I" (String#9594, DoABC#3)
// _SafeStr_171 = "_-wj" (String#10493, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


