// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Fh._SafeStr_535

package _-Fh
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-613._SafeStr_1193;

    [SecureSWF(rename="true")]
    public class _SafeStr_535 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_535(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1193);
        }

        public function getParser():_SafeStr_1193
        {
            return (_SafeStr_7012 as _SafeStr_1193);
        }


    }
}//package _-Fh

// _SafeStr_1193 = "_-r1x" (String#10143, DoABC#3)
// _SafeStr_535 = "_-bL" (String#9083, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


