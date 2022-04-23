// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_631

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1111;

    [SecureSWF(rename="true")]
    public class _SafeStr_631 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_631(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1111);
        }

        public function get reason():int
        {
            return (_SafeStr_1111(_SafeStr_7012).reason);
        }

        public function get guildId():int
        {
            return (_SafeStr_1111(_SafeStr_7012).guildId);
        }


    }
}//package _-W1K

// _SafeStr_1111 = "_-9T" (String#7193, DoABC#3)
// _SafeStr_631 = "_-D1v" (String#7438, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


