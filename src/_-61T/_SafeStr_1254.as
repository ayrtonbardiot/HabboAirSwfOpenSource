// by nota

//_-61T._SafeStr_1254

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1254 implements IMessageParser 
    {

        private var _SafeStr_7107:int;
        private var _SafeStr_7108:Boolean;


        public function get guestRoomId():int
        {
            return (_SafeStr_7107);
        }

        public function get owner():Boolean
        {
            return (_SafeStr_7108);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7107 = _arg_1.readInteger();
            _SafeStr_7108 = _arg_1.readBoolean();
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1254 = "_-i1B" (String#9522, DoABC#3)
// _SafeStr_7107 = "_-UN" (String#8578, DoABC#3)
// _SafeStr_7108 = "_-x1v" (String#10543, DoABC#3)


