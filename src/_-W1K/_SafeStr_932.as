// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_932

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1088;

    [SecureSWF(rename="true")]
    public class _SafeStr_932 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_932(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1088);
        }

        public function get data():_SafeStr_1479
        {
            return (_SafeStr_1088(_SafeStr_7012).data);
        }


    }
}//package _-W1K

// _SafeStr_1088 = "_-u1R" (String#10315, DoABC#3)
// _SafeStr_1479 = "_-hd" (String#9502, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_932 = "_-60" (String#6935, DoABC#3)


