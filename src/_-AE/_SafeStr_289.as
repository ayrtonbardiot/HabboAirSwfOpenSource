// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_289

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1107;

    [SecureSWF(rename="true")]
    public class _SafeStr_289 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_289(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1107);
        }

        public function getParser():_SafeStr_1107
        {
            return (this._SafeStr_7012 as _SafeStr_1107);
        }


    }
}//package _-AE

// _SafeStr_1107 = "_-U1B" (String#8545, DoABC#3)
// _SafeStr_289 = "_-ZI" (String#8936, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


