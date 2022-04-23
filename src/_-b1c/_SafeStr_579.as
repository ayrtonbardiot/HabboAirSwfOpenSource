// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-b1c._SafeStr_579

package _-b1c
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-PB._SafeStr_1147;

    [SecureSWF(rename="true")]
    public class _SafeStr_579 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_579(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1147);
        }

        public function getParser():_SafeStr_1147
        {
            return (_SafeStr_7012 as _SafeStr_1147);
        }


    }
}//package _-b1c

// _SafeStr_1147 = "_-z1y" (String#10678, DoABC#3)
// _SafeStr_579 = "_-5q" (String#6930, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


