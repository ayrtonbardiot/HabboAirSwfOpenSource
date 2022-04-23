// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_241

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1129;

    [SecureSWF(rename="true")]
    public class _SafeStr_241 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_241(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1129);
        }

        public function get groupId():int
        {
            return (_SafeStr_1129(_SafeStr_7012).groupId);
        }


    }
}//package _-W1K

// _SafeStr_1129 = "_-M13" (String#7992, DoABC#3)
// _SafeStr_241 = "_-nv" (String#9917, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


