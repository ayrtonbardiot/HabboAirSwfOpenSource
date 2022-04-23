// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-kC._SafeStr_1353

package _-kC
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1353 implements IMessageParser 
    {

        private var _SafeStr_4513:Boolean;
        private var _commission:int;
        private var _SafeStr_4514:int;
        private var _SafeStr_4515:int;
        private var _offerMaxPrice:int;
        private var _offerMinPrice:int;
        private var _expirationHours:int;
        private var _SafeStr_4522:int;
        private var _SafeStr_4516:int;
        private var _SafeStr_4517:int;
        private var _SafeStr_4518:int;


        public function get isEnabled():Boolean
        {
            return (_SafeStr_4513);
        }

        public function get commission():int
        {
            return (_commission);
        }

        public function get tokenBatchPrice():int
        {
            return (_SafeStr_4514);
        }

        public function get tokenBatchSize():int
        {
            return (_SafeStr_4515);
        }

        public function get offerMinPrice():int
        {
            return (_offerMinPrice);
        }

        public function get offerMaxPrice():int
        {
            return (_offerMaxPrice);
        }

        public function get expirationHours():int
        {
            return (_expirationHours);
        }

        public function get averagePricePeriod():int
        {
            return (_SafeStr_4522);
        }

        public function get tokensBatchSize():int
        {
            return (_SafeStr_4515);
        }

        public function get sellingFeePercentage():int
        {
            return (_SafeStr_4516);
        }

        public function get revenueLimit():int
        {
            return (_SafeStr_4517);
        }

        public function get halfTaxLimit():int
        {
            return (_SafeStr_4518);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4513 = _arg_1.readBoolean();
            _commission = _arg_1.readInteger();
            _SafeStr_4514 = _arg_1.readInteger();
            _SafeStr_4515 = _arg_1.readInteger();
            _offerMinPrice = _arg_1.readInteger();
            _offerMaxPrice = _arg_1.readInteger();
            _expirationHours = _arg_1.readInteger();
            _SafeStr_4522 = _arg_1.readInteger();
            _SafeStr_4516 = _arg_1.readInteger();
            _SafeStr_4517 = _arg_1.readInteger();
            _SafeStr_4518 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-kC

// _SafeStr_1353 = "_-D1X" (String#7426, DoABC#3)
// _SafeStr_4513 = "_-fy" (String#9381, DoABC#3)
// _SafeStr_4514 = "_-x5" (String#10548, DoABC#3)
// _SafeStr_4515 = "_-ro" (String#10167, DoABC#3)
// _SafeStr_4516 = "_-E1v" (String#7484, DoABC#3)
// _SafeStr_4517 = "_-JI" (String#7797, DoABC#3)
// _SafeStr_4518 = "_-x3" (String#10546, DoABC#3)
// _SafeStr_4522 = "_-S12" (String#8393, DoABC#3)


