// by nota

//_-d1i._SafeStr_771

package _-d1i
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help._SafeStr_1376;

    [SecureSWF(rename="true")]
    public class _SafeStr_771 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_771(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1376);
        }

        public function getParser():_SafeStr_1376
        {
            return (_SafeStr_7012 as _SafeStr_1376);
        }


    }
}//package _-d1i

// _SafeStr_1376 = "_-Ny" (String#8125, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_771 = "_-U" (String#8538, DoABC#3)


