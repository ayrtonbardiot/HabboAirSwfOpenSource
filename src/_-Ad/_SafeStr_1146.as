// by nota

//_-Ad._SafeStr_1146

package _-Ad
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1146 implements IMessageParser 
    {

        private var _SafeStr_3740:Array;


        public function flush():Boolean
        {
            _SafeStr_3740 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_5:int;
            var _local_6:* = null;
            var _local_2:int;
            var _local_3:int;
            var _local_4:int = _arg_1.readInteger();
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_6 = _arg_1.readString();
                _local_2 = _arg_1.readInteger();
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    _SafeStr_3740.push(new _SafeStr_1542(_local_6, _arg_1));
                    _local_3++;
                };
                _local_5++;
            };
            return (true);
        }

        public function get data():Array
        {
            return (_SafeStr_3740);
        }


    }
}//package _-Ad

// _SafeStr_1146 = "_-Hg" (String#7705, DoABC#3)
// _SafeStr_1542 = "_-k1d" (String#9680, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)


