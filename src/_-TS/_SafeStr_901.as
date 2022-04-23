// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-TS._SafeStr_901

package _-TS
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-w1X._SafeStr_1045;

    [SecureSWF(rename="true")]
    public class _SafeStr_901 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_901(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1045);
        }

        public function getParser():_SafeStr_1045
        {
            return (_SafeStr_7012 as _SafeStr_1045);
        }


    }
}//package _-TS

// _SafeStr_1045 = "_-oJ" (String#9952, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_901 = "_-3S" (String#6777, DoABC#3)


