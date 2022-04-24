// by nota

//_-IV._SafeStr_1340

package _-IV
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1340 implements IMessageParser 
    {

        private var _SafeStr_5367:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5367 = _arg_1.readInteger();
            return (true);
        }

        public function get score():int
        {
            return (_SafeStr_5367);
        }


    }
}//package _-IV

// _SafeStr_1340 = "_-e1r" (String#9289, DoABC#3)
// _SafeStr_5367 = "_-z1J" (String#10657, DoABC#3)


