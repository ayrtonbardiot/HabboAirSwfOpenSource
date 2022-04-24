// by nota

//_-Ol._SafeStr_1602

package _-Ol
{
    [SecureSWF(rename="true")]
    public class _SafeStr_1602 
    {

        private var _SafeStr_5584:String;
        private var _SafeStr_5585:String;

        public function _SafeStr_1602(_arg_1:String, _arg_2:String)
        {
            _SafeStr_5584 = _arg_1;
            _SafeStr_5585 = _arg_2;
        }

        public function get actionType():String
        {
            return (_SafeStr_5584);
        }

        public function get actionParameter():String
        {
            return (_SafeStr_5585);
        }

        public function toString():String
        {
            return ((_SafeStr_5584 + ":") + _SafeStr_5585);
        }


    }
}//package _-Ol

// _SafeStr_1602 = "_-vw" (String#10431, DoABC#3)
// _SafeStr_5584 = "_-zg" (String#10699, DoABC#3)
// _SafeStr_5585 = "_-u1b" (String#10320, DoABC#3)


