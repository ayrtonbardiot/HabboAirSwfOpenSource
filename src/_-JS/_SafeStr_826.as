// by nota

//_-JS._SafeStr_826

package _-JS
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-wm._SafeStr_1065;

    [SecureSWF(rename="true")]
    public class _SafeStr_826 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_826(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1065);
        }

        public function getParser():_SafeStr_1065
        {
            return (this._SafeStr_7012 as _SafeStr_1065);
        }


    }
}//package _-JS

// _SafeStr_1065 = "_-lZ" (String#9776, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_826 = "_-u1m" (String#10323, DoABC#3)


