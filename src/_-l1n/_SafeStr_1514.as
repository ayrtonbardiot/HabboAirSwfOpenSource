// by nota

//_-l1n._SafeStr_1514

package _-l1n
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1514 implements IMessageParser 
    {

        private var _flatId:int = 0;
        private var _SafeStr_7383:_SafeStr_24 = new _SafeStr_24();
        private var _SafeStr_4056:int = 0;


        public function get flatId():int
        {
            return (_flatId);
        }

        public function get activeTarget():int
        {
            return (_SafeStr_4056);
        }

        public function flush():Boolean
        {
            _SafeStr_7383.reset();
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_6:* = null;
            var _local_7:int;
            var _local_2:* = null;
            var _local_5:int;
            var _local_8:int;
            _SafeStr_7383.reset();
            _flatId = _arg_1.readInteger();
            var _local_4:int = _arg_1.readInteger();
            _local_7 = 0;
            while (_local_7 < _local_4)
            {
                _local_2 = _arg_1.readString();
                _local_5 = _arg_1.readInteger();
                if (_local_7 == 0)
                {
                    _SafeStr_4056 = _local_5;
                };
                _local_6 = new _SafeStr_1528(_local_2, _local_5);
                _local_3 = _arg_1.readInteger();
                _local_8 = 0;
                while (_local_8 < _local_3)
                {
                    _local_6.addQueue(_arg_1.readString(), _arg_1.readInteger());
                    _local_8++;
                };
                _SafeStr_7383.add(_local_6.target, _local_6);
                _local_7++;
            };
            return (true);
        }

        public function getQueueSetTargets():Array
        {
            return (_SafeStr_7383.getKeys());
        }

        public function getQueueSet(_arg_1:int):_SafeStr_1528
        {
            return (_SafeStr_7383.getValue(_arg_1) as _SafeStr_1528);
        }


    }
}//package _-l1n

// _SafeStr_1514 = "_-p1K" (String#9980, DoABC#3)
// _SafeStr_1528 = "_-220" (String#6656, DoABC#3)
// _SafeStr_24 = "_-W1s" (String#8725, DoABC#3)
// _SafeStr_4056 = "_-W5" (String#8728, DoABC#3)
// _SafeStr_7383 = "_-wf" (String#10490, DoABC#3)


