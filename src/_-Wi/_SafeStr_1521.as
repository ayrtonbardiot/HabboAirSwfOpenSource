// by nota

//_-Wi._SafeStr_1521

package _-Wi
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1521 implements IMessageParser 
    {

        private var _groupId:int;
        private var _SafeStr_5640:int;
        private var _SafeStr_4132:_SafeStr_1560;


        public function get groupId():int
        {
            return (_groupId);
        }

        public function get threadId():int
        {
            return (_SafeStr_5640);
        }

        public function get message():_SafeStr_1560
        {
            return (_SafeStr_4132);
        }

        public function flush():Boolean
        {
            _groupId = -1;
            _SafeStr_5640 = -1;
            _SafeStr_4132 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _groupId = _arg_1.readInteger();
            _SafeStr_5640 = _arg_1.readInteger();
            _SafeStr_4132 = _SafeStr_1560.readFromMessage(_arg_1);
            return (true);
        }


    }
}//package _-Wi

// _SafeStr_1521 = "_-Y" (String#8823, DoABC#3)
// _SafeStr_1560 = "_-x4" (String#10547, DoABC#3)
// _SafeStr_4132 = "_-s1S" (String#10186, DoABC#3)
// _SafeStr_5640 = "_-lE" (String#9769, DoABC#3)


