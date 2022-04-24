// by nota

//_-Ja._SafeStr_1659

package _-Ja
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1659 
    {

        private var _SafeStr_7320:String;
        private var _SafeStr_6279:int;

        public function _SafeStr_1659(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_7320 = _arg_1.readString();
            _SafeStr_6279 = _arg_1.readInteger();
        }

        public function get tagName():String
        {
            return (_SafeStr_7320);
        }

        public function get userCount():int
        {
            return (_SafeStr_6279);
        }


    }
}//package _-Ja

// _SafeStr_1659 = "_-bK" (String#9082, DoABC#3)
// _SafeStr_6279 = "_-tN" (String#10281, DoABC#3)
// _SafeStr_7320 = "_-JP" (String#7800, DoABC#3)


