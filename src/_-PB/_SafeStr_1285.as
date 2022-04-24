// by nota

//_-PB._SafeStr_1285

package _-PB
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1285 implements IMessageParser 
    {

        private var _SafeStr_5431:int = -1;
        private var _SafeStr_7495:int = -1;
        private var _SafeStr_4649:int = 0;


        public function get petId():int
        {
            return (_SafeStr_5431);
        }

        public function get petRoomIndex():int
        {
            return (_SafeStr_7495);
        }

        public function get gainedExperience():int
        {
            return (_SafeStr_4649);
        }

        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            _SafeStr_5431 = _arg_1.readInteger();
            _SafeStr_7495 = _arg_1.readInteger();
            _SafeStr_4649 = _arg_1.readInteger();
            return (true);
        }


    }
}//package _-PB

// _SafeStr_1285 = "_-q5" (String#10071, DoABC#3)
// _SafeStr_4649 = "_-k0" (String#9657, DoABC#3)
// _SafeStr_5431 = "_-GK" (String#7627, DoABC#3)
// _SafeStr_7495 = "_-K2" (String#7902, DoABC#3)


