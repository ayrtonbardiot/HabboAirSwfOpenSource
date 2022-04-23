// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_418

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1163;
    import com.sulake.core.utils._SafeStr_24;

    [SecureSWF(rename="true")]
    public class _SafeStr_418 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_418(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1163);
        }

        public function get userId():int
        {
            return ((_SafeStr_7012 as _SafeStr_1163).userId);
        }

        public function get relationshipStatusMap():_SafeStr_24
        {
            return ((_SafeStr_7012 as _SafeStr_1163).relationshipStatusMap);
        }


    }
}//package _-W1K

// _SafeStr_1163 = "_-Al" (String#7294, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_418 = "_-412" (String#6799, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


