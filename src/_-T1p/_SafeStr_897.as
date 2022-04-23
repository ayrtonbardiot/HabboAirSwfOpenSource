// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-T1p._SafeStr_897

package _-T1p
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-a1U._SafeStr_1139;

    [SecureSWF(rename="true")]
    public class _SafeStr_897 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_897(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1139);
        }

        public function getParser():_SafeStr_1139
        {
            return (_SafeStr_7012 as _SafeStr_1139);
        }


    }
}//package _-T1p

// _SafeStr_1139 = "_-l2" (String#9762, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_897 = "_-L1D" (String#7936, DoABC#3)


