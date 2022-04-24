// by nota

//_-Ja._SafeStr_1559

package _-Ja
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1559 
    {

        private var _SafeStr_7281:int;
        private var _SafeStr_4784:int;
        private var _SafeStr_7282:int;

        public function _SafeStr_1559(_arg_1:IMessageDataWrapper, _arg_2:int=0, _arg_3:int=0)
        {
            _SafeStr_7281 = _arg_2;
            _SafeStr_4784 = _arg_3;
            if (_arg_1 != null)
            {
                _SafeStr_7281 = _arg_1.readInteger();
                _SafeStr_4784 = _arg_1.readInteger();
                _SafeStr_7282 = _arg_1.readInteger();
            };
        }

        public function get goalId():int
        {
            return (_SafeStr_7281);
        }

        public function get pageIndex():int
        {
            return (_SafeStr_4784);
        }

        public function get pageCount():int
        {
            return (_SafeStr_7282);
        }


    }
}//package _-Ja

// _SafeStr_1559 = "_-S7" (String#8432, DoABC#3)
// _SafeStr_4784 = "_-vz" (String#10434, DoABC#3)
// _SafeStr_7281 = "_-O1q" (String#8161, DoABC#3)
// _SafeStr_7282 = "_-D9" (String#7442, DoABC#3)


