// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1h._SafeStr_701

package _-K1h
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-sq._SafeStr_1161;

    [SecureSWF(rename="true")]
    public class _SafeStr_701 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_701(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1161);
        }

        public function getParser():_SafeStr_1161
        {
            return (this._SafeStr_7012 as _SafeStr_1161);
        }


    }
}//package _-K1h

// _SafeStr_1161 = "_-31m" (String#6731, DoABC#3)
// _SafeStr_701 = "_-qj" (String#10089, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


