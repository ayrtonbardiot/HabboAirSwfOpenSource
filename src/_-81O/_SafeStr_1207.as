// by nota

//_-81O._SafeStr_1207

package _-81O
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1207 implements IMessageParser 
    {

        private var _SafeStr_4128:int = 0;
        private var _SafeStr_4110:int;


        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get itemType():int
        {
            return (_SafeStr_4110);
        }

        public function flush():Boolean
        {
            _SafeStr_4128 = 0;
            _SafeStr_4110 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_4110 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-81O

// _SafeStr_1207 = "_-kb" (String#9708, DoABC#3)
// _SafeStr_4110 = "_-BF" (String#7329, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)


