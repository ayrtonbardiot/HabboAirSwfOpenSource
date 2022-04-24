// by nota

//_-Lc._SafeStr_1498

package _-Lc
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1498 implements IMessageParser 
    {

        private var _SafeStr_7389:Boolean;
        private var _SafeStr_4519:_SafeStr_1620;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_7389 = _arg_1.readBoolean();
            _SafeStr_4519 = new _SafeStr_1620(_arg_1);
            return (true);
        }

        public function get boughtAsGift():Boolean
        {
            return (_SafeStr_7389);
        }

        public function get item():_SafeStr_1620
        {
            return (_SafeStr_4519);
        }


    }
}//package _-Lc

// _SafeStr_1498 = "_-T1u" (String#8498, DoABC#3)
// _SafeStr_1620 = "_-V1f" (String#8625, DoABC#3)
// _SafeStr_4519 = "_-yg" (String#10644, DoABC#3)
// _SafeStr_7389 = "_-22n" (String#6676, DoABC#3)


