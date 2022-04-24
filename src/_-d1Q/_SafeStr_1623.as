// by nota

//_-d1Q._SafeStr_1623

package _-d1Q
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1623 
    {

        private var _SafeStr_4128:int;
        private var _SafeStr_5367:int;
        private var _SafeStr_7095:int;
        private var _name:String;
        private var _SafeStr_3819:String;
        private var _SafeStr_3834:String;

        public function _SafeStr_1623(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4128 = _arg_1.readInteger();
            _SafeStr_5367 = _arg_1.readInteger();
            _SafeStr_7095 = _arg_1.readInteger();
            _name = _arg_1.readString();
            _SafeStr_3819 = _arg_1.readString();
            _SafeStr_3834 = _arg_1.readString();
        }

        public function get userId():int
        {
            return (_SafeStr_4128);
        }

        public function get score():int
        {
            return (_SafeStr_5367);
        }

        public function get rank():int
        {
            return (_SafeStr_7095);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function get name():String
        {
            return (_name);
        }


    }
}//package _-d1Q

// _SafeStr_1623 = "_-g1X" (String#9399, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_3834 = "_-tK" (String#10279, DoABC#3)
// _SafeStr_4128 = "_-q1y" (String#10067, DoABC#3)
// _SafeStr_5367 = "_-z1J" (String#10657, DoABC#3)
// _SafeStr_7095 = "_-md" (String#9836, DoABC#3)


