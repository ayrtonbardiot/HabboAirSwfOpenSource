// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1h._SafeStr_249

package _-K1h
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-sq._SafeStr_1518;

    [SecureSWF(rename="true")]
    public class _SafeStr_249 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_249(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1518);
        }

        public function getParser():_SafeStr_1518
        {
            return (this._SafeStr_7012 as _SafeStr_1518);
        }


    }
}//package _-K1h

// _SafeStr_1518 = "_-Js" (String#7856, DoABC#3)
// _SafeStr_249 = "_-h1a" (String#9473, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


