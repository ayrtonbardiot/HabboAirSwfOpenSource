// by nota

//_-kC._SafeStr_1051

package _-kC
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1051 implements IMessageParser 
    {

        private var _SafeStr_4865:int;
        private var _SafeStr_4866:int;
        private var _historyLength:int;
        private var _SafeStr_4867:Array;
        private var _SafeStr_4868:Array;
        private var _SafeStr_4869:Array;
        private var _SafeStr_4870:int;
        private var _SafeStr_4871:int;


        public function get averagePrice():int
        {
            return (_SafeStr_4865);
        }

        public function get offerCount():int
        {
            return (_SafeStr_4866);
        }

        public function get historyLength():int
        {
            return (_historyLength);
        }

        public function get dayOffsets():Array
        {
            return (_SafeStr_4867);
        }

        public function get averagePrices():Array
        {
            return (_SafeStr_4868);
        }

        public function get soldAmounts():Array
        {
            return (_SafeStr_4869);
        }

        public function get furniTypeId():int
        {
            return (_SafeStr_4870);
        }

        public function get furniCategoryId():int
        {
            return (_SafeStr_4871);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_4865 = _arg_1.readInteger();
            _SafeStr_4866 = _arg_1.readInteger();
            _historyLength = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _SafeStr_4867 = [];
            _SafeStr_4868 = [];
            _SafeStr_4869 = [];
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_4867.push(_arg_1.readInteger());
                _SafeStr_4868.push(_arg_1.readInteger());
                _SafeStr_4869.push(_arg_1.readInteger());
                _local_3++;
            };
            _SafeStr_4871 = _arg_1.readInteger();
            _SafeStr_4870 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-kC

// _SafeStr_1051 = "_-a1F" (String#8964, DoABC#3)
// _SafeStr_4865 = "_-O1l" (String#8159, DoABC#3)
// _SafeStr_4866 = "_-O17" (String#8132, DoABC#3)
// _SafeStr_4867 = "_-J1S" (String#7776, DoABC#3)
// _SafeStr_4868 = "_-uj" (String#10361, DoABC#3)
// _SafeStr_4869 = "_-Xa" (String#8810, DoABC#3)
// _SafeStr_4870 = "_-c2" (String#9131, DoABC#3)
// _SafeStr_4871 = "_-n6" (String#9893, DoABC#3)


