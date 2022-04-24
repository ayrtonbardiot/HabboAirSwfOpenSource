// by nota

//_-W1K._SafeStr_797

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1257;

    [SecureSWF(rename="true")]
    public class _SafeStr_797 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_797(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1257);
        }

        public function get badges():Array
        {
            return ((_SafeStr_7012 as _SafeStr_1257).badges);
        }

        public function get userId():int
        {
            return ((_SafeStr_7012 as _SafeStr_1257).userId);
        }


    }
}//package _-W1K

// _SafeStr_1257 = "_-hq" (String#9507, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_797 = "_-Ax" (String#7299, DoABC#3)


