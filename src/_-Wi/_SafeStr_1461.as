// by nota

//_-Wi._SafeStr_1461

package _-Wi
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1461 implements IMessageParser 
    {

        private var _SafeStr_6468:int;
        private var _totalAmount:int;
        private var _SafeStr_5170:int;
        private var _amount:int;
        private var _forums:Array;


        public function get listCode():int
        {
            return (_SafeStr_6468);
        }

        public function get totalAmount():int
        {
            return (_totalAmount);
        }

        public function get startIndex():int
        {
            return (_SafeStr_5170);
        }

        public function get amount():int
        {
            return (_amount);
        }

        public function get forums():Array
        {
            return (_forums);
        }

        public function flush():Boolean
        {
            _forums = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            _SafeStr_6468 = _arg_1.readInteger();
            _totalAmount = _arg_1.readInteger();
            _SafeStr_5170 = _arg_1.readInteger();
            _amount = _arg_1.readInteger();
            _forums = [];
            _local_2 = 0;
            while (_local_2 < amount)
            {
                _forums.push(_SafeStr_1644.readFromMessage(_arg_1));
                _local_2++;
            };
            return (true);
        }


    }
}//package _-Wi

// _SafeStr_1461 = "_-I1M" (String#7722, DoABC#3)
// _SafeStr_1644 = "_-mW" (String#9832, DoABC#3)
// _SafeStr_5170 = "_-x1C" (String#10506, DoABC#3)
// _SafeStr_6468 = "_-XH" (String#8801, DoABC#3)


