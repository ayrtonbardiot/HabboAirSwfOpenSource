// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-d1i._SafeStr_893

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1470;

    [SecureSWF(rename="true")]
    public class _SafeStr_893 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_893(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1470);
        }

        public function getParser():_SafeStr_1470
        {
            return (_SafeStr_7012 as _SafeStr_1470);
        }


    }
}//package _-d1i

// _SafeStr_1470 = "_-z2" (String#10679, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_893 = "_-12g" (String#6576, DoABC#3)


