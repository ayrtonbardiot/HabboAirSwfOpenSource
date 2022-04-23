// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_166

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1463;

    [SecureSWF(rename="true")]
    public class _SafeStr_166 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_166(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1463);
        }

        public function getParser():_SafeStr_1463
        {
            return (this._SafeStr_7012 as _SafeStr_1463);
        }


    }
}//package _-AE

// _SafeStr_1463 = "_-GC" (String#7623, DoABC#3)
// _SafeStr_166 = "_-S1t" (String#8424, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


