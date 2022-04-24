// by nota

//_-71X._SafeStr_1410

package _-71X
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import _-p1o._SafeStr_1617;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1410 implements IMessageParser 
    {

        private var _stuffId:int;
        private var _SafeStr_4403:Vector.<_SafeStr_1617>;
        private var _endTime:int;


        public function flush():Boolean
        {
            _stuffId = -1;
            for each (var _local_1:_SafeStr_1617 in _SafeStr_4403)
            {
                _local_1.dispose();
            };
            _SafeStr_4403 = new Vector.<_SafeStr_1617>(0);
            _endTime = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            _stuffId = _arg_1.readInteger();
            var _local_3:int = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                _SafeStr_4403.push(new _SafeStr_1617(_arg_1));
                _local_2++;
            };
            _endTime = _arg_1.readInteger();
            return (true);
        }

        public function get stuffId():int
        {
            return (_stuffId);
        }

        public function get achievements():Vector.<_SafeStr_1617>
        {
            return (_SafeStr_4403);
        }

        public function get endTime():int
        {
            return (_endTime);
        }


    }
}//package _-71X

// _SafeStr_1410 = "_-4i" (String#6861, DoABC#3)
// _SafeStr_1617 = "_-Gi" (String#7640, DoABC#3)
// _SafeStr_4403 = "_-RC" (String#8367, DoABC#3)


