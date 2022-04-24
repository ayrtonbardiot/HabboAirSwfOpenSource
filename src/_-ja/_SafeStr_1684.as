// by nota

//_-Ja._SafeStr_1684

package _-Ja
{
    [SecureSWF(rename="true")]
    public class _SafeStr_1684 
    {

        private var _SafeStr_6071:int;
        private var _SafeStr_7326:int;


        public function getCopy():_SafeStr_1684
        {
            var _local_1:_SafeStr_1684 = new _SafeStr_1684();
            _local_1._SafeStr_6071 = this._SafeStr_6071;
            _local_1._SafeStr_7326 = this._SafeStr_7326;
            return (_local_1);
        }

        public function set pos(_arg_1:int):void
        {
            this._SafeStr_6071 = _arg_1;
        }

        public function set imgId(_arg_1:int):void
        {
            this._SafeStr_7326 = _arg_1;
        }

        public function get pos():int
        {
            return (_SafeStr_6071);
        }

        public function get imgId():int
        {
            return (_SafeStr_7326);
        }


    }
}//package _-Ja

// _SafeStr_1684 = "_-810" (String#7067, DoABC#3)
// _SafeStr_6071 = "_-f1V" (String#9336, DoABC#3)
// _SafeStr_7326 = "_-Er" (String#7523, DoABC#3)


