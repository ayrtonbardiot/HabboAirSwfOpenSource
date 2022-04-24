// by nota

//_-sq._SafeStr_1402

package _-sq
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1402 implements IMessageParser 
    {

        private var _SafeStr_7522:int;


        public function flush():Boolean
        {
            _SafeStr_7522 = -1;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7522 = _arg_1.readInteger();
            return (true);
        }

        public function get timeToNextState():int
        {
            return (_SafeStr_7522);
        }


    }
}//package _-sq

// _SafeStr_1402 = "_-L1w" (String#7957, DoABC#3)
// _SafeStr_7522 = "_-7w" (String#7064, DoABC#3)


