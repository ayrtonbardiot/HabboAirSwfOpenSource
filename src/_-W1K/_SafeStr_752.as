// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-W1K._SafeStr_752

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1462;

    [SecureSWF(rename="true")]
    public class _SafeStr_752 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_752(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1462);
        }

        public function get userId():int
        {
            return ((_SafeStr_7012 as _SafeStr_1462).userId);
        }

        public function get respectTotal():int
        {
            return ((_SafeStr_7012 as _SafeStr_1462).respectTotal);
        }


    }
}//package _-W1K

// _SafeStr_1462 = "_-43" (String#6841, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_752 = "_-X1q" (String#8785, DoABC#3)


