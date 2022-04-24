// by nota

//_-u1V._SafeStr_1078

package _-u1V
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1078 implements IMessageParser 
    {

        private var _stuffId:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _stuffId = _arg_1.readInteger();
            return (true);
        }

        public function get stuffId():int
        {
            return (_stuffId);
        }


    }
}//package _-u1V

// _SafeStr_1078 = "_-Jo" (String#7853, DoABC#3)


