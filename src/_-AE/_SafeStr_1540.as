// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_1540

package _-AE
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1540 
    {

        private var _offerId:int;
        private var _SafeStr_4838:String;
        private var _SafeStr_5094:int;
        private var _SafeStr_5100:int;
        private var _SafeStr_5101:int;
        private var _SafeStr_5095:Boolean;
        private var _SafeStr_5096:int;
        private var _SafeStr_5103:int;
        private var _SafeStr_5097:int;
        private var _SafeStr_5098:int;
        private var _month:int;
        private var _SafeStr_5099:int;
        private var _SafeStr_4716:Boolean;

        public function _SafeStr_1540(_arg_1:IMessageDataWrapper)
        {
            _offerId = _arg_1.readInteger();
            _SafeStr_4838 = _arg_1.readString();
            _arg_1.readBoolean();
            _SafeStr_5094 = _arg_1.readInteger();
            _SafeStr_5100 = _arg_1.readInteger();
            _SafeStr_5101 = _arg_1.readInteger();
            _SafeStr_5095 = _arg_1.readBoolean();
            _SafeStr_5096 = _arg_1.readInteger();
            _SafeStr_5103 = _arg_1.readInteger();
            _SafeStr_4716 = _arg_1.readBoolean();
            _SafeStr_5097 = _arg_1.readInteger();
            _SafeStr_5098 = _arg_1.readInteger();
            _month = _arg_1.readInteger();
            _SafeStr_5099 = _arg_1.readInteger();
        }

        public function get offerId():int
        {
            return (_offerId);
        }

        public function get productCode():String
        {
            return (_SafeStr_4838);
        }

        public function get priceCredits():int
        {
            return (_SafeStr_5094);
        }

        public function get vip():Boolean
        {
            return (_SafeStr_5095);
        }

        public function get months():int
        {
            return (_SafeStr_5096);
        }

        public function get extraDays():int
        {
            return (_SafeStr_5103);
        }

        public function get daysLeftAfterPurchase():int
        {
            return (_SafeStr_5097);
        }

        public function get year():int
        {
            return (_SafeStr_5098);
        }

        public function get month():int
        {
            return (_month);
        }

        public function get day():int
        {
            return (_SafeStr_5099);
        }

        public function get priceActivityPoints():int
        {
            return (_SafeStr_5100);
        }

        public function get priceActivityPointType():int
        {
            return (_SafeStr_5101);
        }

        public function get isGiftable():Boolean
        {
            return (_SafeStr_4716);
        }


    }
}//package _-AE

// _SafeStr_1540 = "_-E1Y" (String#7475, DoABC#3)
// _SafeStr_4716 = "_-i" (String#9513, DoABC#3)
// _SafeStr_4838 = "_-T1g" (String#8487, DoABC#3)
// _SafeStr_5094 = "_-p2" (String#10002, DoABC#3)
// _SafeStr_5095 = "_-u1x" (String#10329, DoABC#3)
// _SafeStr_5096 = "_-z1w" (String#10676, DoABC#3)
// _SafeStr_5097 = "_-w15" (String#10438, DoABC#3)
// _SafeStr_5098 = "_-vC" (String#10411, DoABC#3)
// _SafeStr_5099 = "_-se" (String#10229, DoABC#3)
// _SafeStr_5100 = "_-Zt" (String#8950, DoABC#3)
// _SafeStr_5101 = "_-610" (String#6936, DoABC#3)
// _SafeStr_5103 = "_-N1c" (String#8072, DoABC#3)


