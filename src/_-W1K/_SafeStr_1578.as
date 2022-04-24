// by nota

//_-W1K._SafeStr_1578

package _-W1K
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1578 
    {

        private var _SafeStr_3820:int;
        private var _fileName:String;
        private var _maskFileName:String;

        public function _SafeStr_1578(_arg_1:IMessageDataWrapper=null)
        {
            _SafeStr_3820 = _arg_1.readInteger();
            _fileName = _arg_1.readString();
            _maskFileName = _arg_1.readString();
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get fileName():String
        {
            return (_fileName);
        }

        public function get maskFileName():String
        {
            return (_maskFileName);
        }


    }
}//package _-W1K

// _SafeStr_1578 = "_-h5" (String#9486, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)


