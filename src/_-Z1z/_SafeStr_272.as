// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1z._SafeStr_272

package _-Z1z
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-Zz._SafeStr_1119;

    [SecureSWF(rename="true")]
    public class _SafeStr_272 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_272(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1119);
        }

        public function getParser():_SafeStr_1119
        {
            return (_SafeStr_7012 as _SafeStr_1119);
        }


    }
}//package _-Z1z

// _SafeStr_1119 = "_-Me" (String#8033, DoABC#3)
// _SafeStr_272 = "_-mH" (String#9827, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


