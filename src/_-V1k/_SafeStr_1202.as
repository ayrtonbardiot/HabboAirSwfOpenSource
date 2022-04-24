// by nota

//_-V1k._SafeStr_1202

package _-V1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-x1P._SafeStr_1561;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1202 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1561;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1561(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1561
        {
            return (_SafeStr_3740);
        }


    }
}//package _-V1k

// _SafeStr_1202 = "_-z1Q" (String#10660, DoABC#3)
// _SafeStr_1561 = "_-Z1k" (String#8909, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


