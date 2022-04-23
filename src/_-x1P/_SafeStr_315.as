// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-x1P._SafeStr_315

package _-x1P
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-V1k._SafeStr_1239;

    [SecureSWF(rename="true")]
    public class _SafeStr_315 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_315(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1239);
        }

        public function getParser():_SafeStr_1239
        {
            return (_SafeStr_7012 as _SafeStr_1239);
        }


    }
}//package _-x1P

// _SafeStr_1239 = "_-N9" (String#8088, DoABC#3)
// _SafeStr_315 = "_-BI" (String#7332, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


