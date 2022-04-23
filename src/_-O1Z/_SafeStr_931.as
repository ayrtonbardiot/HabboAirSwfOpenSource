// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-O1Z._SafeStr_931

package _-O1Z
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-81O._SafeStr_1519;

    [SecureSWF(rename="true")]
    public class _SafeStr_931 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_931(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1519);
        }

        public function getParser():_SafeStr_1519
        {
            return (_SafeStr_7012 as _SafeStr_1519);
        }


    }
}//package _-O1Z

// _SafeStr_1519 = "_-Os" (String#8218, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_931 = "_-1Y" (String#6610, DoABC#3)


