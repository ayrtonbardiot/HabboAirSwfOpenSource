// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-x1P._SafeStr_1564

package _-x1P
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1564 
    {

        private var _SafeStr_4128:int;
        private var _userName:String;
        private var _SafeStr_7750:int;
        private var _SafeStr_7751:int;
        private var _online:Boolean;
        private var _SafeStr_7752:int;
        private var _SafeStr_7753:int;
        private var _SafeStr_7754:int;
        private var _SafeStr_7755:int;
        private var _SafeStr_7756:int;
        private var _SafeStr_7757:String;
        private var _SafeStr_7758:String;
        private var _SafeStr_7759:int;
        private var _SafeStr_7760:int;
        private var _SafeStr_7761:String;
        private var _SafeStr_3819:String;
        private var _SafeStr_7762:String;
        private var _SafeStr_7763:String = "";
        private var _SafeStr_7764:int = 0;

        public function _SafeStr_1564(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4128 = _arg_1.readInteger();
            _userName = _arg_1.readString();
            _SafeStr_3819 = _arg_1.readString();
            _SafeStr_7750 = _arg_1.readInteger();
            _SafeStr_7751 = _arg_1.readInteger();
            _online = _arg_1.readBoolean();
            _SafeStr_7752 = _arg_1.readInteger();
            _SafeStr_7753 = _arg_1.readInteger();
            _SafeStr_7754 = _arg_1.readInteger();
            _SafeStr_7755 = _arg_1.readInteger();
            _SafeStr_7756 = _arg_1.readInteger();
            _SafeStr_7757 = _arg_1.readString();
            _SafeStr_7758 = _arg_1.readString();
            _SafeStr_7759 = _arg_1.readInteger();
            _SafeStr_7760 = _arg_1.readInteger();
            _SafeStr_7761 = _arg_1.readString();
            _SafeStr_7762 = _arg_1.readString();
            if (_arg_1.bytesAvailable)
            {
                _SafeStr_7763 = _arg_1.readString();
                _SafeStr_7764 = _arg_1.readInteger();
            };
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get registrationAgeInMinutes():int
        {
            return (_SafeStr_7750);
        }

        public function get minutesSinceLastLogin():int
        {
            return (_SafeStr_7751);
        }

        public function get online():Boolean
        {
            return (_online);
        }

        public function get cfhCount():int
        {
            return (_SafeStr_7752);
        }

        public function get abusiveCfhCount():int
        {
            return (_SafeStr_7753);
        }

        public function get cautionCount():int
        {
            return (_SafeStr_7754);
        }

        public function get banCount():int
        {
            return (_SafeStr_7755);
        }

        public function get tradingLockCount():int
        {
            return (_SafeStr_7756);
        }

        public function get tradingExpiryDate():String
        {
            return (_SafeStr_7757);
        }

        public function get lastPurchaseDate():String
        {
            return (_SafeStr_7758);
        }

        public function get identityId():int
        {
            return (_SafeStr_7759);
        }

        public function get identityRelatedBanCount():int
        {
            return (_SafeStr_7760);
        }

        public function get primaryEmailAddress():String
        {
            return (_SafeStr_7761);
        }

        public function get userClassification():String
        {
            return (_SafeStr_7762);
        }

        public function get lastSanctionTime():String
        {
            return (_SafeStr_7763);
        }

        public function get sanctionAgeHours():int
        {
            return (_SafeStr_7764);
        }


    }
}//package _-x1P

// _SafeStr_1564 = "_-b10" (String#9037, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_7750 = "_-S3" (String#8430, DoABC#3)
// _SafeStr_7751 = "_-71v" (String#7032, DoABC#3)
// _SafeStr_7752 = "_-DH" (String#7444, DoABC#3)
// _SafeStr_7753 = "_-cX" (String#9147, DoABC#3)
// _SafeStr_7754 = "_-P1f" (String#8243, DoABC#3)
// _SafeStr_7755 = "_-D1A" (String#7417, DoABC#3)
// _SafeStr_7756 = "_-F11" (String#7526, DoABC#3)
// _SafeStr_7757 = "_-G9" (String#7621, DoABC#3)
// _SafeStr_7758 = "_-Si" (String#8456, DoABC#3)
// _SafeStr_7759 = "_-E1K" (String#7469, DoABC#3)
// _SafeStr_7760 = "_-eC" (String#9299, DoABC#3)
// _SafeStr_7761 = "_-1c" (String#6613, DoABC#3)
// _SafeStr_7762 = "_-X1h" (String#8782, DoABC#3)
// _SafeStr_7763 = "_-Sq" (String#8461, DoABC#3)
// _SafeStr_7764 = "_-S1G" (String#8402, DoABC#3)


