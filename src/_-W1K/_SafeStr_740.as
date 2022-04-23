// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_740

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1502;

    [SecureSWF(rename="true")]
    public class _SafeStr_740 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_740(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1502);
        }

        public function get baseRoomId():int
        {
            return (_SafeStr_1502(_SafeStr_7012).baseRoomId);
        }

        public function get groupId():int
        {
            return (_SafeStr_1502(_SafeStr_7012).groupId);
        }


    }
}//package _-W1K

// _SafeStr_1502 = "_-U14" (String#8541, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_740 = "_-714" (String#7010, DoABC#3)


