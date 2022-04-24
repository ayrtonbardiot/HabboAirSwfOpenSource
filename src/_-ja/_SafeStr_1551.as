// by nota

//_-Ja._SafeStr_1551

package _-Ja
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1551 
    {

        private var _SafeStr_4674:int;
        private var _SafeStr_7280:String;
        private var _SafeStr_4426:Boolean;

        public function _SafeStr_1551(_arg_1:IMessageDataWrapper)
        {
            _SafeStr_4674 = _arg_1.readInteger();
            _SafeStr_7280 = _arg_1.readString();
            _SafeStr_4426 = _arg_1.readBoolean();
        }

        public function get categoryId():int
        {
            return (_SafeStr_4674);
        }

        public function get categoryName():String
        {
            return (_SafeStr_7280);
        }

        public function get visible():Boolean
        {
            return (_SafeStr_4426);
        }


    }
}//package _-Ja

// _SafeStr_1551 = "_-J1A" (String#7770, DoABC#3)
// _SafeStr_4426 = "_-c1l" (String#9123, DoABC#3)
// _SafeStr_4674 = "_-k10" (String#9658, DoABC#3)
// _SafeStr_7280 = "_-wq" (String#10497, DoABC#3)


