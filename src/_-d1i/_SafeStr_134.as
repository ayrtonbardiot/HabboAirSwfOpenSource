// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_134

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1181;

    [SecureSWF(rename="true")]
    public class _SafeStr_134 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_134(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1181);
        }

        public function getParser():_SafeStr_1181
        {
            return (_SafeStr_7012 as _SafeStr_1181);
        }


    }
}//package _-d1i

// _SafeStr_1181 = "_-L1N" (String#7943, DoABC#3)
// _SafeStr_134 = "_-81B" (String#7072, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


