// by nota

//_-W1K._SafeStr_1632

package _-W1K
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1632 
    {

        private var _SafeStr_7676:int;
        private var _SafeStr_7677:String;
        private var _SafeStr_7678:Number;
        private var _SafeStr_7679:int;
        private var _SafeStr_7680:int;
        private var _SafeStr_7681:int;
        private var _SafeStr_7682:int;
        private var _SafeStr_7683:int;
        private var _SafeStr_7684:int;

        public function _SafeStr_1632(_arg_1:IMessageDataWrapper=null)
        {
            _SafeStr_7676 = _arg_1.readInteger();
            _SafeStr_7677 = _arg_1.readString();
            _SafeStr_7678 = _arg_1.readDouble();
            _SafeStr_7679 = _arg_1.readInteger();
            _SafeStr_7680 = _arg_1.readInteger();
            _SafeStr_7681 = _arg_1.readInteger();
            _SafeStr_7682 = _arg_1.readInteger();
            _SafeStr_7683 = _arg_1.readInteger();
            _SafeStr_7684 = _arg_1.readInteger();
        }

        public function get currentHcStreak():int
        {
            return (_SafeStr_7676);
        }

        public function get firstSubscriptionDate():String
        {
            return (_SafeStr_7677);
        }

        public function get kickbackPercentage():Number
        {
            return (_SafeStr_7678);
        }

        public function get totalCreditsMissed():int
        {
            return (_SafeStr_7679);
        }

        public function get totalCreditsRewarded():int
        {
            return (_SafeStr_7680);
        }

        public function get totalCreditsSpent():int
        {
            return (_SafeStr_7681);
        }

        public function get creditRewardForStreakBonus():int
        {
            return (_SafeStr_7682);
        }

        public function get creditRewardForMonthlySpent():int
        {
            return (_SafeStr_7683);
        }

        public function get timeUntilPayday():int
        {
            return (_SafeStr_7684);
        }


    }
}//package _-W1K

// _SafeStr_1632 = "_-q1C" (String#10040, DoABC#3)
// _SafeStr_7676 = "_-8H" (String#7122, DoABC#3)
// _SafeStr_7677 = "_-V1K" (String#8609, DoABC#3)
// _SafeStr_7678 = "_-wa" (String#10487, DoABC#3)
// _SafeStr_7679 = "_-223" (String#6658, DoABC#3)
// _SafeStr_7680 = "_-yG" (String#10617, DoABC#3)
// _SafeStr_7681 = "_-p1P" (String#9985, DoABC#3)
// _SafeStr_7682 = "_-u1y" (String#10330, DoABC#3)
// _SafeStr_7683 = "_-jH" (String#9620, DoABC#3)
// _SafeStr_7684 = "_-e1o" (String#9286, DoABC#3)


