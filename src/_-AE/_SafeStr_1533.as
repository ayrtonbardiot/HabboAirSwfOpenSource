// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-AE._SafeStr_1533

package _-AE
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1533 
    {

        private var _SafeStr_7152:int;
        private var _SafeStr_7153:int;
        private var _SafeStr_7154:int;
        private var _SafeStr_7155:int;
        private var _SafeStr_7151:Array;

        public function _SafeStr_1533(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super();
            _SafeStr_7152 = _arg_1.readInteger();
            _SafeStr_7153 = _arg_1.readInteger();
            _SafeStr_7154 = _arg_1.readInteger();
            _SafeStr_7155 = _arg_1.readInteger();
            _SafeStr_7151 = [];
            var _local_2:int = _arg_1.readInteger();
            while (_local_3 < _local_2)
            {
                _SafeStr_7151.push(_arg_1.readInteger());
                _local_3++;
            };
        }

        public function get maxPurchaseSize():int
        {
            return (_SafeStr_7152);
        }

        public function get bundleSize():int
        {
            return (_SafeStr_7153);
        }

        public function get bundleDiscountSize():int
        {
            return (_SafeStr_7154);
        }

        public function get bonusThreshold():int
        {
            return (_SafeStr_7155);
        }

        public function get additionalBonusDiscountThresholdQuantities():Array
        {
            return (_SafeStr_7151);
        }


    }
}//package _-AE

// _SafeStr_1533 = "_-Z14" (String#8886, DoABC#3)
// _SafeStr_7151 = "_-SU" (String#8447, DoABC#3)
// _SafeStr_7152 = "_-ju" (String#9653, DoABC#3)
// _SafeStr_7153 = "_-4P" (String#6851, DoABC#3)
// _SafeStr_7154 = "_-Wv" (String#8759, DoABC#3)
// _SafeStr_7155 = "_-91A" (String#7156, DoABC#3)


