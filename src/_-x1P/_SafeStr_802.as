// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-x1P._SafeStr_802

package _-x1P
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-V1k._SafeStr_1503;

    [SecureSWF(rename="true")]
    public class _SafeStr_802 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_802(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1503);
        }

        public function getParser():_SafeStr_1503
        {
            return (_SafeStr_7012 as _SafeStr_1503);
        }


    }
}//package _-x1P

// _SafeStr_1503 = "_-9F" (String#7185, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_802 = "_-31s" (String#6733, DoABC#3)


