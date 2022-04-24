// by nota

//_-3D._SafeStr_1071

package _-3D
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-41O._SafeStr_1572;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1071 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1572;


        public function flush():Boolean
        {
            _SafeStr_3740 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1572(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1572
        {
            return (_SafeStr_3740);
        }


    }
}//package _-3D

// _SafeStr_1071 = "_-H6" (String#7689, DoABC#3)
// _SafeStr_1572 = "_-E1A" (String#7465, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


