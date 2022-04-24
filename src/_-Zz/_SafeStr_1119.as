// by nota

//_-Zz._SafeStr_1119

package _-Zz
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1119 implements IMessageParser 
    {

        private var _SafeStr_7892:_SafeStr_1573;
        private var _SafeStr_7388:Boolean;


        public function flush():Boolean
        {
            _SafeStr_7892 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7892 = new _SafeStr_1573(_arg_1);
            _SafeStr_7388 = _arg_1.readBoolean();
            return (true);
        }

        public function get pet():_SafeStr_1573
        {
            return (_SafeStr_7892);
        }

        public function openInventory():Boolean
        {
            return (_SafeStr_7388);
        }


    }
}//package _-Zz

// _SafeStr_1119 = "_-Me" (String#8033, DoABC#3)
// _SafeStr_1573 = "_-iW" (String#9562, DoABC#3)
// _SafeStr_7388 = "_-6S" (String#6988, DoABC#3)
// _SafeStr_7892 = "_-c1H" (String#9110, DoABC#3)


