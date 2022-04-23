// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_681

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1516;

    [SecureSWF(rename="true")]
    public class _SafeStr_681 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_681(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1516);
        }

        public function getParser():_SafeStr_1516
        {
            return (this._SafeStr_7012 as _SafeStr_1516);
        }


    }
}//package _-AE

// _SafeStr_1516 = "_-8l" (String#7139, DoABC#3)
// _SafeStr_681 = "_-xS" (String#10559, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


