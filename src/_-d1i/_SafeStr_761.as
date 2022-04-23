// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_761

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1261;

    [SecureSWF(rename="true")]
    public class _SafeStr_761 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_761(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1261);
        }

        public function getParser():_SafeStr_1261
        {
            return (_SafeStr_7012 as _SafeStr_1261);
        }


    }
}//package _-d1i

// _SafeStr_1261 = "_-cj" (String#9155, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_761 = "_-61f" (String#6968, DoABC#3)


