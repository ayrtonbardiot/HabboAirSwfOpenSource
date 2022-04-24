// by nota

//_-28._SafeStr_1189

package _-28
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-EK._SafeStr_1575;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1189 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1575;


        public function flush():Boolean
        {
            _SafeStr_3740 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1575(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1575
        {
            return (_SafeStr_3740);
        }


    }
}//package _-28

// _SafeStr_1189 = "_-9l" (String#7200, DoABC#3)
// _SafeStr_1575 = "_-s1D" (String#10179, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


