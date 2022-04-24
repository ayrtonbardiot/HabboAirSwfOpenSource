// by nota

//_-B1i._SafeStr_1530

package _-B1i
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1530 
    {

        private var _SafeStr_3834:String;
        private var _figureString:String;

        public function _SafeStr_1530(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_3834 = _arg_1.readString();
            _figureString = _arg_1.readString();
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function get figureString():String
        {
            return (_figureString);
        }


    }
}//package _-B1i

// _SafeStr_1530 = "_-A1U" (String#7224, DoABC#3)
// _SafeStr_3834 = "_-tK" (String#10279, DoABC#3)


