// by nota

//_-Wi._SafeStr_1414

package _-Wi
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1414 implements IMessageParser 
    {

        private var _groupId:int;
        private var _SafeStr_5640:int;
        private var _SafeStr_5170:int;
        private var _amount:int;
        private var _SafeStr_5642:Array;


        public function get groupId():int
        {
            return (_groupId);
        }

        public function get threadId():int
        {
            return (_SafeStr_5640);
        }

        public function get startIndex():int
        {
            return (_SafeStr_5170);
        }

        public function get amount():int
        {
            return (_amount);
        }

        public function get messages():Array
        {
            return (_SafeStr_5642);
        }

        public function flush():Boolean
        {
            _groupId = -1;
            _SafeStr_5640 = -1;
            _SafeStr_5170 = -1;
            _amount = -1;
            _SafeStr_5642 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            var _local_3:* = null;
            _groupId = _arg_1.readInteger();
            _SafeStr_5640 = _arg_1.readInteger();
            _SafeStr_5170 = _arg_1.readInteger();
            _amount = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < _amount)
            {
                _local_3 = _SafeStr_1560.readFromMessage(_arg_1);
                _local_3.groupID = _groupId;
                _local_3.threadId = _SafeStr_5640;
                _SafeStr_5642.push(_local_3);
                _local_2++;
            };
            return (true);
        }


    }
}//package _-Wi

// _SafeStr_1414 = "_-c1g" (String#9121, DoABC#3)
// _SafeStr_1560 = "_-x4" (String#10547, DoABC#3)
// _SafeStr_5170 = "_-x1C" (String#10506, DoABC#3)
// _SafeStr_5640 = "_-lE" (String#9769, DoABC#3)
// _SafeStr_5642 = "_-oE" (String#9948, DoABC#3)


