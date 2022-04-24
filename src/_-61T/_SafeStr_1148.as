// by nota

//_-61T._SafeStr_1148

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1148 implements IMessageParser 
    {

        private var _SafeStr_3820:int = 0;


        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function flush():Boolean
        {
            _SafeStr_3820 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_3820 = _arg_1.readString();
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1148 = "_-w1L" (String#10448, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)


