// by nota

//_-NF._SafeStr_1162

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1162 implements IMessageParser 
    {

        private var _SafeStr_4128:int;
        private var _SafeStr_7238:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_7238 = _arg_1.readInteger();
            return (true);
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get furniCount():int
        {
            return (_SafeStr_7238);
        }


    }
}//package _-NF

// _SafeStr_1162 = "_-f1i" (String#9343, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_7238 = "_-U9" (String#8569, DoABC#3)


