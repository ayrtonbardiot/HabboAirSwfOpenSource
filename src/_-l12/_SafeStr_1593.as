// by nota

//_-l12._SafeStr_1593

package _-l12
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1593 extends _SafeStr_1554 
    {

        private var _SafeStr_4028:int;
        private var _SafeStr_7376:int;
        private var _SafeStr_7375:Array = [];

        public function _SafeStr_1593(_arg_1:IMessageDataWrapper)
        {
            var _local_3:int;
            super(_arg_1);
            _SafeStr_4028 = _arg_1.readInteger();
            _SafeStr_7376 = _arg_1.readInteger();
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7375.push(_arg_1.readInteger());
                _local_3++;
            };
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        override public function get code():int
        {
            return (_SafeStr_4028);
        }

        public function get delayInPulses():int
        {
            return (_SafeStr_7376);
        }

        public function get conflictingTriggers():Array
        {
            return (_SafeStr_7375);
        }


    }
}//package _-l12

// _SafeStr_1554 = "_-W1B" (String#8667, DoABC#3)
// _SafeStr_1593 = "_-S8" (String#8433, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)
// _SafeStr_7375 = "_-91C" (String#7158, DoABC#3)
// _SafeStr_7376 = "_-R1U" (String#8347, DoABC#3)


