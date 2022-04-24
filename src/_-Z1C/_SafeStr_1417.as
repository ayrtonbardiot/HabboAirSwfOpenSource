// by nota

//_-Z1C._SafeStr_1417

package _-Z1C
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1417 implements IMessageParser 
    {

        private var _SafeStr_3693:int;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3693 = _arg_1.readInteger();
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_3693 = 0;
            return (true);
        }

        public function get roomId():int
        {
            return (_SafeStr_3693);
        }


    }
}//package _-Z1C

// _SafeStr_1417 = "_-D1n" (String#7434, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)


