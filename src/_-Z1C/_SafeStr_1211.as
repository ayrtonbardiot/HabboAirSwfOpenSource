// by nota

//_-Z1C._SafeStr_1211

package _-Z1C
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1211 implements IMessageParser 
    {

        private var _SafeStr_3693:int;
        private var _SafeStr_7053:int;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3693 = _arg_1.readInteger();
            _SafeStr_7053 = _arg_1.readInteger();
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_3693 = 0;
            _SafeStr_7053 = 0;
            return (true);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get errorCode():int
        {
            return (_SafeStr_7053);
        }


    }
}//package _-Z1C

// _SafeStr_1211 = "_-q14" (String#10032, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)


