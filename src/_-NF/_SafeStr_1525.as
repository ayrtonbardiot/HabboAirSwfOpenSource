// by nota

//_-NF._SafeStr_1525

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-W1K._SafeStr_1171;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1525 implements IMessageParser 
    {

        private var _groupId:int;
        private var _SafeStr_7454:_SafeStr_1171;


        public function flush():Boolean
        {
            _SafeStr_7454 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _groupId = _arg_1.readInteger();
            _SafeStr_7454 = new _SafeStr_1171(_arg_1);
            return (true);
        }

        public function get groupId():int
        {
            return (_groupId);
        }

        public function get requester():_SafeStr_1171
        {
            return (_SafeStr_7454);
        }


    }
}//package _-NF

// _SafeStr_1171 = "_-rf" (String#10164, DoABC#3)
// _SafeStr_1525 = "_-J1s" (String#7785, DoABC#3)
// _SafeStr_7454 = "_-Bh" (String#7343, DoABC#3)


