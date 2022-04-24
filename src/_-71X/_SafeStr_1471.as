// by nota

//_-71X._SafeStr_1471

package _-71X
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1471 implements IMessageParser 
    {

        private var _SafeStr_7123:String;
        private var _SafeStr_4723:String;


        public function flush():Boolean
        {
            _SafeStr_7123 = "";
            _SafeStr_4723 = "";
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7123 = _arg_1.readString();
            _SafeStr_4723 = _arg_1.readString();
            return (true);
        }

        public function get stuffCode():String
        {
            return (_SafeStr_7123);
        }

        public function get badgeCode():String
        {
            return (_SafeStr_4723);
        }


    }
}//package _-71X

// _SafeStr_1471 = "_-v1W" (String#10388, DoABC#3)
// _SafeStr_4723 = "_-41q" (String#6834, DoABC#3)
// _SafeStr_7123 = "_-LZ" (String#7978, DoABC#3)


