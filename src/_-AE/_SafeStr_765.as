// by nota

//_-AE._SafeStr_765

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1052;

    [SecureSWF(rename="true")]
    public class _SafeStr_765 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_765(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1052);
        }

        public function getParser():_SafeStr_1052
        {
            return (this._SafeStr_7012 as _SafeStr_1052);
        }


    }
}//package _-AE

// _SafeStr_1052 = "_-I1P" (String#7724, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_765 = "_-a" (String#8956, DoABC#3)


