// by nota

//_-28._SafeStr_1524

package _-28
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1524 implements IMessageParser 
    {

        private var _amount:int = 0;
        private var _SafeStr_7038:int = 0;
        private var _SafeStr_4028:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _amount = _arg_1.readInteger();
            _SafeStr_7038 = _arg_1.readInteger();
            _SafeStr_4028 = _arg_1.readInteger();
            return (true);
        }

        public function get amount():int
        {
            return (_amount);
        }

        public function get change():int
        {
            return (_SafeStr_7038);
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }


    }
}//package _-28

// _SafeStr_1524 = "_-88" (String#7115, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_7038 = "_-gI" (String#9423, DoABC#3)


