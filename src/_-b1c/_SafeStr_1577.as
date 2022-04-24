// by nota

//_-b1c._SafeStr_1577

package _-b1c
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1577 
    {

        private var _SafeStr_7173:int;
        private var _name:String;
        private var _SafeStr_3623:int;
        private var _SafeStr_3819:String;
        private var _SafeStr_7108:String;

        public function _SafeStr_1577(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_7173 = _arg_1.readInteger();
            _name = _arg_1.readString();
            _SafeStr_3623 = _arg_1.readInteger();
            _SafeStr_3819 = _arg_1.readString();
            _SafeStr_7108 = _arg_1.readString();
        }

        public function dispose():void
        {
            _SafeStr_7173 = 0;
            _name = "";
            _SafeStr_3623 = 0;
            _SafeStr_3819 = "";
            _SafeStr_7108 = "";
        }

        public function get webId():int
        {
            return (_SafeStr_7173);
        }

        public function get name():String
        {
            return (_name);
        }

        public function get level():int
        {
            return (_SafeStr_3623);
        }

        public function get figure():String
        {
            return (_SafeStr_3819);
        }

        public function get owner():String
        {
            return (_SafeStr_7108);
        }


    }
}//package _-b1c

// _SafeStr_1577 = "_-i10" (String#9515, DoABC#3)
// _SafeStr_3623 = "_-OF" (String#8175, DoABC#3)
// _SafeStr_3819 = "_-T8" (String#8508, DoABC#3)
// _SafeStr_7108 = "_-x1v" (String#10543, DoABC#3)
// _SafeStr_7173 = "_-QV" (String#8321, DoABC#3)


