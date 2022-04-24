// by nota

//_-l12._SafeStr_1555

package _-l12
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1555 extends _SafeStr_1554 
    {

        private var _SafeStr_4028:int;

        public function _SafeStr_1555(_arg_1:IMessageDataWrapper)
        {
            super(_arg_1);
            _SafeStr_4028 = _arg_1.readInteger();
        }

        public function get type():int
        {
            return (_SafeStr_4028);
        }

        override public function get code():int
        {
            return (_SafeStr_4028);
        }


    }
}//package _-l12

// _SafeStr_1554 = "_-W1B" (String#8667, DoABC#3)
// _SafeStr_1555 = "_-IL" (String#7746, DoABC#3)
// _SafeStr_4028 = "_-81R" (String#7081, DoABC#3)


