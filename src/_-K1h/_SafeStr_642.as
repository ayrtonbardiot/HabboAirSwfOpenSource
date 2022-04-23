// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1h._SafeStr_642

package _-K1h
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-sq._SafeStr_1321;

    [SecureSWF(rename="true")]
    public class _SafeStr_642 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_642(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1321);
        }

        public function getParser():_SafeStr_1321
        {
            return (this._SafeStr_7012 as _SafeStr_1321);
        }


    }
}//package _-K1h

// _SafeStr_1321 = "_-e1s" (String#9290, DoABC#3)
// _SafeStr_642 = "_-kN" (String#9702, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


