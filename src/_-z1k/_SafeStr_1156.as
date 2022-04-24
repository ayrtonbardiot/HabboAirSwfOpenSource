// by nota

//_-z1k._SafeStr_1156

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1156 implements IMessageParser 
    {

        private var _SafeStr_4157:int;
        private var _SafeStr_4332:int;
        private var _SafeStr_7869:String;
        private var _SafeStr_4333:int;
        private var _SafeStr_4334:Boolean;
        private var _SafeStr_4335:Boolean;


        public function get objectId():int
        {
            return (_SafeStr_4157);
        }

        public function get guildId():int
        {
            return (_SafeStr_4332);
        }

        public function get guildName():String
        {
            return (_SafeStr_7869);
        }

        public function get guildHomeRoomId():int
        {
            return (_SafeStr_4333);
        }

        public function get userIsMember():Boolean
        {
            return (_SafeStr_4334);
        }

        public function get guildHasReadableForum():Boolean
        {
            return (_SafeStr_4335);
        }

        public function flush():Boolean
        {
            _SafeStr_4157 = -1;
            _SafeStr_4332 = -1;
            _SafeStr_7869 = "";
            _SafeStr_4333 = -1;
            _SafeStr_4334 = false;
            _SafeStr_4335 = false;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_4157 = _arg_1.readInteger();
            _SafeStr_4332 = _arg_1.readInteger();
            _SafeStr_7869 = _arg_1.readString();
            _SafeStr_4333 = _arg_1.readInteger();
            _SafeStr_4334 = _arg_1.readBoolean();
            _SafeStr_4335 = _arg_1.readBoolean();
            return (true);
        }


    }
}//package _-z1k

// _SafeStr_1156 = "_-uY" (String#10356, DoABC#3)
// _SafeStr_4157 = "_-G8" (String#7620, DoABC#3)
// _SafeStr_4332 = "_-lq" (String#9784, DoABC#3)
// _SafeStr_4333 = "_-uF" (String#10343, DoABC#3)
// _SafeStr_4334 = "_-YN" (String#8868, DoABC#3)
// _SafeStr_4335 = "_-z3" (String#10680, DoABC#3)
// _SafeStr_7869 = "_-c1L" (String#9112, DoABC#3)


