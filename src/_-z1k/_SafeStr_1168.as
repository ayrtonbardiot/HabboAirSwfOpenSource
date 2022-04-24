// by nota

//_-Z1K._SafeStr_1168

package _-Z1K
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1168 implements IMessageParser 
    {

        private var _SafeStr_7885:int;
        private var _SafeStr_7886:int;
        private var _SafeStr_7887:Boolean;


        public function get openHour():int
        {
            return (_SafeStr_7885);
        }

        public function get openMinute():int
        {
            return (_SafeStr_7886);
        }

        public function get userThrownOutAtClose():Boolean
        {
            return (_SafeStr_7887);
        }

        public function flush():Boolean
        {
            _SafeStr_7885 = 0;
            _SafeStr_7886 = 0;
            _SafeStr_7887 = false;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7885 = _arg_1.readInteger();
            _SafeStr_7886 = _arg_1.readInteger();
            _SafeStr_7887 = _arg_1.readBoolean();
            return (true);
        }


    }
}//package _-Z1K

// _SafeStr_1168 = "_-21Y" (String#6636, DoABC#3)
// _SafeStr_7885 = "_-t1J" (String#10249, DoABC#3)
// _SafeStr_7886 = "_-7V" (String#7049, DoABC#3)
// _SafeStr_7887 = "_-zB" (String#10684, DoABC#3)


