// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_852

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1525;

    [SecureSWF(rename="true")]
    public class _SafeStr_852 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_852(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1525);
        }

        public function getParser():_SafeStr_1525
        {
            return (_SafeStr_1525(_SafeStr_7012));
        }


    }
}//package _-W1K

// _SafeStr_1525 = "_-J1s" (String#7785, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_852 = "_-19" (String#6594, DoABC#3)


