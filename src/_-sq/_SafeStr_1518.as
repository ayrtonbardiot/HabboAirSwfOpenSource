// by nota

//_-sq._SafeStr_1518

package _-sq
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1518 implements IMessageParser 
    {

        private var _SafeStr_4128:int;


        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4128 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-sq

// _SafeStr_1518 = "_-Js" (String#7856, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)


