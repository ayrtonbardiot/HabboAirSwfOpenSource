// by nota

//_-1O._SafeStr_405

package _-1O
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-TY._SafeStr_1116;

    [SecureSWF(rename="true")]
    public class _SafeStr_405 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_405(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1116);
        }

        public function getParser():_SafeStr_1116
        {
            return (this._SafeStr_7012 as _SafeStr_1116);
        }


    }
}//package _-1O

// _SafeStr_1116 = "_-L5" (String#7961, DoABC#3)
// _SafeStr_405 = "_-dl" (String#9246, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


