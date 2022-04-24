// by nota

//_-t1I._SafeStr_1646

package _-t1I
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1646 
    {

        private var _SafeStr_7541:String;

        public function _SafeStr_1646(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_7541 = _arg_1.readString();
        }

        public function get perkId():String
        {
            return (_SafeStr_7541);
        }


    }
}//package _-t1I

// _SafeStr_1646 = "_-o1n" (String#9936, DoABC#3)
// _SafeStr_7541 = "_-z1R" (String#10661, DoABC#3)


