// by nota

//_-x1P._SafeStr_1568

package _-x1P
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1568 
    {

        private var _SafeStr_7765:int;
        private var _SafeStr_7766:int;
        private var _SafeStr_5240:int;
        private var _SafeStr_7605:int;
        private var _SafeStr_7767:_SafeStr_1647;

        public function _SafeStr_1568(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_7765 = _arg_1.readInteger();
            _SafeStr_7766 = _arg_1.readInteger();
            _SafeStr_5240 = _arg_1.readInteger();
            _SafeStr_7605 = _arg_1.readInteger();
            _SafeStr_7767 = new _SafeStr_1647(_arg_1);
        }

        public function get callId():int
        {
            return (_SafeStr_7765);
        }

        public function get callerUserId():int
        {
            return (_SafeStr_7766);
        }

        public function get reportedUserId():int
        {
            return (_SafeStr_5240);
        }

        public function get chatRecordId():int
        {
            return (_SafeStr_7605);
        }

        public function get chatRecord():_SafeStr_1647
        {
            return (_SafeStr_7767);
        }


    }
}//package _-x1P

// _SafeStr_1568 = "_-V1L" (String#8610, DoABC#3)
// _SafeStr_1647 = "_-WG" (String#8737, DoABC#3)
// _SafeStr_5240 = "_-T19" (String#8474, DoABC#3)
// _SafeStr_7605 = "_-cQ" (String#9142, DoABC#3)
// _SafeStr_7765 = "_-r1e" (String#10136, DoABC#3)
// _SafeStr_7766 = "_-SX" (String#8450, DoABC#3)
// _SafeStr_7767 = "_-31c" (String#6725, DoABC#3)


