// by nota

//_-V1k._SafeStr_1201

package _-V1k
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1201 implements IMessageParser 
    {

        private var _SafeStr_7593:int;


        public function get issueId():int
        {
            return (_SafeStr_7593);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7593 = parseInt(_arg_1.readString());
            return (true);
        }


    }
}//package _-V1k

// _SafeStr_1201 = "_-S1j" (String#8417, DoABC#3)
// _SafeStr_7593 = "_-fe" (String#9372, DoABC#3)


