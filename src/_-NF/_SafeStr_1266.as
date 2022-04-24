// by nota

//_-NF._SafeStr_1266

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1266 implements IMessageParser 
    {

        public static const _SafeStr_7440:int = 0;

        private var _SafeStr_4258:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4258 = _arg_1.readInteger();
            return (true);
        }

        public function get result():int
        {
            return (_SafeStr_4258);
        }


    }
}//package _-NF

// _SafeStr_1266 = "_-q8" (String#10072, DoABC#3)
// _SafeStr_4258 = "_-fc" (String#9371, DoABC#3)
// _SafeStr_7440 = "_-51R" (String#6883, DoABC#3)


