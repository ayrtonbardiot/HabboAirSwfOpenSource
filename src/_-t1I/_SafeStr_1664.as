// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-t1I._SafeStr_1664

package _-t1I
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1664 
    {

        public static const _SafeStr_7542:String = "ACH_HabboWayGraduate1";
        public static const _SafeStr_7543:String = "ACH_GuideGroupMember1";
        public static const _SafeStr_7544:String = "ACH_SafetyQuizGraduate1";
        public static const _SafeStr_7545:String = "ACH_EmailVerification1";
        public static const ROOM_ENTRY_1:String = "ACH_RoomEntry1";
        public static const ROOM_ENTRY_2:String = "ACH_RoomEntry2";
        public static const _SafeStr_7546:String = "ACH_AvatarLooks1";
        public static const _SafeStr_7547:String = "ACH_GuideAdvertisementReader1";

        private var _SafeStr_6292:int;
        private var _SafeStr_7479:int;
        private var _SafeStr_4723:String;
        private var _SafeStr_3734:int;
        private var _SafeStr_7096:int;
        private var _SafeStr_7548:int;

        public function _SafeStr_1664(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_6292 = _arg_1.readInteger();
            _SafeStr_7479 = _arg_1.readInteger();
            _SafeStr_4723 = _arg_1.readString();
            _SafeStr_3734 = _arg_1.readInteger();
            _SafeStr_7096 = _arg_1.readInteger();
            _SafeStr_7548 = _arg_1.readInteger();
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function get achievementId():int
        {
            return (_SafeStr_6292);
        }

        public function get requiredLevel():int
        {
            return (_SafeStr_7479);
        }

        public function get badgeCode():String
        {
            return (_SafeStr_4723);
        }

        public function get currentScore():int
        {
            return (_SafeStr_7096);
        }

        public function get totalScore():int
        {
            return (_SafeStr_7548);
        }

        public function hasProgressDisplay():Boolean
        {
            switch (badgeCode)
            {
                case "ACH_HabboWayGraduate1":
                case "ACH_SafetyQuizGraduate1":
                case "ACH_EmailVerification1":
                case "ACH_AvatarLooks1":
                    return (false);
                default:
                    return (true);
            };
        }


    }
}//package _-t1I

// _SafeStr_1664 = "_-CZ" (String#7397, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_4723 = "_-41q" (String#6834, DoABC#3)
// _SafeStr_6292 = "_-Q18" (String#8286, DoABC#3)
// _SafeStr_7096 = "_-nm" (String#9915, DoABC#3)
// _SafeStr_7479 = "_-V12" (String#8601, DoABC#3)
// _SafeStr_7542 = "_-6a" (String#6994, DoABC#3)
// _SafeStr_7543 = "_-77" (String#7035, DoABC#3)
// _SafeStr_7544 = "_-X10" (String#8763, DoABC#3)
// _SafeStr_7545 = "_-eX" (String#9310, DoABC#3)
// _SafeStr_7546 = "_-5d" (String#6921, DoABC#3)
// _SafeStr_7547 = "_-Iq" (String#7760, DoABC#3)
// _SafeStr_7548 = "_-CE" (String#7384, DoABC#3)


