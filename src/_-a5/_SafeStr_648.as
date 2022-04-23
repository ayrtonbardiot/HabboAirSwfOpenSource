// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-a5._SafeStr_648

package _-a5
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Z1K._SafeStr_1174;

    [SecureSWF(rename="true")]
    public class _SafeStr_648 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_648(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1174);
        }

        public function getParser():_SafeStr_1174
        {
            return (_SafeStr_7012 as _SafeStr_1174);
        }


    }
}//package _-a5

// _SafeStr_1174 = "_-61I" (String#6944, DoABC#3)
// _SafeStr_648 = "_-a1e" (String#8980, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


