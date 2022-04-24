// by nota

//_-Z1K._SafeStr_1134

package _-Z1K
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1134 implements IMessageParser 
    {

        private var _SafeStr_7883:Boolean;
        private var _SafeStr_7884:int;
        private var _duration:int = 15;


        public function get isInMaintenance():Boolean
        {
            return (_SafeStr_7883);
        }

        public function get minutesUntilMaintenance():int
        {
            return (_SafeStr_7884);
        }

        public function get duration():int
        {
            return (_duration);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7883 = _arg_1.readBoolean();
            _SafeStr_7884 = _arg_1.readInteger();
            if (_arg_1.bytesAvailable)
            {
                _duration = _arg_1.readInteger();
            };
            return (true);
        }


    }
}//package _-Z1K

// _SafeStr_1134 = "_-j11" (String#9583, DoABC#3)
// _SafeStr_7883 = "_-q" (String#10028, DoABC#3)
// _SafeStr_7884 = "_-3f" (String#6784, DoABC#3)


