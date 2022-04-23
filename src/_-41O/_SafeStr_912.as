// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-41O._SafeStr_912

package _-41O
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-3D._SafeStr_1278;

    [SecureSWF(rename="true")]
    public class _SafeStr_912 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_912(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1278);
        }

        public function getParser():_SafeStr_1278
        {
            return (_SafeStr_7012 as _SafeStr_1278);
        }


    }
}//package _-41O

// _SafeStr_1278 = "_-rQ" (String#10156, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_912 = "_-e17" (String#9265, DoABC#3)


