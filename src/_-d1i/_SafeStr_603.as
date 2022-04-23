// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_603

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1370;

    [SecureSWF(rename="true")]
    public class _SafeStr_603 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_603(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1370);
        }

        public function getParser():_SafeStr_1370
        {
            return (_SafeStr_7012 as _SafeStr_1370);
        }


    }
}//package _-d1i

// _SafeStr_1370 = "_-TC" (String#8509, DoABC#3)
// _SafeStr_603 = "_-Ag" (String#7291, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


