// by nota

//_-W1K._SafeStr_1171

package _-W1K
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1171 
    {

        private static const _SafeStr_7652:int = 0;
        private static const _SafeStr_7653:int = 1;
        private static const _SafeStr_7654:int = 2;
        private static const _SafeStr_7655:int = 3;
        private static const _SafeStr_7656:int = 4;

        private var _SafeStr_4028:int;
        private var _SafeStr_4128:int;
        private var _userName:String;
        private var _SafeStr_3819:String;
        private var _SafeStr_7657:String;

        public function _SafeStr_1171(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4028 = _arg_1.readInteger();
            _SafeStr_4128 = _arg_1.readInteger();
            _userName = _arg_1.readString();
            _SafeStr_3819 = _arg_1.readString();
            _SafeStr_7657 = _arg_1.readString();
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get admin():Boolean
        {
            return (_SafeStr_4028 == 1);
        }

        public function get owner():Boolean
        {
            return (_SafeStr_4028 == 0);
        }

        public function get member():Boolean
        {
            return (!(_SafeStr_4028 == 3));
        }

        public function get blocked():Boolean
        {
            return (_SafeStr_4028 == 4);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get memberSince():String
        {
            return (_SafeStr_7657);
        }


    }
}//package _-W1K

// _SafeStr_1171 = "_-rf" (String#10164, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_7652 = "_-mQ" (String#9830, DoABC#3)
// _SafeStr_7653 = "_-x1f" (String#10535, DoABC#3)
// _SafeStr_7654 = "_-G1I" (String#7591, DoABC#3)
// _SafeStr_7655 = "_-ur" (String#10366, DoABC#3)
// _SafeStr_7656 = "_-1s" (String#6620, DoABC#3)
// _SafeStr_7657 = "_-E6" (String#7486, DoABC#3)


