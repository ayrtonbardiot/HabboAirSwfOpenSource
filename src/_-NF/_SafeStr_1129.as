// by nota

//_-NF._SafeStr_1129

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1129 implements IMessageParser 
    {

        private var _groupId:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _groupId = _arg_1.readInteger();
            return (true);
        }

        public function get groupId():int
        {
            return (_groupId);
        }


    }
}//package _-NF

// _SafeStr_1129 = "_-M13" (String#7992, DoABC#3)


