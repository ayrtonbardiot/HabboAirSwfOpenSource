// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1h._SafeStr_263

package _-K1h
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-sq._SafeStr_1472;

    [SecureSWF(rename="true")]
    public class _SafeStr_263 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_263(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1472);
        }

        public function getParser():_SafeStr_1472
        {
            return (this._SafeStr_7012 as _SafeStr_1472);
        }


    }
}//package _-K1h

// _SafeStr_1472 = "_-Mo" (String#8040, DoABC#3)
// _SafeStr_263 = "_-12c" (String#6575, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


