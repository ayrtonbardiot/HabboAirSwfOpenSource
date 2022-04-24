// by nota

//_-Ad._SafeStr_1542

package _-Ad
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1542 
    {

        private var _SafeStr_4615:String;
        private var _SafeStr_4655:int;

        public function _SafeStr_1542(_arg_1:String, _arg_2:IMessageDataWrapper)
        {
            _SafeStr_4615 = (("ACH_" + _arg_1) + _arg_2.readInteger());
            _SafeStr_4655 = _arg_2.readInteger();
        }

        public function get badgeId():String
        {
            return (_SafeStr_4615);
        }

        public function get limit():int
        {
            return (_SafeStr_4655);
        }


    }
}//package _-Ad

// _SafeStr_1542 = "_-k1d" (String#9680, DoABC#3)
// _SafeStr_4615 = "_-91W" (String#7167, DoABC#3)
// _SafeStr_4655 = "_-L1W" (String#7947, DoABC#3)


