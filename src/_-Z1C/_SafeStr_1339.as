// by nota

//_-Z1C._SafeStr_1339

package _-Z1C
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-n1H._SafeStr_1639;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1339 implements IMessageParser 
    {

        private var _SafeStr_3693:int;
        private var _SafeStr_7867:Array;


        public function flush():Boolean
        {
            _SafeStr_7867 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_3693 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7867.push(new _SafeStr_1639(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function get bannedUsers():Array
        {
            return (_SafeStr_7867);
        }


    }
}//package _-Z1C

// _SafeStr_1339 = "_-ey" (String#9319, DoABC#3)
// _SafeStr_1639 = "_-O1B" (String#8133, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)
// _SafeStr_7867 = "_-B1N" (String#7307, DoABC#3)


