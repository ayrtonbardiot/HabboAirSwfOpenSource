// by nota

//_-kx._SafeStr_1117

package _-kx
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1117 implements IMessageParser 
    {

        private var _SafeStr_4712:int;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4712 = _arg_1.readString();
            return (true);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function get balance():int
        {
            return (_SafeStr_4712);
        }


    }
}//package _-kx

// _SafeStr_1117 = "_-T1q" (String#8495, DoABC#3)
// _SafeStr_4712 = "_-O1J" (String#8138, DoABC#3)


