// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-qw._SafeStr_243

package _-qw
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-kC._SafeStr_1353;

    [SecureSWF(rename="true")]
    public class _SafeStr_243 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_243(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1353);
        }

        public function getParser():_SafeStr_1353
        {
            return (_SafeStr_7012 as _SafeStr_1353);
        }


    }
}//package _-qw

// _SafeStr_1353 = "_-D1X" (String#7426, DoABC#3)
// _SafeStr_243 = "_-br" (String#9095, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


