// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_990

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1274;

    [SecureSWF(rename="true")]
    public class _SafeStr_990 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_990(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1274);
        }

        public function getParser():_SafeStr_1274
        {
            return (this._SafeStr_7012 as _SafeStr_1274);
        }


    }
}//package _-W1K

// _SafeStr_1274 = "_-I1o" (String#7734, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_990 = "_-D1i" (String#7432, DoABC#3)


