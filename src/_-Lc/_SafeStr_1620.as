// by nota

//_-Lc._SafeStr_1620

package _-Lc
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1620 
    {

        private var _SafeStr_3820:int;
        private var _name:String;
        private var _SafeStr_4880:String;
        private var _SafeStr_3834:String;
        private var _SafeStr_3819:String;

        public function _SafeStr_1620(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_3820 = _arg_1.readInteger();
            _name = _arg_1.readString();
            _SafeStr_4880 = _arg_1.readString();
            _SafeStr_3834 = _arg_1.readString();
            _SafeStr_3819 = _arg_1.readString();
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get motto():String
        {
            return (_SafeStr_4880);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }


    }
}//package _-Lc

// _SafeStr_1620 = "_-V1f" (String#8625, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)
// _SafeStr_3834 = "_-tK" (String#10279, DoABC#3)
// _SafeStr_4880 = "_-v1" (String#10374, DoABC#3)


