// by nota

//_-Lc._SafeStr_1355

package _-Lc
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1355 implements IMessageParser 
    {

        private var _SafeStr_4519:_SafeStr_1620;
        private var _SafeStr_7388:Boolean;


        public function flush():Boolean
        {
            _SafeStr_4519 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4519 = new _SafeStr_1620(_arg_1);
            _SafeStr_7388 = _arg_1.readBoolean();
            return (true);
        }

        public function get item():_SafeStr_1620
        {
            return (_SafeStr_4519);
        }

        public function openInventory():Boolean
        {
            return (_SafeStr_7388);
        }


    }
}//package _-Lc

// _SafeStr_1355 = "_-Q1s" (String#8301, DoABC#3)
// _SafeStr_1620 = "_-V1f" (String#8625, DoABC#3)
// _SafeStr_4519 = "_-yg" (String#10644, DoABC#3)
// _SafeStr_7388 = "_-6S" (String#6988, DoABC#3)


