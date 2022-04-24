// by nota

//_-W1K._SafeStr_1637

package _-W1K
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1637 
    {

        private var _groupId:int;
        private var _groupName:String;
        private var _SafeStr_4723:String;
        private var _primaryColor:String;
        private var _secondaryColor:String;
        private var _SafeStr_7643:Boolean;
        private var _SafeStr_5226:int;
        private var _SafeStr_7685:Boolean;

        public function _SafeStr_1637(_arg_1:IMessageDataWrapper)
        {
            _groupId = _arg_1.readInteger();
            _groupName = _arg_1.readString();
            _SafeStr_4723 = _arg_1.readString();
            _primaryColor = _arg_1.readString();
            _secondaryColor = _arg_1.readString();
            _SafeStr_7643 = _arg_1.readBoolean();
            _SafeStr_5226 = _arg_1.readInteger();
            _SafeStr_7685 = _arg_1.readBoolean();
        }

        public function get groupId():int
        {
            return (_groupId);
        }

        public function get groupName():String
        {
            return (_groupName);
        }

        public function get badgeCode():String
        {
            return (_SafeStr_4723);
        }

        public function get primaryColor():String
        {
            return (_primaryColor);
        }

        public function get secondaryColor():String
        {
            return (_secondaryColor);
        }

        public function get favourite():Boolean
        {
            return (_SafeStr_7643);
        }

        public function get ownerId():int
        {
            return (_SafeStr_5226);
        }

        public function get hasForum():Boolean
        {
            return (_SafeStr_7685);
        }


    }
}//package _-W1K

// _SafeStr_1637 = "_-M5" (String#8021, DoABC#3)
// _SafeStr_4723 = "_-41q" (String#6834, DoABC#3)
// _SafeStr_5226 = "_-Ld" (String#7981, DoABC#3)
// _SafeStr_7643 = "_-LP" (String#7972, DoABC#3)
// _SafeStr_7685 = "_-W1" (String#8657, DoABC#3)


