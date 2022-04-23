// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_1011

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1169;

    [SecureSWF(rename="true")]
    public class _SafeStr_1011 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_1011(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1169);
        }

        public function getParser():_SafeStr_1169
        {
            return (_SafeStr_7012 as _SafeStr_1169);
        }


    }
}//package _-d1i

// _SafeStr_1011 = "_-C12" (String#7354, DoABC#3)
// _SafeStr_1169 = "_-R1B" (String#8339, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


