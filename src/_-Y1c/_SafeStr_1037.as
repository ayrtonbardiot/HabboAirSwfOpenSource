// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Y1c._SafeStr_1037

package _-Y1c
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-t1I._SafeStr_1229;

    [SecureSWF(rename="true")]
    public class _SafeStr_1037 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_1037(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1229);
        }

        public function getParser():_SafeStr_1229
        {
            return (_SafeStr_7012 as _SafeStr_1229);
        }


    }
}//package _-Y1c

// _SafeStr_1037 = "_-2u" (String#6707, DoABC#3)
// _SafeStr_1229 = "_-J1x" (String#7788, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


