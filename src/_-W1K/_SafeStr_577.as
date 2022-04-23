// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_577

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1400;
    import com.sulake.core.utils._SafeStr_24;

    [SecureSWF(rename="true")]
    public class _SafeStr_577 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_577(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1400);
        }

        public function get badges():_SafeStr_24
        {
            return ((_SafeStr_7012 as _SafeStr_1400).badges);
        }


    }
}//package _-W1K

// _SafeStr_1400 = "_-41L" (String#6809, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_577 = "_-22Z" (String#6671, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


