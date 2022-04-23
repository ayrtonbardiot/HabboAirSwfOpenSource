// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1S._SafeStr_728

package _-W1S
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-a1d._SafeStr_1269;

    [SecureSWF(rename="true")]
    public class _SafeStr_728 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_728(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1269);
        }

        public function getParser():_SafeStr_1269
        {
            return (_SafeStr_7012 as _SafeStr_1269);
        }


    }
}//package _-W1S

// _SafeStr_1269 = "_-F1N" (String#7539, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_728 = "_-U1y" (String#8564, DoABC#3)


