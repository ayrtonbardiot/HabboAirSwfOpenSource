// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_639

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1055;

    [SecureSWF(rename="true")]
    public class _SafeStr_639 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_639(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1055);
        }

        public function getParser():_SafeStr_1055
        {
            return (this._SafeStr_7012 as _SafeStr_1055);
        }


    }
}//package _-AE

// _SafeStr_1055 = "_-yp" (String#10648, DoABC#3)
// _SafeStr_639 = "_-91d" (String#7170, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


