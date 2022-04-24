// by nota

//_-g1G._SafeStr_1316

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-AE._SafeStr_1619;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1316 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1619;


        public function flush():Boolean
        {
            _SafeStr_3740 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1619().parse(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1619
        {
            return (_SafeStr_3740);
        }


    }
}//package _-g1G

// _SafeStr_1316 = "_-v1T" (String#10386, DoABC#3)
// _SafeStr_1619 = "_-12w" (String#6587, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


