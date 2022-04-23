// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-p1o._SafeStr_447

package _-p1o
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-IV._SafeStr_1425;

    [SecureSWF(rename="true")]
    public class _SafeStr_447 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_447(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1425);
        }

        public function getParser():_SafeStr_1425
        {
            return (_SafeStr_7012 as _SafeStr_1425);
        }


    }
}//package _-p1o

// _SafeStr_1425 = "_-G1h" (String#7604, DoABC#3)
// _SafeStr_447 = "_-s1b" (String#10194, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


