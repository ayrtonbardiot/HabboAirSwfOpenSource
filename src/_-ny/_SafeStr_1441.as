// by nota

//_-ny._SafeStr_1441

package _-ny
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1441 implements IMessageParser 
    {

        private var _SafeStr_7058:int;
        private var _SafeStr_7458:int;


        public function get resultCode():int
        {
            return (_SafeStr_7058);
        }

        public function get millisecondsToAllowProcessReset():int
        {
            return (_SafeStr_7458);
        }

        public function flush():Boolean
        {
            _SafeStr_7058 = -1;
            _SafeStr_7458 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7058 = _arg_1.readInteger();
            _SafeStr_7458 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-ny

// _SafeStr_1441 = "_-g1N" (String#9394, DoABC#3)
// _SafeStr_7058 = "_-t1u" (String#10267, DoABC#3)
// _SafeStr_7458 = "_-N1n" (String#8076, DoABC#3)


