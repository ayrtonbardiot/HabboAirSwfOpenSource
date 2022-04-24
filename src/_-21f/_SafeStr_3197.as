// by nota

//_-21f._SafeStr_3197

package _-21f
{
    import _-Ja._SafeStr_1569;

    [SecureSWF(rename="true")]
    public class _SafeStr_3197 
    {

        private var _SafeStr_4724:String;
        private var _SafeStr_4725:String;
        private var _SafeStr_4726:_SafeStr_1547;

        public function _SafeStr_3197(_arg_1:_SafeStr_1547)
        {
            _SafeStr_4724 = _arg_1.searchCodeOriginal;
            _SafeStr_4725 = _arg_1.filteringData;
            _SafeStr_4726 = _arg_1;
        }

        public function get searchCodeOriginal():String
        {
            return (_SafeStr_4724);
        }

        public function get filteringData():String
        {
            return (_SafeStr_4725);
        }

        public function get resultSet():_SafeStr_1547
        {
            return (_SafeStr_4726);
        }

        public function findGuestRoom(_arg_1:int):_SafeStr_1569
        {
            if (_SafeStr_4726 != null)
            {
                return (_SafeStr_4726.findGuestRoom(_arg_1));
            };
            return (null);
        }


    }
}//package _-21f

// _SafeStr_1547 = "_-E1O" (String#12956, DoABC#4)
// _SafeStr_1569 = "_-R1p" (String#1360, DoABC#4)
// _SafeStr_3197 = "_-fs" (String#4924, DoABC#4)
// _SafeStr_4724 = "_-sh" (String#17980, DoABC#4)
// _SafeStr_4725 = "_-O" (String#21827, DoABC#4)
// _SafeStr_4726 = "_-Cv" (String#13303, DoABC#4)


