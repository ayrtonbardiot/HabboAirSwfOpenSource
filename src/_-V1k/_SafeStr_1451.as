// by nota

//_-V1k._SafeStr_1451

package _-V1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1451 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1652;


        public function flush():Boolean
        {
            if (_SafeStr_3740 != null)
            {
                _SafeStr_3740.dispose();
                _SafeStr_3740 = null;
            };
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1652(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1652
        {
            return (_SafeStr_3740);
        }


    }
}//package _-V1k

// _SafeStr_1451 = "_-ws" (String#10498, DoABC#3)
// _SafeStr_1652 = "_-Mv" (String#8045, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


