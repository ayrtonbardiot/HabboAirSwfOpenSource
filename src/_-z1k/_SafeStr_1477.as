// by nota

//_-Z1K._SafeStr_1477

package _-Z1K
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1477 implements IMessageParser 
    {

        private var _isOpen:Boolean;
        private var _SafeStr_7890:Boolean;
        private var _isAuthenticHabbo:Boolean;


        public function get isOpen():Boolean
        {
            return (_isOpen);
        }

        public function get onShutDown():Boolean
        {
            return (_SafeStr_7890);
        }

        public function get isAuthenticHabbo():Boolean
        {
            return (_isAuthenticHabbo);
        }

        public function flush():Boolean
        {
            _isOpen = false;
            _SafeStr_7890 = false;
            _isAuthenticHabbo = false;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _isOpen = _arg_1.readBoolean();
            _SafeStr_7890 = _arg_1.readBoolean();
            if (_arg_1.bytesAvailable)
            {
                _isAuthenticHabbo = _arg_1.readBoolean();
            };
            return (true);
        }


    }
}//package _-Z1K

// _SafeStr_1477 = "_-G12" (String#7584, DoABC#3)
// _SafeStr_7890 = "_-Yb" (String#8875, DoABC#3)


