// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_842

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1484;

    [SecureSWF(rename="true")]
    public class _SafeStr_842 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_842(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1484);
        }

        public function getParser():_SafeStr_1484
        {
            return (this._SafeStr_7012 as _SafeStr_1484);
        }


    }
}//package _-AE

// _SafeStr_1484 = "_-UW" (String#8583, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_842 = "_-ep" (String#9315, DoABC#3)


