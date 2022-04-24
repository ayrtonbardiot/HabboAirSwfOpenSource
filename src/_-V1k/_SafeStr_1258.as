// by nota

//_-V1k._SafeStr_1258

package _-V1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-x1P._SafeStr_1538;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1258 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1538;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1538(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1538
        {
            return (_SafeStr_3740);
        }


    }
}//package _-V1k

// _SafeStr_1258 = "_-e1h" (String#9282, DoABC#3)
// _SafeStr_1538 = "_-8C" (String#7117, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


