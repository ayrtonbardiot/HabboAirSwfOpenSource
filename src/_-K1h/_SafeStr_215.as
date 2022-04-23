// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-K1h._SafeStr_215

package _-K1h
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-sq._SafeStr_1158;

    [SecureSWF(rename="true")]
    public class _SafeStr_215 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_215(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1158);
        }

        public function getParser():_SafeStr_1158
        {
            return (this._SafeStr_7012 as _SafeStr_1158);
        }


    }
}//package _-K1h

// _SafeStr_1158 = "_-QA" (String#8313, DoABC#3)
// _SafeStr_215 = "_-xV" (String#10562, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


