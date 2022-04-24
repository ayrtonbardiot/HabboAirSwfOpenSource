// by nota

//_-AE._SafeStr_1537

package _-AE
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1537 
    {

        private var _offerId:int;
        private var _SafeStr_6855:Boolean;
        private var _SafeStr_6910:Boolean;
        private var _SafeStr_7156:int;

        public function _SafeStr_1537(_arg_1:IMessageDataWrapper)
        {
            _offerId = _arg_1.readInteger();
            _SafeStr_6855 = _arg_1.readBoolean();
            _SafeStr_7156 = _arg_1.readInteger();
            _SafeStr_6910 = _arg_1.readBoolean();
        }

        public function get offerId():int
        {
            return (_offerId);
        }

        public function get isVip():Boolean
        {
            return (_SafeStr_6855);
        }

        public function get isSelectable():Boolean
        {
            return (_SafeStr_6910);
        }

        public function get daysRequired():int
        {
            return (_SafeStr_7156);
        }


    }
}//package _-AE

// _SafeStr_1537 = "_-a1D" (String#8963, DoABC#3)
// _SafeStr_6855 = "_-n1B" (String#9856, DoABC#3)
// _SafeStr_6910 = "_-I19" (String#7716, DoABC#3)
// _SafeStr_7156 = "_-uP" (String#10350, DoABC#3)


