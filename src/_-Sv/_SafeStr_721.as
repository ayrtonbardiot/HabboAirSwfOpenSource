// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Sv._SafeStr_721

package _-Sv
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-ny._SafeStr_1312;

    [SecureSWF(rename="true")]
    public class _SafeStr_721 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_721(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1312);
        }

        public function getParser():_SafeStr_1312
        {
            return (_SafeStr_7012 as _SafeStr_1312);
        }


    }
}//package _-Sv

// _SafeStr_1312 = "_-vh" (String#10422, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_721 = "_-N1F" (String#8057, DoABC#3)


