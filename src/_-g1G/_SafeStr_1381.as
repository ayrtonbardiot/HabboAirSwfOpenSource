// by nota

//_-g1G._SafeStr_1381

package _-g1G
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-AE._SafeStr_1540;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1381 implements IMessageParser 
    {

        private var _offers:Array;
        private var _SafeStr_7243:int;


        public function flush():Boolean
        {
            _offers = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _offers = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _offers.push(new _SafeStr_1540(_arg_1));
                _local_3++;
            };
            _SafeStr_7243 = _arg_1.readInteger();
            return (true);
        }

        public function get offers():Array
        {
            return (_offers);
        }

        public function get source():int
        {
            return (_SafeStr_7243);
        }


    }
}//package _-g1G

// _SafeStr_1381 = "_-86" (String#7113, DoABC#3)
// _SafeStr_1540 = "_-E1Y" (String#7475, DoABC#3)
// _SafeStr_7243 = "_-JV" (String#7820, DoABC#3)


