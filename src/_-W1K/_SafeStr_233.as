// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_233

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1440;

    [SecureSWF(rename="true")]
    public class _SafeStr_233 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_233(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1440);
        }

        public function get data():_SafeStr_1109
        {
            return (_SafeStr_1440(_SafeStr_7012).data);
        }


    }
}//package _-W1K

// _SafeStr_1109 = "_-81H" (String#7074, DoABC#3)
// _SafeStr_1440 = "_-Qa" (String#8324, DoABC#3)
// _SafeStr_233 = "_-9Q" (String#7191, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


