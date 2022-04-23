// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1h._SafeStr_848

package _-K1h
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-sq._SafeStr_1386;

    [SecureSWF(rename="true")]
    public class _SafeStr_848 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_848(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1386);
        }

        public function getParser():_SafeStr_1386
        {
            return (this._SafeStr_7012 as _SafeStr_1386);
        }


    }
}//package _-K1h

// _SafeStr_1386 = "_-l1t" (String#9758, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_848 = "_-A11" (String#7209, DoABC#3)


