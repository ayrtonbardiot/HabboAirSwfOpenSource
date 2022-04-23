// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_121

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1151;

    [SecureSWF(rename="true")]
    public class _SafeStr_121 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_121(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1151);
        }

        public function getParser():_SafeStr_1151
        {
            return (_SafeStr_7012 as _SafeStr_1151);
        }


    }
}//package _-d1i

// _SafeStr_1151 = "_-c1r" (String#9126, DoABC#3)
// _SafeStr_121 = "_-3r" (String#6789, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


