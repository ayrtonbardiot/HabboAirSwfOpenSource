// by nota

//_-x1P._SafeStr_1669

package _-x1P
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1669 
    {

        private var _SafeStr_3693:int;
        private var _roomName:String;
        private var _SafeStr_7781:int;
        private var _SafeStr_7782:int;

        public function _SafeStr_1669(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_3693 = _arg_1.readInteger();
            _roomName = _arg_1.readString();
            _SafeStr_7781 = _arg_1.readInteger();
            _SafeStr_7782 = _arg_1.readInteger();
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get roomName():String
        {
            return (_roomName);
        }

        public function get enterHour():int
        {
            return (_SafeStr_7781);
        }

        public function get enterMinute():int
        {
            return (_SafeStr_7782);
        }


    }
}//package _-x1P

// _SafeStr_1669 = "_-hL" (String#9495, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_7781 = "_-j1Y" (String#9604, DoABC#3)
// _SafeStr_7782 = "_-St" (String#8463, DoABC#3)


