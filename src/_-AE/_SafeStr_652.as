// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_652

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1224;

    [SecureSWF(rename="true")]
    public class _SafeStr_652 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_652(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1224);
        }

        public function get errorCode():String
        {
            return ((_SafeStr_7012 as _SafeStr_1224).errorCode);
        }


    }
}//package _-AE

// _SafeStr_1224 = "_-Ue" (String#8589, DoABC#3)
// _SafeStr_652 = "_-J1e" (String#7780, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


