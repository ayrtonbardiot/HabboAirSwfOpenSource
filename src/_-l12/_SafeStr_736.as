// by nota

//_-l12._SafeStr_736

package _-l12
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-u1V._SafeStr_1522;

    [SecureSWF(rename="true")]
    public class _SafeStr_736 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_736(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1522);
        }

        public function getParser():_SafeStr_1522
        {
            return (this._SafeStr_7012 as _SafeStr_1522);
        }


    }
}//package _-l12

// _SafeStr_1522 = "_-BH" (String#7331, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_736 = "_-r1D" (String#10118, DoABC#3)


