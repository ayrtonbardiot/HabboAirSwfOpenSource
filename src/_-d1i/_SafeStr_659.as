// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_659

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1222;

    [SecureSWF(rename="true")]
    public class _SafeStr_659 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_659(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1222);
        }

        public function getParser():_SafeStr_1222
        {
            return (_SafeStr_7012 as _SafeStr_1222);
        }


    }
}//package _-d1i

// _SafeStr_1222 = "_-ip" (String#9572, DoABC#3)
// _SafeStr_659 = "_-CY" (String#7396, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


