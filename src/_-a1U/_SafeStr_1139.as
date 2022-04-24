// by nota

//_-a1U._SafeStr_1139

package _-a1U
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1139 implements IMessageParser 
    {

        private var _SafeStr_5049:int;
        private var _SafeStr_7142:String;
        private var _SafeStr_7143:String;


        public function flush():Boolean
        {
            _SafeStr_7142 = "";
            _SafeStr_7143 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5049 = _arg_1.readInteger();
            _SafeStr_7142 = _arg_1.readString();
            _SafeStr_7143 = _arg_1.readString();
            return (true);
        }

        public function get currentTokenId():int
        {
            return (_SafeStr_5049);
        }

        public function get fallbackFigureString():String
        {
            return (_SafeStr_7142);
        }

        public function get fallbackFigureGender():String
        {
            return (_SafeStr_7143);
        }


    }
}//package _-a1U

// _SafeStr_1139 = "_-l2" (String#9762, DoABC#3)
// _SafeStr_5049 = "_-j1J" (String#9595, DoABC#3)
// _SafeStr_7142 = "_-I1g" (String#7732, DoABC#3)
// _SafeStr_7143 = "_-L1E" (String#7937, DoABC#3)


