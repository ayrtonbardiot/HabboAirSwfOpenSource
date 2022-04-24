// by nota

//_-NF._SafeStr_1502

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1502 implements IMessageParser 
    {

        private var _SafeStr_7453:int;
        private var _groupId:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7453 = _arg_1.readInteger();
            _groupId = _arg_1.readInteger();
            return (true);
        }

        public function get baseRoomId():int
        {
            return (_SafeStr_7453);
        }

        public function get groupId():int
        {
            return (_groupId);
        }


    }
}//package _-NF

// _SafeStr_1502 = "_-U14" (String#8541, DoABC#3)
// _SafeStr_7453 = "_-l1S" (String#9747, DoABC#3)


