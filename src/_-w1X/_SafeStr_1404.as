// by nota

//_-w1X._SafeStr_1404

package _-w1X
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1404 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1535;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1535();
            _SafeStr_3740.parse(_arg_1);
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_3740 = null;
            return (true);
        }

        public function cloneData():_SafeStr_1535
        {
            return ((_SafeStr_3740) ? _SafeStr_3740.clone() : null);
        }


    }
}//package _-w1X

// _SafeStr_1404 = "_-b18" (String#9041, DoABC#3)
// _SafeStr_1535 = "_-V1E" (String#8606, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


