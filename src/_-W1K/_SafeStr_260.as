// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_260

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1511;

    [SecureSWF(rename="true")]
    public class _SafeStr_260 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_260(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1511);
        }

        public function get data():_SafeStr_1121
        {
            return (_SafeStr_1511(_SafeStr_7012).data);
        }


    }
}//package _-W1K

// _SafeStr_1121 = "_-C1Z" (String#7365, DoABC#3)
// _SafeStr_1511 = "_-c8" (String#9134, DoABC#3)
// _SafeStr_260 = "_-81x" (String#7111, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


