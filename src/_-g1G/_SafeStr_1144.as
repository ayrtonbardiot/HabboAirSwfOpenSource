// by nota

//_-g1G._SafeStr_1144

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-AE._SafeStr_1533;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1144 implements IMessageParser 
    {

        private var _bundleDiscountRuleset:_SafeStr_1533;


        public function get bundleDiscountRuleset():_SafeStr_1533
        {
            return (_bundleDiscountRuleset);
        }

        public function flush():Boolean
        {
            _bundleDiscountRuleset = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _bundleDiscountRuleset = new _SafeStr_1533(_arg_1);
            return (true);
        }


    }
}//package _-g1G

// _SafeStr_1144 = "_-01y" (String#6498, DoABC#3)
// _SafeStr_1533 = "_-Z14" (String#8886, DoABC#3)


