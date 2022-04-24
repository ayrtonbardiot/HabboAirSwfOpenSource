// by nota

//_-Tr._SafeStr_1252

package _-Tr
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-21f._SafeStr_1547;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1252 implements IMessageParser 
    {

        private var _SafeStr_7566:_SafeStr_1547;


        public function flush():Boolean
        {
            _SafeStr_7566 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7566 = new _SafeStr_1547(_arg_1);
            return (true);
        }

        public function get searchResult():_SafeStr_1547
        {
            return (_SafeStr_7566);
        }


    }
}//package _-Tr

// _SafeStr_1252 = "_-t3" (String#10271, DoABC#3)
// _SafeStr_1547 = "_-E1O" (String#7472, DoABC#3)
// _SafeStr_7566 = "_-51l" (String#6895, DoABC#3)


