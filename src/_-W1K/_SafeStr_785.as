// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_785

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1104;

    [SecureSWF(rename="true")]
    public class _SafeStr_785 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_785(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1104);
        }

        public function get data():_SafeStr_1123
        {
            return (_SafeStr_1104(_SafeStr_7012).data);
        }


    }
}//package _-W1K

// _SafeStr_1104 = "_-Y1H" (String#8834, DoABC#3)
// _SafeStr_1123 = "_-r1M" (String#10125, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_785 = "_-K10" (String#7860, DoABC#3)


