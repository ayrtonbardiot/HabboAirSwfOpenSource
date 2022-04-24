// by nota

//_-a1d._SafeStr_1534

package _-a1d
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1534 
    {

        private var _SafeStr_5259:int;
        private var _SafeStr_7137:String;

        public function _SafeStr_1534(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_5259 = _arg_1.readInteger();
            _SafeStr_7137 = _arg_1.readString();
        }

        public function get count():int
        {
            return (_SafeStr_5259);
        }

        public function get furnitureClassName():String
        {
            return (_SafeStr_7137);
        }


    }
}//package _-a1d

// _SafeStr_1534 = "_-k1q" (String#9688, DoABC#3)
// _SafeStr_5259 = "_-61s" (String#6975, DoABC#3)
// _SafeStr_7137 = "_-322" (String#6736, DoABC#3)


