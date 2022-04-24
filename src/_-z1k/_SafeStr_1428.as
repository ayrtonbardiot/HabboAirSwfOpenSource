// by nota

//_-Z1K._SafeStr_1428

package _-Z1K
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1428 implements IMessageParser 
    {

        private var _SafeStr_7885:int;
        private var _SafeStr_7886:int;


        public function get openHour():int
        {
            return (_SafeStr_7885);
        }

        public function get openMinute():int
        {
            return (_SafeStr_7886);
        }

        public function flush():Boolean
        {
            _SafeStr_7885 = 0;
            _SafeStr_7886 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7885 = _arg_1.readInteger();
            _SafeStr_7886 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-Z1K

// _SafeStr_1428 = "_-01D" (String#6473, DoABC#3)
// _SafeStr_7885 = "_-t1J" (String#10249, DoABC#3)
// _SafeStr_7886 = "_-7V" (String#7049, DoABC#3)


