// by nota

//_-Ja._SafeStr_787

package _-Ja
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-31H._SafeStr_1236;

    [SecureSWF(rename="true")]
    public class _SafeStr_787 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_787(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1236);
        }

        public function get userName():String
        {
            return ((this._SafeStr_7012 as _SafeStr_1236).userName);
        }


    }
}//package _-Ja

// _SafeStr_1236 = "_-Q1R" (String#8293, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_787 = "_-9t" (String#7203, DoABC#3)


