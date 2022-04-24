// by nota

//_-PB._SafeStr_1364

package _-PB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1364 implements IMessageParser 
    {

        private var _SafeStr_5536:int;
        private var _SafeStr_5431:int;
        private var _SafeStr_3623:int;


        public function get roomIndex():int
        {
            return (_SafeStr_5536);
        }

        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get level():int
        {
            return (_SafeStr_3623);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_5536 = _arg_1.readInteger();
            _SafeStr_5431 = _arg_1.readInteger();
            _SafeStr_3623 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-PB

// _SafeStr_1364 = "_-6d" (String#6996, DoABC#3)
// _SafeStr_3623 = "_-OF" (String#8175, DoABC#3)
// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)
// _SafeStr_5536 = "_-517" (String#6874, DoABC#3)


