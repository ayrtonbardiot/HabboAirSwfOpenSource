// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1h._SafeStr_306

package _-K1h
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-sq._SafeStr_1047;

    [SecureSWF(rename="true")]
    public class _SafeStr_306 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_306(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1047);
        }

        public function getParser():_SafeStr_1047
        {
            return (this._SafeStr_7012 as _SafeStr_1047);
        }


    }
}//package _-K1h

// _SafeStr_1047 = "_-Z4" (String#8927, DoABC#3)
// _SafeStr_306 = "_-zK" (String#10691, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


