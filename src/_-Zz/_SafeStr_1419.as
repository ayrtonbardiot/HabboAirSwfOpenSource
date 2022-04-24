// by nota

//_-Zz._SafeStr_1419

package _-Zz
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1419 implements IMessageParser 
    {

        private var _SafeStr_5431:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5431 = _arg_1.readInteger();
            return (true);
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }


    }
}//package _-Zz

// _SafeStr_1419 = "_-f1j" (String#9344, DoABC#3)
// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)


