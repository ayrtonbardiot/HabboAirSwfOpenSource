// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-X7._SafeStr_514

package _-X7
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-A18._SafeStr_1178;

    [SecureSWF(rename="true")]
    public class _SafeStr_514 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_514(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1178);
        }

        public function getParser():_SafeStr_1178
        {
            return (_SafeStr_7012 as _SafeStr_1178);
        }


    }
}//package _-X7

// _SafeStr_1178 = "_-Q19" (String#8287, DoABC#3)
// _SafeStr_514 = "_-R1j" (String#8352, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


