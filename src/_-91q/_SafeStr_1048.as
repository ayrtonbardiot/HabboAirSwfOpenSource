// by nota

//_-91q._SafeStr_1048

package _-91q
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1048 implements IMessageParser 
    {

        private var _SafeStr_7053:int = 0;
        private var _SafeStr_7131:String;


        public function get errorCode():int
        {
            return (_SafeStr_7053);
        }

        public function get filteredText():String
        {
            return (_SafeStr_7131);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7053 = _arg_1.readInteger();
            _SafeStr_7131 = _arg_1.readString();
            return (true);
        }


    }
}//package _-91q

// _SafeStr_1048 = "_-nT" (String#9903, DoABC#3)
// _SafeStr_7053 = "_-66" (String#6980, DoABC#3)
// _SafeStr_7131 = "_-5I" (String#6911, DoABC#3)


