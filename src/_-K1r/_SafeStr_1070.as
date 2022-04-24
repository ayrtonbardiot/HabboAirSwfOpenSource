// by nota

//_-K1r._SafeStr_1070

package _-K1r
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1070 implements IMessageParser 
    {

        private var _SafeStr_7342:Boolean;


        public function flush():Boolean
        {
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            this._SafeStr_7342 = _arg_1.readBoolean();
            return (true);
        }

        public function get isFirstLoginOfDay():Boolean
        {
            return (_SafeStr_7342);
        }


    }
}//package _-K1r

// _SafeStr_1070 = "_-6z" (String#7006, DoABC#3)
// _SafeStr_7342 = "_-8X" (String#7132, DoABC#3)


