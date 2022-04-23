// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_393

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1361;

    [SecureSWF(rename="true")]
    public class _SafeStr_393 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_393(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1361);
        }

        public function getParser():_SafeStr_1361
        {
            return (_SafeStr_7012 as _SafeStr_1361);
        }


    }
}//package _-d1i

// _SafeStr_1361 = "_-z4" (String#10681, DoABC#3)
// _SafeStr_393 = "_-126" (String#6563, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


