// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_1563

package _-AE
{
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1563 
    {

        private var _offerId:int;
        private var _SafeStr_4263:String;
        private var _SafeStr_7149:Boolean;
        private var _SafeStr_4262:int;
        private var _SafeStr_4260:int;
        private var _SafeStr_4261:int;
        private var _SafeStr_3827:int;
        private var _SafeStr_4716:Boolean;
        private var _SafeStr_4721:Boolean;
        private var _SafeStr_3814:Vector.<_SafeStr_1611>;

        public function _SafeStr_1563(_arg_1:IMessageDataWrapper)
        {
            var _local_2:int;
            super();
            _offerId = _arg_1.readInteger();
            _SafeStr_4263 = _arg_1.readString();
            _SafeStr_7149 = _arg_1.readBoolean();
            _SafeStr_4262 = _arg_1.readInteger();
            _SafeStr_4260 = _arg_1.readInteger();
            _SafeStr_4261 = _arg_1.readInteger();
            _SafeStr_4716 = _arg_1.readBoolean();
            var _local_3:int = _arg_1.readInteger();
            _SafeStr_3814 = new Vector.<_SafeStr_1611>(0);
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                _SafeStr_3814.push(new _SafeStr_1611(_arg_1));
                _local_2++;
            };
            _SafeStr_3827 = _arg_1.readInteger();
            _SafeStr_4721 = _arg_1.readBoolean();
        }

        public function get offerId():int
        {
            return (_offerId);
        }

        public function get localizationId():String
        {
            return (_SafeStr_4263);
        }

        public function get isRent():Boolean
        {
            return (_SafeStr_7149);
        }

        public function get priceInCredits():int
        {
            return (_SafeStr_4262);
        }

        public function get priceInActivityPoints():int
        {
            return (_SafeStr_4260);
        }

        public function get products():Vector.<_SafeStr_1611>
        {
            return (_SafeStr_3814);
        }

        public function get activityPointType():int
        {
            return (_SafeStr_4261);
        }

        public function get clubLevel():int
        {
            return (_SafeStr_3827);
        }

        public function get giftable():Boolean
        {
            return (_SafeStr_4716);
        }

        public function get bundlePurchaseAllowed():Boolean
        {
            return (_SafeStr_4721);
        }


    }
}//package _-AE

// _SafeStr_1563 = "_-T2" (String#8503, DoABC#3)
// _SafeStr_1611 = "_-m6" (String#9821, DoABC#3)
// _SafeStr_3814 = "_-H1d" (String#7672, DoABC#3)
// _SafeStr_3827 = "_-81k" (String#7107, DoABC#3)
// _SafeStr_4260 = "_-V1Z" (String#8622, DoABC#3)
// _SafeStr_4261 = "_-m1a" (String#9806, DoABC#3)
// _SafeStr_4262 = "_-qJ" (String#10076, DoABC#3)
// _SafeStr_4263 = "_-u1X" (String#10318, DoABC#3)
// _SafeStr_4716 = "_-i" (String#9513, DoABC#3)
// _SafeStr_4721 = "_-x1r" (String#10541, DoABC#3)
// _SafeStr_7149 = "_-v0" (String#10373, DoABC#3)


