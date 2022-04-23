// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_973

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1209;

    [SecureSWF(rename="true")]
    public class _SafeStr_973 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_973(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1209);
        }

        public function getParser():_SafeStr_1209
        {
            return (this._SafeStr_7012 as _SafeStr_1209);
        }


    }
}//package _-AE

// _SafeStr_1209 = "_-x1h" (String#10536, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_973 = "_-fx" (String#9380, DoABC#3)


