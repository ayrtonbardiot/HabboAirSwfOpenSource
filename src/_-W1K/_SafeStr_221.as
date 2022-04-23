// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_221

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1510;

    [SecureSWF(rename="true")]
    public class _SafeStr_221 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_221(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1510);
        }

        public function get data():_SafeStr_1135
        {
            return (_SafeStr_1510(_SafeStr_7012).data);
        }


    }
}//package _-W1K

// _SafeStr_1135 = "_-is" (String#9574, DoABC#3)
// _SafeStr_1510 = "_-k1B" (String#9663, DoABC#3)
// _SafeStr_221 = "_-ct" (String#9160, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


