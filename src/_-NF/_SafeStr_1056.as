// by nota

//_-NF._SafeStr_1056

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1056 implements IMessageParser 
    {

        private var _SafeStr_7431:String;
        private var _SafeStr_7432:Boolean;
        private var _SafeStr_7433:Boolean;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7431 = _arg_1.readString();
            _SafeStr_7432 = _arg_1.readBoolean();
            _SafeStr_7433 = _arg_1.readBoolean();
            return (true);
        }

        public function get email():String
        {
            return (_SafeStr_7431);
        }

        public function get isVerified():Boolean
        {
            return (_SafeStr_7432);
        }

        public function get allowChange():Boolean
        {
            return (_SafeStr_7433);
        }


    }
}//package _-NF

// _SafeStr_1056 = "_-614" (String#6938, DoABC#3)
// _SafeStr_7431 = "_-RV" (String#8378, DoABC#3)
// _SafeStr_7432 = "_-K1l" (String#7894, DoABC#3)
// _SafeStr_7433 = "_-Z1l" (String#8910, DoABC#3)


