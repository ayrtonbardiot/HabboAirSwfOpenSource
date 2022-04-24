// by nota

//_-AE._SafeStr_1546

package _-AE
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1546 
    {

        private var _SafeStr_5380:Array;
        private var _SafeStr_5381:Array;

        public function _SafeStr_1546(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            var _local_5:int;
            super();
            _SafeStr_5380 = [];
            _SafeStr_5381 = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_5380.push(_arg_1.readString());
                _local_3++;
            };
            var _local_4:int = _arg_1.readInteger();
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _SafeStr_5381.push(_arg_1.readString());
                _local_5++;
            };
        }

        public function get images():Array
        {
            return (_SafeStr_5380);
        }

        public function get texts():Array
        {
            return (_SafeStr_5381);
        }


    }
}//package _-AE

// _SafeStr_1546 = "_-9U" (String#7194, DoABC#3)
// _SafeStr_5380 = "_-2r" (String#6705, DoABC#3)
// _SafeStr_5381 = "_-ks" (String#9717, DoABC#3)


