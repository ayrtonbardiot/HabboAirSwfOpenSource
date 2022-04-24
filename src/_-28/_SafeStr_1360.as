// by nota

//_-28._SafeStr_1360

package _-28
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1360 implements IMessageParser 
    {

        private var _SafeStr_7037:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7037 = _arg_1.readInteger();
            return (true);
        }

        public function get numGifts():int
        {
            return (_SafeStr_7037);
        }


    }
}//package _-28

// _SafeStr_1360 = "_-H1A" (String#7661, DoABC#3)
// _SafeStr_7037 = "_-c1q" (String#9125, DoABC#3)


