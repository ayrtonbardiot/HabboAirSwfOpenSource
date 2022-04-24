// by nota

//_-g1G._SafeStr_1286

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-W1K._SafeStr_1571;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1286 implements IMessageParser 
    {

        private var _SafeStr_6855:Boolean;
        private var _rooms:Array;


        public function flush():Boolean
        {
            return (false);
        }

        public function get rooms():Array
        {
            return (_rooms);
        }

        public function get isVip():Boolean
        {
            return (_SafeStr_6855);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_5:int;
            var _local_6:* = null;
            var _local_4:Boolean;
            var _local_7:* = null;
            _rooms = [];
            _SafeStr_6855 = _arg_1.readBoolean();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _local_5 = _arg_1.readInteger();
                _local_6 = _arg_1.readString();
                _local_4 = _arg_1.readBoolean();
                _local_7 = new _SafeStr_1571(_local_5, _local_6, _local_4);
                _rooms.push(_local_7);
                _local_3++;
            };
            return (true);
        }


    }
}//package _-g1G

// _SafeStr_1286 = "_-y1D" (String#10582, DoABC#3)
// _SafeStr_1571 = "_-r1" (String#10109, DoABC#3)
// _SafeStr_6855 = "_-n1B" (String#9856, DoABC#3)


