// by nota

//_-Z1C._SafeStr_1329

package _-Z1C
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1329 implements IMessageParser 
    {

        private var _SafeStr_3693:int;
        private var _SafeStr_4128:int;


        public function flush():Boolean
        {
            _SafeStr_3693 = 0;
            _SafeStr_4128 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3693 = _arg_1.readInteger();
            _SafeStr_4128 = _arg_1.readInteger();
            return (true);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }


    }
}//package _-Z1C

// _SafeStr_1329 = "_-w17" (String#10439, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)


