// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-yL._SafeStr_1033

package _-yL
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-K1r._SafeStr_1061;

    [SecureSWF(rename="true")]
    public class _SafeStr_1033 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_1033(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1061);
        }

        public function getParser():_SafeStr_1061
        {
            return (this._SafeStr_7012 as _SafeStr_1061);
        }


    }
}//package _-yL

// _SafeStr_1033 = "_-EF" (String#7491, DoABC#3)
// _SafeStr_1061 = "_-lU" (String#9775, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


