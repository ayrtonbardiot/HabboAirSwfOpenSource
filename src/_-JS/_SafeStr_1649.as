// by nota

//_-JS._SafeStr_1649

package _-JS
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1649 
    {

        private var _SafeStr_4313:int;
        private var _requesterName:String;
        private var _SafeStr_4625:int;
        private var _figureString:String;

        public function _SafeStr_1649(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4313 = _arg_1.readInteger();
            _requesterName = _arg_1.readString();
            _figureString = _arg_1.readString();
            _SafeStr_4625 = _SafeStr_4313;
        }

        public function get requestId():int
        {
            return (_SafeStr_4313);
        }

        public function get requesterName():String
        {
            return (_requesterName);
        }

        public function get requesterUserId():int
        {
            return (_SafeStr_4625);
        }

        public function get figureString():String
        {
            return (_figureString);
        }


    }
}//package _-JS

// _SafeStr_1649 = "_-v1E" (String#10382, DoABC#3)
// _SafeStr_4313 = "_-B7" (String#7324, DoABC#3)
// _SafeStr_4625 = "_-Z5" (String#8928, DoABC#3)


