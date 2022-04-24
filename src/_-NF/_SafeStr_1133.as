// by nota

//_-NF._SafeStr_1133

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1133 implements IMessageParser 
    {

        public static const _SafeStr_7436:int = 4;

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
}//package _-NF

// _SafeStr_1133 = "_-91l" (String#7171, DoABC#3)
// _SafeStr_7022 = "_-p1R" (String#9987, DoABC#3)
// _SafeStr_7436 = "_-w1v" (String#10469, DoABC#3)


