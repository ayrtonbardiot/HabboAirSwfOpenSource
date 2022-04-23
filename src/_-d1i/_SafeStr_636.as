// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_636

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1459;

    [SecureSWF(rename="true")]
    public class _SafeStr_636 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_636(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1459);
        }

        public function getParser():_SafeStr_1459
        {
            return (_SafeStr_7012 as _SafeStr_1459);
        }


    }
}//package _-d1i

// _SafeStr_1459 = "_-r1E" (String#10119, DoABC#3)
// _SafeStr_636 = "_-819" (String#7070, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


