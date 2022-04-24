// by nota

//_-AE._SafeStr_1024

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1328;

    [SecureSWF(rename="true")]
    public class _SafeStr_1024 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_1024(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1328);
        }

        public function getParser():_SafeStr_1328
        {
            return (this._SafeStr_7012 as _SafeStr_1328);
        }


    }
}//package _-AE

// _SafeStr_1024 = "_-NS" (String#8099, DoABC#3)
// _SafeStr_1328 = "_-Th" (String#8527, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


