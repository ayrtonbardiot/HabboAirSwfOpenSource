// by nota

//_-l1n._SafeStr_1131

package _-l1n
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1131 implements IMessageParser 
    {

        private var _SafeStr_7258:String = "";
        private var _SafeStr_3693:int = 0;


        public function get roomType():String
        {
            return (_SafeStr_7258);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function flush():Boolean
        {
            _SafeStr_7258 = "";
            _SafeStr_3693 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7258 = _arg_1.readString();
            _SafeStr_3693 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-l1n

// _SafeStr_1131 = "_-k1c" (String#9679, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_7258 = "_-U1X" (String#8556, DoABC#3)


