// by nota

//_-z1k._SafeStr_1357

package _-z1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1357 implements IMessageParser 
    {

        private var _SafeStr_7022:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7022 = _arg_1.readInteger();
            return (true);
        }

        public function get reason():int
        {
            return (_SafeStr_7022);
        }


    }
}//package _-z1k

// _SafeStr_1357 = "_-17" (String#6592, DoABC#3)
// _SafeStr_7022 = "_-p1R" (String#9987, DoABC#3)


