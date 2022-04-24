// by nota

//_-NF._SafeStr_1111

package _-NF
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1111 implements IMessageParser 
    {

        private var _SafeStr_4332:int;
        private var _SafeStr_7022:int;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_4332 = _arg_1.readInteger();
            _SafeStr_7022 = _arg_1.readInteger();
            return (true);
        }

        public function get guildId():int
        {
            return (_SafeStr_4332);
        }

        public function get reason():int
        {
            return (_SafeStr_7022);
        }


    }
}//package _-NF

// _SafeStr_1111 = "_-9T" (String#7193, DoABC#3)
// _SafeStr_4332 = "_-lq" (String#9784, DoABC#3)
// _SafeStr_7022 = "_-p1R" (String#9987, DoABC#3)


