// by nota

//_-lk._SafeStr_1450

package _-lk
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1450 implements IMessageParser 
    {

        private var _SafeStr_4028:int;


        public function flush():Boolean
        {
            _SafeStr_4028 = 0;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4028 = _arg_1.readInteger();
            return (true);
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }


    }
}//package _-lk

// _SafeStr_1450 = "_-Ju" (String#7857, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)


