// by nota

//_-W1K._SafeStr_516

package _-W1K
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-NF._SafeStr_1341;

    [SecureSWF(rename="true")]
    public class _SafeStr_516 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_516(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1341);
        }

        public function get result():int
        {
            return ((_SafeStr_7012 as _SafeStr_1341).result);
        }

        public function get name():String
        {
            return ((_SafeStr_7012 as _SafeStr_1341).name);
        }


    }
}//package _-W1K

// _SafeStr_1341 = "_-hE" (String#9490, DoABC#3)
// _SafeStr_516 = "_-w1k" (String#10463, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)


