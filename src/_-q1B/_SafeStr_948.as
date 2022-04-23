// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-q1B._SafeStr_948

package _-q1B
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-71X._SafeStr_1471;

    [SecureSWF(rename="true")]
    public class _SafeStr_948 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_948(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1471);
        }

        public function getParser():_SafeStr_1471
        {
            return (this._SafeStr_7012 as _SafeStr_1471);
        }


    }
}//package _-q1B

// _SafeStr_1471 = "_-v1W" (String#10388, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_948 = "_-Q9" (String#8312, DoABC#3)


