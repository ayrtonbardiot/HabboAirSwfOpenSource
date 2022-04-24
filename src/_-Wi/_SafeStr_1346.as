// by nota

//_-Wi._SafeStr_1346

package _-Wi
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1346 implements IMessageParser 
    {

        private var _groupId:int;
        private var _SafeStr_5170:int;
        private var _amount:int;
        private var _SafeStr_6276:Array;


        public function get groupId():int
        {
            return (_groupId);
        }

        public function get startIndex():int
        {
            return (_SafeStr_5170);
        }

        public function get amount():int
        {
            return (_amount);
        }

        public function get threads():Array
        {
            return (_SafeStr_6276);
        }

        public function flush():Boolean
        {
            _groupId = -1;
            _SafeStr_5170 = -1;
            _amount = -1;
            _SafeStr_6276 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            _groupId = _arg_1.readInteger();
            _SafeStr_5170 = _arg_1.readInteger();
            _amount = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < amount)
            {
                _SafeStr_6276.push(_SafeStr_1633.readFromMessage(_arg_1));
                _local_2++;
            };
            return (true);
        }


    }
}//package _-Wi

// _SafeStr_1346 = "_-P5" (String#8253, DoABC#3)
// _SafeStr_1633 = "_-XN" (String#8805, DoABC#3)
// _SafeStr_5170 = "_-x1C" (String#10506, DoABC#3)
// _SafeStr_6276 = "_-Ba" (String#7338, DoABC#3)


