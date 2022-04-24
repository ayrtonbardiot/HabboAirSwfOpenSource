// by nota

//_-NF._SafeStr_1436

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-W1K._SafeStr_1632;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1436 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1632;


        public function flush():Boolean
        {
            _SafeStr_3740 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1632(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1632
        {
            return (_SafeStr_3740);
        }


    }
}//package _-NF

// _SafeStr_1436 = "_-f1A" (String#9326, DoABC#3)
// _SafeStr_1632 = "_-q1C" (String#10040, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


