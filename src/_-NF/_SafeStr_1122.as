// by nota

//_-NF._SafeStr_1122

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-W1K._SafeStr_1171;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1122 implements IMessageParser 
    {

        private var _SafeStr_4332:int;
        private var _SafeStr_3740:_SafeStr_1171;


        public function flush():Boolean
        {
            _SafeStr_3740 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4332 = _arg_1.readInteger();
            _SafeStr_3740 = new _SafeStr_1171(_arg_1);
            return (true);
        }

        public function get guildId():int
        {
            return (_SafeStr_4332);
        }

        public function get data():_SafeStr_1171
        {
            return (_SafeStr_3740);
        }


    }
}//package _-NF

// _SafeStr_1122 = "_-NC" (String#8090, DoABC#3)
// _SafeStr_1171 = "_-rf" (String#10164, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_4332 = "_-lq" (String#9784, DoABC#3)


