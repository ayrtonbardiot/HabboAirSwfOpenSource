// by nota

//_-NF._SafeStr_1186

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1186 implements IMessageParser 
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

// _SafeStr_1186 = "_-xz" (String#10576, DoABC#3)


