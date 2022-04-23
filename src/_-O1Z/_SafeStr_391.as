// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-O1Z._SafeStr_391

package _-O1Z
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-81O._SafeStr_1207;

    [SecureSWF(rename="true")]
    public class _SafeStr_391 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_391(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1207);
        }

        public function getParser():_SafeStr_1207
        {
            return (_SafeStr_7012 as _SafeStr_1207);
        }


    }
}//package _-O1Z

// _SafeStr_1207 = "_-kb" (String#9708, DoABC#3)
// _SafeStr_391 = "_-P1G" (String#8231, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


