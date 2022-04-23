// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-p1o._SafeStr_804

package _-p1o
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-IV._SafeStr_1343;

    [SecureSWF(rename="true")]
    public class _SafeStr_804 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_804(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1343);
        }

        public function getParser():_SafeStr_1343
        {
            return (_SafeStr_7012 as _SafeStr_1343);
        }


    }
}//package _-p1o

// _SafeStr_1343 = "_-019" (String#6470, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_804 = "_-vr" (String#10427, DoABC#3)


