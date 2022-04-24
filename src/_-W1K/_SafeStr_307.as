// by nota

//_-W1K._SafeStr_307

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1122;

    [SecureSWF(rename="true")]
    public class _SafeStr_307 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_307(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1122);
        }

        public function get data():_SafeStr_1171
        {
            return (_SafeStr_1122(_SafeStr_7012).data);
        }

        public function get guildId():int
        {
            return (_SafeStr_1122(_SafeStr_7012).guildId);
        }


    }
}//package _-W1K

// _SafeStr_1122 = "_-NC" (String#8090, DoABC#3)
// _SafeStr_1171 = "_-rf" (String#10164, DoABC#3)
// _SafeStr_307 = "_-X1B" (String#8769, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


