// by nota

//_-EK._SafeStr_446

package _-EK
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-28._SafeStr_1524;

    [SecureSWF(rename="true")]
    public class _SafeStr_446 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_446(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1524);
        }

        public function get amount():int
        {
            return ((_SafeStr_7012 as _SafeStr_1524).amount);
        }

        public function get change():int
        {
            return ((_SafeStr_7012 as _SafeStr_1524).change);
        }

        public function get type():int
        {
            return ((_SafeStr_7012 as _SafeStr_1524).type);
        }


    }
}//package _-EK

// _SafeStr_1524 = "_-88" (String#7115, DoABC#3)
// _SafeStr_446 = "_-32Q" (String#6749, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


