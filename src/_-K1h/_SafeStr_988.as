// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1h._SafeStr_988

package _-K1h
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-sq._SafeStr_1315;

    [SecureSWF(rename="true")]
    public class _SafeStr_988 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_988(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1315);
        }

        public function getParser():_SafeStr_1315
        {
            return (this._SafeStr_7012 as _SafeStr_1315);
        }


    }
}//package _-K1h

// _SafeStr_1315 = "_-s1u" (String#10205, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_988 = "_-B1F" (String#7305, DoABC#3)


