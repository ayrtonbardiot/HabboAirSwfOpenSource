// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_178

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1180;

    [SecureSWF(rename="true")]
    public class _SafeStr_178 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_178(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1180);
        }

        public function getParser():_SafeStr_1180
        {
            return (_SafeStr_7012 as _SafeStr_1180);
        }


    }
}//package _-d1i

// _SafeStr_1180 = "_-RA" (String#8366, DoABC#3)
// _SafeStr_178 = "_-i1H" (String#9525, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


