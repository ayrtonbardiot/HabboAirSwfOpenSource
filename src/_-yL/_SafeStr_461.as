// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-yL._SafeStr_461

package _-yL
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-K1r._SafeStr_1282;

    [SecureSWF(rename="true")]
    public class _SafeStr_461 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_461(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1282);
        }

        public function getParser():_SafeStr_1282
        {
            return (this._SafeStr_7012 as _SafeStr_1282);
        }


    }
}//package _-yL

// _SafeStr_1282 = "_-Q5" (String#8310, DoABC#3)
// _SafeStr_461 = "_-Q17" (String#8285, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


