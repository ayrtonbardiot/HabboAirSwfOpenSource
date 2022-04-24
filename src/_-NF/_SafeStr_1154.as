// by nota

//_-NF._SafeStr_1154

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-W1K._SafeStr_1637;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1154 implements IMessageParser 
    {

        private var _SafeStr_7437:Array = [];


        public function flush():Boolean
        {
            _SafeStr_7437 = [];
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7437.push(new _SafeStr_1637(_arg_1));
                _local_3++;
            };
            return (true);
        }

        public function get guilds():Array
        {
            return (_SafeStr_7437);
        }


    }
}//package _-NF

// _SafeStr_1154 = "_-A1t" (String#7234, DoABC#3)
// _SafeStr_1637 = "_-M5" (String#8021, DoABC#3)
// _SafeStr_7437 = "_-X1" (String#8762, DoABC#3)


