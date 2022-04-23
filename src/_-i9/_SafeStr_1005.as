// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-i9._SafeStr_1005

package _-i9
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-11c._SafeStr_1380;

    [SecureSWF(rename="true")]
    public class _SafeStr_1005 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_1005(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1380);
        }

        public function getParser():_SafeStr_1380
        {
            return (_SafeStr_7012 as _SafeStr_1380);
        }


    }
}//package _-i9

// _SafeStr_1005 = "_-O1s" (String#8163, DoABC#3)
// _SafeStr_1380 = "_-V1P" (String#8613, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


