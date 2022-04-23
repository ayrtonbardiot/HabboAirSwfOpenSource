// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_1541

package _-AE
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1541 extends _SafeStr_1540 
    {

        private var _SafeStr_7157:int;
        private var _SafeStr_7158:int;
        private var _SafeStr_7159:int;
        private var _SafeStr_7160:int;

        public function _SafeStr_1541(_arg_1:IMessageDataWrapper)
        {
            super(_arg_1);
            _SafeStr_7157 = _arg_1.readInteger();
            _SafeStr_7158 = _arg_1.readInteger();
            _SafeStr_7159 = _arg_1.readInteger();
            _SafeStr_7160 = _arg_1.readInteger();
        }

        public function get originalPrice():int
        {
            return (_SafeStr_7157 * months);
        }

        public function get originalActivityPointPrice():int
        {
            return (_SafeStr_7158 * months);
        }

        public function get originalActivityPointType():int
        {
            return (_SafeStr_7159);
        }

        public function get discountCreditAmount():int
        {
            return ((_SafeStr_7157 * months) - this.priceCredits);
        }

        public function get discountActivityPointAmount():int
        {
            return ((originalActivityPointPrice * months) - this.priceActivityPoints);
        }

        public function get subscriptionDaysLeft():int
        {
            return (_SafeStr_7160);
        }


    }
}//package _-AE

// _SafeStr_1540 = "_-E1Y" (String#7475, DoABC#3)
// _SafeStr_1541 = "_-51r" (String#6898, DoABC#3)
// _SafeStr_7157 = "_-81i" (String#7106, DoABC#3)
// _SafeStr_7158 = "_-i1Z" (String#9533, DoABC#3)
// _SafeStr_7159 = "_-s1a" (String#10193, DoABC#3)
// _SafeStr_7160 = "_-3Y" (String#6781, DoABC#3)


