// by nota

//_-l1n._SafeStr_1132

package _-l1n
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1132 implements IMessageParser 
    {

        private var _SafeStr_3693:int;


        public function get roomId():int
        {
            return (_SafeStr_3693);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3693 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-l1n

// _SafeStr_1132 = "_-57" (String#6904, DoABC#3)
// _SafeStr_3693 = "_-KI" (String#7909, DoABC#3)


