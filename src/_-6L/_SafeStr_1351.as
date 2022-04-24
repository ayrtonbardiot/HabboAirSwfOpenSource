// by nota

//_-6L._SafeStr_1351

package _-6L
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1351 implements IMessageParser 
    {

        private var _SafeStr_5666:int;
        private var _SafeStr_7121:Array;


        public function get skillList():Array
        {
            return (_SafeStr_7121);
        }

        public function get botId():int
        {
            return (_SafeStr_5666);
        }

        public function flush():Boolean
        {
            _SafeStr_5666 = -1;
            _SafeStr_7121 = new Array(0);
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_5666 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7121.push(new _SafeStr_1630(_arg_1));
                _local_3++;
            };
            return (true);
        }


    }
}//package _-6L

// _SafeStr_1351 = "_-wt" (String#10499, DoABC#3)
// _SafeStr_1630 = "_-N1E" (String#8056, DoABC#3)
// _SafeStr_5666 = "_-32J" (String#6745, DoABC#3)
// _SafeStr_7121 = "_-H1r" (String#7682, DoABC#3)


