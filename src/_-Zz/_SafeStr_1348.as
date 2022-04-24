// by nota

//_-Zz._SafeStr_1348

package _-Zz
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1348 implements IMessageParser 
    {

        private var _SafeStr_7389:Boolean;
        private var _SafeStr_7892:_SafeStr_1573;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7389 = _arg_1.readBoolean();
            _SafeStr_7892 = new _SafeStr_1573(_arg_1);
            return (true);
        }

        public function get boughtAsGift():Boolean
        {
            return (_SafeStr_7389);
        }

        public function get pet():_SafeStr_1573
        {
            return (_SafeStr_7892);
        }


    }
}//package _-Zz

// _SafeStr_1348 = "_-02G" (String#6506, DoABC#3)
// _SafeStr_1573 = "_-iW" (String#9562, DoABC#3)
// _SafeStr_7389 = "_-22n" (String#6676, DoABC#3)
// _SafeStr_7892 = "_-c1H" (String#9110, DoABC#3)


