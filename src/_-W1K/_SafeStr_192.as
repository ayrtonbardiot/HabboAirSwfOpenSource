// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_192

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1060;

    [SecureSWF(rename="true")]
    public class _SafeStr_192 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_192(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1060);
        }

        public function get giverUserId():int
        {
            return (_SafeStr_1060(_SafeStr_7012).giverUserId);
        }

        public function get handItemType():int
        {
            return (_SafeStr_1060(_SafeStr_7012).handItemType);
        }


    }
}//package _-W1K

// _SafeStr_1060 = "_-N1z" (String#8083, DoABC#3)
// _SafeStr_192 = "_-i1I" (String#9526, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


