// by nota

//_-z1k._SafeStr_1287

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1287 implements IMessageParser 
    {

        private var _SafeStr_4404:int = 0;


        public function get code():int
        {
            return (_SafeStr_4404);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_4404 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-z1k

// _SafeStr_1287 = "_-BE" (String#7328, DoABC#3)
// _SafeStr_4404 = "_-S1r" (String#8423, DoABC#3)


