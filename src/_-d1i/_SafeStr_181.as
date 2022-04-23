// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_181

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1221;

    [SecureSWF(rename="true")]
    public class _SafeStr_181 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_181(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1221);
        }

        public function getParser():_SafeStr_1221
        {
            return (_SafeStr_7012 as _SafeStr_1221);
        }


    }
}//package _-d1i

// _SafeStr_1221 = "_-vc" (String#10421, DoABC#3)
// _SafeStr_181 = "_-Dp" (String#7458, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


