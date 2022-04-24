// by nota

//_-NF._SafeStr_1511

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-W1K._SafeStr_1121;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1511 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1121;


        public function flush():Boolean
        {
            _SafeStr_3740 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1121(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1121
        {
            return (_SafeStr_3740);
        }


    }
}//package _-NF

// _SafeStr_1121 = "_-C1Z" (String#7365, DoABC#3)
// _SafeStr_1511 = "_-c8" (String#9134, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


